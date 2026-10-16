import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inva_trans/auth/firebase_auth/firebase_auth_manager.dart';
import 'package:inva_trans/pages/chat_page/chat_page_widget.dart';
import 'package:inva_trans/backend/backend.dart';

class TestPhoneAuth extends FirebaseAuthPlatform {
  bool failSending = false;
  bool failIntegrity = false;
  final recaptchaSettings = <bool?>[];
  PhoneAuthCredential? submittedCredential;

  @override
  FirebaseAuthPlatform delegateFor({required FirebaseApp app}) => this;

  @override
  FirebaseAuthPlatform setInitialValues(
          {dynamic currentUser, String? languageCode}) =>
      this;

  @override
  Future<void> verifyPhoneNumber({
    String? phoneNumber,
    PhoneMultiFactorInfo? multiFactorInfo,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
    Duration timeout = const Duration(seconds: 30),
    int? forceResendingToken,
    MultiFactorSession? multiFactorSession,
    String? autoRetrievedSmsCodeForTesting,
  }) async {
    if (failIntegrity) {
      failIntegrity = false;
      verificationFailed(FirebaseAuthException(
          code: 'app-not-authorized',
          message: 'Invalid app info in play_integrity_token'));
    } else if (failSending) {
      verificationFailed(FirebaseAuthException(code: 'quota-exceeded'));
    } else {
      codeSent('server-verification-id', null);
    }
  }

  @override
  Future<void> setSettings(
      {bool appVerificationDisabledForTesting = false,
      String? userAccessGroup,
      String? phoneNumber,
      String? smsCode,
      bool? forceRecaptchaFlow}) async {
    expect(appVerificationDisabledForTesting, isFalse);
    recaptchaSettings.add(forceRecaptchaFlow);
  }

  @override
  Future<UserCredentialPlatform> signInWithCredential(
      AuthCredential credential) async {
    submittedCredential = credential as PhoneAuthCredential;
    throw FirebaseAuthException(
        code: 'invalid-verification-code', message: 'Неверный код');
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupFirebaseCoreMocks();
  final platform = TestPhoneAuth();

  setUpAll(() async {
    await Firebase.initializeApp();
    FirebaseAuthPlatform.instance = platform;
  });

  Future<BuildContext> mount(WidgetTester tester) async {
    late BuildContext result;
    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: Builder(builder: (context) {
      result = context;
      return const SizedBox();
    }))));
    return result;
  }

  testWidgets(
      'SMS uses Firebase verification session and server rejects wrong code',
      (tester) async {
    final context = await mount(tester);
    final manager = FirebaseAuthManager();
    var codeSent = false;
    await manager.beginPhoneAuth(
        context: context,
        phoneNumber: '+77012345678',
        onCodeSent: (_) => codeSent = true);
    expect(codeSent, isTrue);
    final user =
        await manager.verifySmsCode(context: context, smsCode: '123456');
    expect(
        platform.submittedCredential?.verificationId, 'server-verification-id');
    expect(platform.submittedCredential?.smsCode, '123456');
    expect(user, isNull);
    await tester.pump();
    expect(find.textContaining('Неверный код'), findsOneWidget);
  });

  testWidgets('Sending failure does not navigate to code entry',
      (tester) async {
    final context = await mount(tester);
    platform.failSending = true;
    var codeSent = false;
    expect(
        await FirebaseAuthManager().beginPhoneAuth(
            context: context,
            phoneNumber: '+77012345678',
            onCodeSent: (_) => codeSent = true),
        isFalse);
    expect(codeSent, isFalse);
    platform.failSending = false;
  });

  testWidgets('Code entry without a session requires a new SMS',
      (tester) async {
    final context = await mount(tester);
    expect(
        await FirebaseAuthManager()
            .verifySmsCode(context: context, smsCode: '123456'),
        isNull);
    await tester.pump();
    expect(find.textContaining('Запросите новый'), findsOneWidget);
  });

  testWidgets(
      'Integrity failure retries with reCAPTCHA and restores verification settings',
      (tester) async {
    final context = await mount(tester);
    platform.failIntegrity = true;
    platform.recaptchaSettings.clear();
    var codeSent = false;
    expect(
        await FirebaseAuthManager().beginPhoneAuth(
            context: context,
            phoneNumber: '+77012345678',
            onCodeSent: (_) => codeSent = true),
        isTrue);
    expect(codeSent, isTrue);
    expect(platform.recaptchaSettings, [true, false]);
  });

  testWidgets(
      'Chat without parameters shows recovery screen instead of crashing',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChatPageWidget()));
    expect(find.textContaining('Чат не выбран'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  test(
      'Order data preserves pickup date and transport, and supports older orders',
      () {
    final ref = FirebaseFirestore.instance.collection('order').doc('test');
    final pickup = DateTime(2026, 10, 20);
    final data = createOrderRecordData(
        date: DateTime(2026, 10, 16), pickupDate: pickup, transportType: 2);
    final order = OrderRecord.getDocumentFromData(data, ref);
    expect(order.pickupDate, pickup);
    expect(order.transportLabel, 'На коляске');
    final oldOrder = OrderRecord.getDocumentFromData({}, ref);
    expect(oldOrder.pickupDate, isNull);
    expect(oldOrder.transportLabel, isEmpty);
  });
}
