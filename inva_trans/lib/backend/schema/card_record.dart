import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardRecord extends FirestoreRecord {
  CardRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "idUser" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "col" field.
  int? _col;
  int get col => _col ?? 0;
  bool hasCol() => _col != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "idTovar" field.
  DocumentReference? _idTovar;
  DocumentReference? get idTovar => _idTovar;
  bool hasIdTovar() => _idTovar != null;

  void _initializeFields() {
    _idUser = snapshotData['idUser'] as DocumentReference?;
    _col = castToType<int>(snapshotData['col']);
    _status = snapshotData['status'] as String?;
    _idTovar = snapshotData['idTovar'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('card');

  static Stream<CardRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardRecord.fromSnapshot(s));

  static Future<CardRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardRecord.fromSnapshot(s));

  static CardRecord fromSnapshot(DocumentSnapshot snapshot) => CardRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardRecordData({
  DocumentReference? idUser,
  int? col,
  String? status,
  DocumentReference? idTovar,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idUser': idUser,
      'col': col,
      'status': status,
      'idTovar': idTovar,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardRecordDocumentEquality implements Equality<CardRecord> {
  const CardRecordDocumentEquality();

  @override
  bool equals(CardRecord? e1, CardRecord? e2) {
    return e1?.idUser == e2?.idUser &&
        e1?.col == e2?.col &&
        e1?.status == e2?.status &&
        e1?.idTovar == e2?.idTovar;
  }

  @override
  int hash(CardRecord? e) =>
      const ListEquality().hash([e?.idUser, e?.col, e?.status, e?.idTovar]);

  @override
  bool isValidKey(Object? o) => o is CardRecord;
}
