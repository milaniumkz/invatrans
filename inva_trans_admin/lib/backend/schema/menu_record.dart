import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuRecord extends FirestoreRecord {
  MenuRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "idZav" field.
  DocumentReference? _idZav;
  DocumentReference? get idZav => _idZav;
  bool hasIdZav() => _idZav != null;

  // "cat" field.
  String? _cat;
  String get cat => _cat ?? '';
  bool hasCat() => _cat != null;

  // "power" field.
  bool? _power;
  bool get power => _power ?? false;
  bool hasPower() => _power != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _text = snapshotData['text'] as String?;
    _image = snapshotData['image'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _idZav = snapshotData['idZav'] as DocumentReference?;
    _cat = snapshotData['cat'] as String?;
    _power = snapshotData['power'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('menu');

  static Stream<MenuRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuRecord.fromSnapshot(s));

  static Future<MenuRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuRecord.fromSnapshot(s));

  static MenuRecord fromSnapshot(DocumentSnapshot snapshot) => MenuRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuRecordData({
  String? title,
  String? text,
  String? image,
  double? price,
  DocumentReference? idZav,
  String? cat,
  bool? power,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'text': text,
      'image': image,
      'price': price,
      'idZav': idZav,
      'cat': cat,
      'power': power,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuRecordDocumentEquality implements Equality<MenuRecord> {
  const MenuRecordDocumentEquality();

  @override
  bool equals(MenuRecord? e1, MenuRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.text == e2?.text &&
        e1?.image == e2?.image &&
        e1?.price == e2?.price &&
        e1?.idZav == e2?.idZav &&
        e1?.cat == e2?.cat &&
        e1?.power == e2?.power;
  }

  @override
  int hash(MenuRecord? e) => const ListEquality().hash(
      [e?.title, e?.text, e?.image, e?.price, e?.idZav, e?.cat, e?.power]);

  @override
  bool isValidKey(Object? o) => o is MenuRecord;
}
