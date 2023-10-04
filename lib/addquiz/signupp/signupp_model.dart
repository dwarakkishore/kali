import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'signupp_widget.dart' show SignuppWidget;
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SignuppModel extends FlutterFlowModel<SignuppWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for mobile widget.
  TextEditingController? mobileController;
  String? Function(BuildContext, String?)? mobileControllerValidator;
  // State field(s) for pass widget.
  TextEditingController? passController;
  late bool passVisibility;
  String? Function(BuildContext, String?)? passControllerValidator;
  // State field(s) for passc widget.
  TextEditingController? passcController;
  late bool passcVisibility;
  String? Function(BuildContext, String?)? passcControllerValidator;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passVisibility = false;
    passcVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    textController1?.dispose();
    emailController?.dispose();
    mobileController?.dispose();
    passController?.dispose();
    passcController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
