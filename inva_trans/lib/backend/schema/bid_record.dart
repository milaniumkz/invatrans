import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BidRecord extends FirestoreRecord {
  BidRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "idOrder" field.
  DocumentReference? _idOrder;
  DocumentReference? get idOrder => _idOrder;
  bool hasIdOrder() => _idOrder != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "idDriver" field.
  DocumentReference? _idDriver;
  DocumentReference? get idDriver => _idDriver;
  bool hasIdDriver() => _idDriver != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _idOrder = snapshotData['idOrder'] as DocumentReference?;
    _price = castToType<double>(snapshotData['price']);
    _date = snapshotData['date'] as DateTime?;
    _idDriver = snapshotData['idDriver'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bid');

  static Stream<BidRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BidRecord.fromSnapshot(s));

  static Future<BidRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BidRecord.fromSnapshot(s));

  static BidRecord fromSnapshot(DocumentSnapshot snapshot) => BidRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BidRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BidRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BidRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BidRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBidRecordData({
  DocumentReference? idOrder,
  double? price,
  DateTime? date,
  DocumentReference? idDriver,
  int? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idOrder': idOrder,
      'price': price,
      'date': date,
      'idDriver': idDriver,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class BidRecordDocumentEquality implements Equality<BidRecord> {
  const BidRecordDocumentEquality();

  @override
  bool equals(BidRecord? e1, BidRecord? e2) {
    return e1?.idOrder == e2?.idOrder &&
        e1?.price == e2?.price &&
        e1?.date == e2?.date &&
        e1?.idDriver == e2?.idDriver &&
        e1?.status == e2?.status;
  }

  @override
  int hash(BidRecord? e) => const ListEquality()
      .hash([e?.idOrder, e?.price, e?.date, e?.idDriver, e?.status]);

  @override
  bool isValidKey(Object? o) => o is BidRecord;
}
