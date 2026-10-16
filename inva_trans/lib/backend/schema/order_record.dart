import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "idUser" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "ot" field.
  String? _ot;
  String get ot => _ot ?? '';
  bool hasOt() => _ot != null;

  // "kuda" field.
  String? _kuda;
  String get kuda => _kuda ?? '';
  bool hasKuda() => _kuda != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DateTime? get pickupDate => snapshotData['pickupDate'] as DateTime?;
  int get transportType => castToType<int>(snapshotData['transportType']) ?? 0;
  String get transportLabel =>
      const {
        1: 'На носилках',
        2: 'На коляске',
        3: 'На легковой'
      }[transportType] ??
      '';

  // "etaj" field.
  int? _etaj;
  int get etaj => _etaj ?? 0;
  bool hasEtaj() => _etaj != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "ves" field.
  double? _ves;
  double get ves => _ves ?? 0.0;
  bool hasVes() => _ves != null;

  // "idDriver" field.
  DocumentReference? _idDriver;
  DocumentReference? get idDriver => _idDriver;
  bool hasIdDriver() => _idDriver != null;

  void _initializeFields() {
    _idUser = snapshotData['idUser'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _ot = snapshotData['ot'] as String?;
    _kuda = snapshotData['kuda'] as String?;
    _city = snapshotData['city'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _date = snapshotData['date'] as DateTime?;
    _etaj = castToType<int>(snapshotData['etaj']);
    _comment = snapshotData['comment'] as String?;
    _ves = castToType<double>(snapshotData['ves']);
    _idDriver = snapshotData['idDriver'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  DocumentReference? idUser,
  int? status,
  String? ot,
  String? kuda,
  String? city,
  int? price,
  DateTime? date,
  DateTime? pickupDate,
  int? transportType,
  int? etaj,
  String? comment,
  double? ves,
  DocumentReference? idDriver,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idUser': idUser,
      'status': status,
      'ot': ot,
      'kuda': kuda,
      'city': city,
      'price': price,
      'date': date,
      'pickupDate': pickupDate,
      'transportType': transportType,
      'etaj': etaj,
      'comment': comment,
      'ves': ves,
      'idDriver': idDriver,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    return e1?.idUser == e2?.idUser &&
        e1?.status == e2?.status &&
        e1?.ot == e2?.ot &&
        e1?.kuda == e2?.kuda &&
        e1?.city == e2?.city &&
        e1?.price == e2?.price &&
        e1?.date == e2?.date &&
        e1?.pickupDate == e2?.pickupDate &&
        e1?.transportType == e2?.transportType &&
        e1?.etaj == e2?.etaj &&
        e1?.comment == e2?.comment &&
        e1?.ves == e2?.ves &&
        e1?.idDriver == e2?.idDriver;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.idUser,
        e?.status,
        e?.ot,
        e?.kuda,
        e?.city,
        e?.price,
        e?.date,
        e?.pickupDate,
        e?.transportType,
        e?.etaj,
        e?.comment,
        e?.ves,
        e?.idDriver
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
