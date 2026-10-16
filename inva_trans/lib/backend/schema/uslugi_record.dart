import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UslugiRecord extends FirestoreRecord {
  UslugiRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "kat" field.
  String? _kat;
  String get kat => _kat ?? '';
  bool hasKat() => _kat != null;

  // "idUser" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _text = snapshotData['text'] as String?;
    _kat = snapshotData['kat'] as String?;
    _idUser = snapshotData['idUser'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('uslugi');

  static Stream<UslugiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UslugiRecord.fromSnapshot(s));

  static Future<UslugiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UslugiRecord.fromSnapshot(s));

  static UslugiRecord fromSnapshot(DocumentSnapshot snapshot) => UslugiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UslugiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UslugiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UslugiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UslugiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUslugiRecordData({
  String? title,
  int? price,
  String? text,
  String? kat,
  DocumentReference? idUser,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'price': price,
      'text': text,
      'kat': kat,
      'idUser': idUser,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class UslugiRecordDocumentEquality implements Equality<UslugiRecord> {
  const UslugiRecordDocumentEquality();

  @override
  bool equals(UslugiRecord? e1, UslugiRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.price == e2?.price &&
        e1?.text == e2?.text &&
        e1?.kat == e2?.kat &&
        e1?.idUser == e2?.idUser &&
        e1?.date == e2?.date;
  }

  @override
  int hash(UslugiRecord? e) => const ListEquality()
      .hash([e?.title, e?.price, e?.text, e?.kat, e?.idUser, e?.date]);

  @override
  bool isValidKey(Object? o) => o is UslugiRecord;
}
