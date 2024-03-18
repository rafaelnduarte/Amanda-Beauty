import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "services" field.
  List<DocumentReference>? _services;
  List<DocumentReference> get services => _services ?? const [];
  bool hasServices() => _services != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "artists" field.
  List<DocumentReference>? _artists;
  List<DocumentReference> get artists => _artists ?? const [];
  bool hasArtists() => _artists != null;

  // "bride_cellphone" field.
  String? _brideCellphone;
  String get brideCellphone => _brideCellphone ?? '';
  bool hasBrideCellphone() => _brideCellphone != null;

  // "event_planner_phone" field.
  String? _eventPlannerPhone;
  String get eventPlannerPhone => _eventPlannerPhone ?? '';
  bool hasEventPlannerPhone() => _eventPlannerPhone != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "event_types" field.
  List<DocumentReference>? _eventTypes;
  List<DocumentReference> get eventTypes => _eventTypes ?? const [];
  bool hasEventTypes() => _eventTypes != null;

  void _initializeFields() {
    _services = getDataList(snapshotData['services']);
    _date = snapshotData['date'] as DateTime?;
    _location = snapshotData['location'] as String?;
    _name = snapshotData['name'] as String?;
    _artists = getDataList(snapshotData['artists']);
    _brideCellphone = snapshotData['bride_cellphone'] as String?;
    _eventPlannerPhone = snapshotData['event_planner_phone'] as String?;
    _note = snapshotData['note'] as String?;
    _eventTypes = getDataList(snapshotData['event_types']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  DateTime? date,
  String? location,
  String? name,
  String? brideCellphone,
  String? eventPlannerPhone,
  String? note,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'location': location,
      'name': name,
      'bride_cellphone': brideCellphone,
      'event_planner_phone': eventPlannerPhone,
      'note': note,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.services, e2?.services) &&
        e1?.date == e2?.date &&
        e1?.location == e2?.location &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.artists, e2?.artists) &&
        e1?.brideCellphone == e2?.brideCellphone &&
        e1?.eventPlannerPhone == e2?.eventPlannerPhone &&
        e1?.note == e2?.note &&
        listEquality.equals(e1?.eventTypes, e2?.eventTypes);
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.services,
        e?.date,
        e?.location,
        e?.name,
        e?.artists,
        e?.brideCellphone,
        e?.eventPlannerPhone,
        e?.note,
        e?.eventTypes
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
