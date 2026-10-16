import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ZavRecord extends FirestoreRecord {
  ZavRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "chek" field.
  double? _chek;
  double get chek => _chek ?? 0.0;
  bool hasChek() => _chek != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "recomendation" field.
  bool? _recomendation;
  bool get recomendation => _recomendation ?? false;
  bool hasRecomendation() => _recomendation != null;

  // "categories" field.
  List<String>? _categories;
  List<String> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  // "kat" field.
  String? _kat;
  String get kat => _kat ?? '';
  bool hasKat() => _kat != null;

  // "procent" field.
  double? _procent;
  double get procent => _procent ?? 0.0;
  bool hasProcent() => _procent != null;

  // "open" field.
  bool? _open;
  bool get open => _open ?? false;
  bool hasOpen() => _open != null;

  // "pnO" field.
  String? _pnO;
  String get pnO => _pnO ?? '';
  bool hasPnO() => _pnO != null;

  // "pnDo" field.
  String? _pnDo;
  String get pnDo => _pnDo ?? '';
  bool hasPnDo() => _pnDo != null;

  // "vtO" field.
  String? _vtO;
  String get vtO => _vtO ?? '';
  bool hasVtO() => _vtO != null;

  // "vtDo" field.
  String? _vtDo;
  String get vtDo => _vtDo ?? '';
  bool hasVtDo() => _vtDo != null;

  // "srO" field.
  String? _srO;
  String get srO => _srO ?? '';
  bool hasSrO() => _srO != null;

  // "srDo" field.
  String? _srDo;
  String get srDo => _srDo ?? '';
  bool hasSrDo() => _srDo != null;

  // "chO" field.
  String? _chO;
  String get chO => _chO ?? '';
  bool hasChO() => _chO != null;

  // "chDo" field.
  String? _chDo;
  String get chDo => _chDo ?? '';
  bool hasChDo() => _chDo != null;

  // "ptO" field.
  String? _ptO;
  String get ptO => _ptO ?? '';
  bool hasPtO() => _ptO != null;

  // "ptDo" field.
  String? _ptDo;
  String get ptDo => _ptDo ?? '';
  bool hasPtDo() => _ptDo != null;

  // "sbO" field.
  String? _sbO;
  String get sbO => _sbO ?? '';
  bool hasSbO() => _sbO != null;

  // "sbDo" field.
  String? _sbDo;
  String get sbDo => _sbDo ?? '';
  bool hasSbDo() => _sbDo != null;

  // "vsO" field.
  String? _vsO;
  String get vsO => _vsO ?? '';
  bool hasVsO() => _vsO != null;

  // "vsDo" field.
  String? _vsDo;
  String get vsDo => _vsDo ?? '';
  bool hasVsDo() => _vsDo != null;

  // "idUser" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "top" field.
  bool? _top;
  bool get top => _top ?? false;
  bool hasTop() => _top != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _image = snapshotData['image'] as String?;
    _images = getDataList(snapshotData['images']);
    _text = snapshotData['text'] as String?;
    _chek = castToType<double>(snapshotData['chek']);
    _time = snapshotData['time'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _city = snapshotData['city'] as String?;
    _recomendation = snapshotData['recomendation'] as bool?;
    _categories = getDataList(snapshotData['categories']);
    _kat = snapshotData['kat'] as String?;
    _procent = castToType<double>(snapshotData['procent']);
    _open = snapshotData['open'] as bool?;
    _pnO = snapshotData['pnO'] as String?;
    _pnDo = snapshotData['pnDo'] as String?;
    _vtO = snapshotData['vtO'] as String?;
    _vtDo = snapshotData['vtDo'] as String?;
    _srO = snapshotData['srO'] as String?;
    _srDo = snapshotData['srDo'] as String?;
    _chO = snapshotData['chO'] as String?;
    _chDo = snapshotData['chDo'] as String?;
    _ptO = snapshotData['ptO'] as String?;
    _ptDo = snapshotData['ptDo'] as String?;
    _sbO = snapshotData['sbO'] as String?;
    _sbDo = snapshotData['sbDo'] as String?;
    _vsO = snapshotData['vsO'] as String?;
    _vsDo = snapshotData['vsDo'] as String?;
    _idUser = snapshotData['idUser'] as DocumentReference?;
    _top = snapshotData['top'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('zav');

  static Stream<ZavRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ZavRecord.fromSnapshot(s));

  static Future<ZavRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ZavRecord.fromSnapshot(s));

  static ZavRecord fromSnapshot(DocumentSnapshot snapshot) => ZavRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ZavRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ZavRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ZavRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ZavRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createZavRecordData({
  String? title,
  String? image,
  String? text,
  double? chek,
  String? time,
  double? rating,
  String? city,
  bool? recomendation,
  String? kat,
  double? procent,
  bool? open,
  String? pnO,
  String? pnDo,
  String? vtO,
  String? vtDo,
  String? srO,
  String? srDo,
  String? chO,
  String? chDo,
  String? ptO,
  String? ptDo,
  String? sbO,
  String? sbDo,
  String? vsO,
  String? vsDo,
  DocumentReference? idUser,
  bool? top,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'image': image,
      'text': text,
      'chek': chek,
      'time': time,
      'rating': rating,
      'city': city,
      'recomendation': recomendation,
      'kat': kat,
      'procent': procent,
      'open': open,
      'pnO': pnO,
      'pnDo': pnDo,
      'vtO': vtO,
      'vtDo': vtDo,
      'srO': srO,
      'srDo': srDo,
      'chO': chO,
      'chDo': chDo,
      'ptO': ptO,
      'ptDo': ptDo,
      'sbO': sbO,
      'sbDo': sbDo,
      'vsO': vsO,
      'vsDo': vsDo,
      'idUser': idUser,
      'top': top,
    }.withoutNulls,
  );

  return firestoreData;
}

class ZavRecordDocumentEquality implements Equality<ZavRecord> {
  const ZavRecordDocumentEquality();

  @override
  bool equals(ZavRecord? e1, ZavRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.text == e2?.text &&
        e1?.chek == e2?.chek &&
        e1?.time == e2?.time &&
        e1?.rating == e2?.rating &&
        e1?.city == e2?.city &&
        e1?.recomendation == e2?.recomendation &&
        listEquality.equals(e1?.categories, e2?.categories) &&
        e1?.kat == e2?.kat &&
        e1?.procent == e2?.procent &&
        e1?.open == e2?.open &&
        e1?.pnO == e2?.pnO &&
        e1?.pnDo == e2?.pnDo &&
        e1?.vtO == e2?.vtO &&
        e1?.vtDo == e2?.vtDo &&
        e1?.srO == e2?.srO &&
        e1?.srDo == e2?.srDo &&
        e1?.chO == e2?.chO &&
        e1?.chDo == e2?.chDo &&
        e1?.ptO == e2?.ptO &&
        e1?.ptDo == e2?.ptDo &&
        e1?.sbO == e2?.sbO &&
        e1?.sbDo == e2?.sbDo &&
        e1?.vsO == e2?.vsO &&
        e1?.vsDo == e2?.vsDo &&
        e1?.idUser == e2?.idUser &&
        e1?.top == e2?.top;
  }

  @override
  int hash(ZavRecord? e) => const ListEquality().hash([
        e?.title,
        e?.image,
        e?.images,
        e?.text,
        e?.chek,
        e?.time,
        e?.rating,
        e?.city,
        e?.recomendation,
        e?.categories,
        e?.kat,
        e?.procent,
        e?.open,
        e?.pnO,
        e?.pnDo,
        e?.vtO,
        e?.vtDo,
        e?.srO,
        e?.srDo,
        e?.chO,
        e?.chDo,
        e?.ptO,
        e?.ptDo,
        e?.sbO,
        e?.sbDo,
        e?.vsO,
        e?.vsDo,
        e?.idUser,
        e?.top
      ]);

  @override
  bool isValidKey(Object? o) => o is ZavRecord;
}
