import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'welcomegpt_widget.dart' show WelcomegptWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class WelcomegptModel extends FlutterFlowModel<WelcomegptWidget> {
  ///  Local state fields for this page.

  List<MessageRecord> initialmessage = [];
  void addToInitialmessage(MessageRecord item) => initialmessage.add(item);
  void removeFromInitialmessage(MessageRecord item) =>
      initialmessage.remove(item);
  void removeAtIndexFromInitialmessage(int index) =>
      initialmessage.removeAt(index);
  void insertAtIndexInInitialmessage(int index, MessageRecord item) =>
      initialmessage.insert(index, item);
  void updateInitialmessageAtIndex(
          int index, Function(MessageRecord) updateFn) =>
      initialmessage[index] = updateFn(initialmessage[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  ChatRecord? chatRef;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  MessageRecord? msg1;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  MessageRecord? msg2;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  MessageRecord? msg3;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  MessageRecord? msg4;
  // Stores action output result for [Backend Call - API (AI chat)] action in TextField widget.
  ApiCallResponse? gptResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
