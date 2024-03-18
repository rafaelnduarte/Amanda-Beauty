import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_event_widget.dart' show CreateEventWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateEventModel extends FlutterFlowModel<CreateEventWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> artists = [];
  void addToArtists(DocumentReference item) => artists.add(item);
  void removeFromArtists(DocumentReference item) => artists.remove(item);
  void removeAtIndexFromArtists(int index) => artists.removeAt(index);
  void insertAtIndexInArtists(int index, DocumentReference item) =>
      artists.insert(index, item);
  void updateArtistsAtIndex(int index, Function(DocumentReference) updateFn) =>
      artists[index] = updateFn(artists[index]);

  List<DocumentReference> services = [];
  void addToServices(DocumentReference item) => services.add(item);
  void removeFromServices(DocumentReference item) => services.remove(item);
  void removeAtIndexFromServices(int index) => services.removeAt(index);
  void insertAtIndexInServices(int index, DocumentReference item) =>
      services.insert(index, item);
  void updateServicesAtIndex(int index, Function(DocumentReference) updateFn) =>
      services[index] = updateFn(services[index]);

  List<DocumentReference> eventTypes = [];
  void addToEventTypes(DocumentReference item) => eventTypes.add(item);
  void removeFromEventTypes(DocumentReference item) => eventTypes.remove(item);
  void removeAtIndexFromEventTypes(int index) => eventTypes.removeAt(index);
  void insertAtIndexInEventTypes(int index, DocumentReference item) =>
      eventTypes.insert(index, item);
  void updateEventTypesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      eventTypes[index] = updateFn(eventTypes[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue1;
  FormFieldController<List<String>>? dropDownValueController1;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue2;
  FormFieldController<List<String>>? dropDownValueController2;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue3;
  FormFieldController<List<String>>? dropDownValueController3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
