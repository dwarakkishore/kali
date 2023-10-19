import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecentannRecord extends FirestoreRecord {
  RecentannRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "des" field.
  String? _des;
  String get des => _des ?? '';
  bool hasDes() => _des != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _thumbnail = snapshotData['thumbnail'] as String?;
    _title = snapshotData['title'] as String?;
    _des = snapshotData['des'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recentann');

  static Stream<RecentannRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecentannRecord.fromSnapshot(s));

  static Future<RecentannRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecentannRecord.fromSnapshot(s));

  static RecentannRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecentannRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecentannRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecentannRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecentannRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecentannRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecentannRecordData({
  String? thumbnail,
  String? title,
  String? des,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'thumbnail': thumbnail,
      'title': title,
      'des': des,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecentannRecordDocumentEquality implements Equality<RecentannRecord> {
  const RecentannRecordDocumentEquality();

  @override
  bool equals(RecentannRecord? e1, RecentannRecord? e2) {
    return e1?.thumbnail == e2?.thumbnail &&
        e1?.title == e2?.title &&
        e1?.des == e2?.des &&
        e1?.date == e2?.date;
  }

  @override
  int hash(RecentannRecord? e) =>
      const ListEquality().hash([e?.thumbnail, e?.title, e?.des, e?.date]);

  @override
  bool isValidKey(Object? o) => o is RecentannRecord;
}
