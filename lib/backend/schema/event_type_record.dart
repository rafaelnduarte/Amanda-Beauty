import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventTypeRecord extends FirestoreRecord {
  EventTypeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "output" field.
  String? _output;
  String get output => _output ?? '';
  bool hasOutput() => _output != null;

  void _initializeFields() {
    _output = snapshotData['output'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event_type');

  static Stream<EventTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventTypeRecord.fromSnapshot(s));

  static Future<EventTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventTypeRecord.fromSnapshot(s));

  static EventTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventTypeRecordData({
  String? output,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'output': output,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventTypeRecordDocumentEquality implements Equality<EventTypeRecord> {
  const EventTypeRecordDocumentEquality();

  @override
  bool equals(EventTypeRecord? e1, EventTypeRecord? e2) {
    return e1?.output == e2?.output;
  }

  @override
  int hash(EventTypeRecord? e) => const ListEquality().hash([e?.output]);

  @override
  bool isValidKey(Object? o) => o is EventTypeRecord;
}
