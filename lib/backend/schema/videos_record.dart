import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "postedDate" field.
  DateTime? _postedDate;
  DateTime? get postedDate => _postedDate;
  bool hasPostedDate() => _postedDate != null;

  // "posytedBY_ref" field.
  DocumentReference? _posytedBYRef;
  DocumentReference? get posytedBYRef => _posytedBYRef;
  bool hasPosytedBYRef() => _posytedBYRef != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "Likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "descrption" field.
  String? _descrption;
  String get descrption => _descrption ?? '';
  bool hasDescrption() => _descrption != null;

  void _initializeFields() {
    _postedDate = snapshotData['postedDate'] as DateTime?;
    _posytedBYRef = snapshotData['posytedBY_ref'] as DocumentReference?;
    _video = snapshotData['video'] as String?;
    _likes = castToType<int>(snapshotData['Likes']);
    _title = snapshotData['title'] as String?;
    _descrption = snapshotData['descrption'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  DateTime? postedDate,
  DocumentReference? posytedBYRef,
  String? video,
  int? likes,
  String? title,
  String? descrption,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postedDate': postedDate,
      'posytedBY_ref': posytedBYRef,
      'video': video,
      'Likes': likes,
      'title': title,
      'descrption': descrption,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosRecordDocumentEquality implements Equality<VideosRecord> {
  const VideosRecordDocumentEquality();

  @override
  bool equals(VideosRecord? e1, VideosRecord? e2) {
    return e1?.postedDate == e2?.postedDate &&
        e1?.posytedBYRef == e2?.posytedBYRef &&
        e1?.video == e2?.video &&
        e1?.likes == e2?.likes &&
        e1?.title == e2?.title &&
        e1?.descrption == e2?.descrption;
  }

  @override
  int hash(VideosRecord? e) => const ListEquality().hash([
        e?.postedDate,
        e?.posytedBYRef,
        e?.video,
        e?.likes,
        e?.title,
        e?.descrption
      ]);

  @override
  bool isValidKey(Object? o) => o is VideosRecord;
}
