import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('ff_smsKod');
    _safeInit(() {
      _phone = prefs.getString('ff_phone') ?? _phone;
    });
    _safeInit(() {
      _type = prefs.getInt('ff_type') ?? _type;
    });
    _safeInit(() {
      _idOrder = prefs.getString('ff_idOrder')?.ref ?? _idOrder;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _phone = '';
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
    prefs.setString('ff_phone', value);
  }

  int _type = 0;
  int get type => _type;
  set type(int value) {
    _type = value;
    prefs.setInt('ff_type', value);
  }

  String _kat = '';
  String get kat => _kat;
  set kat(String value) {
    _kat = value;
  }

  DocumentReference? _idOrder;
  DocumentReference? get idOrder => _idOrder;
  set idOrder(DocumentReference? value) {
    _idOrder = value;
    value != null
        ? prefs.setString('ff_idOrder', value.path)
        : prefs.remove('ff_idOrder');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
