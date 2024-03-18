import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_services_model.dart';
export 'dropdown_services_model.dart';

class DropdownServicesWidget extends StatefulWidget {
  const DropdownServicesWidget({super.key});

  @override
  State<DropdownServicesWidget> createState() => _DropdownServicesWidgetState();
}

class _DropdownServicesWidgetState extends State<DropdownServicesWidget> {
  late DropdownServicesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownServicesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
