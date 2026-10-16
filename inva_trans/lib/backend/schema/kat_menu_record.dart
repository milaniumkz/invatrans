import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KatMenuRecord extends FirestoreRecord {
  KatMenuRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('katMenu');

  static Stream<KatMenuRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KatMenuRecord.fromSnapshot(s));

  static Future<KatMenuRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KatMenuRecord.fromSnapshot(s));

  static KatMenuRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KatMenuRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KatMenuRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KatMenuRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KatMenuRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KatMenuRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKatMenuRecordData({
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class KatMenuRecordDocumentEquality implements Equality<KatMenuRecord> {
  const KatMenuRecordDocumentEquality();

  @override
  bool equals(KatMenuRecord? e1, KatMenuRecord? e2) {
    return e1?.title == e2?.title;
  }

  @override
  int hash(KatMenuRecord? e) => const ListEquality().hash([e?.title]);

  @override
  bool isValidKey(Object? o) => o is KatMenuRecord;
}
