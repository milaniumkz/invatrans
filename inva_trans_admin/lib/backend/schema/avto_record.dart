import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvtoRecord extends FirestoreRecord {
  AvtoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "parent" field.
  String? _parent;
  String get parent => _parent ?? '';
  bool hasParent() => _parent != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _parent = snapshotData['parent'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('avto');

  static Stream<AvtoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvtoRecord.fromSnapshot(s));

  static Future<AvtoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvtoRecord.fromSnapshot(s));

  static AvtoRecord fromSnapshot(DocumentSnapshot snapshot) => AvtoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvtoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvtoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvtoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvtoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvtoRecordData({
  String? title,
  String? parent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'parent': parent,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvtoRecordDocumentEquality implements Equality<AvtoRecord> {
  const AvtoRecordDocumentEquality();

  @override
  bool equals(AvtoRecord? e1, AvtoRecord? e2) {
    return e1?.title == e2?.title && e1?.parent == e2?.parent;
  }

  @override
  int hash(AvtoRecord? e) => const ListEquality().hash([e?.title, e?.parent]);

  @override
  bool isValidKey(Object? o) => o is AvtoRecord;
}
