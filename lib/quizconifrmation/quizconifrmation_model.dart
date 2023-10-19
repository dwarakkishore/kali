import '/backend/backend.dart';
import '/components/confirm_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'quizconifrmation_widget.dart' show QuizconifrmationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizconifrmationModel extends FlutterFlowModel<QuizconifrmationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Confirm component.
  late ConfirmModel confirmModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    confirmModel = createModel(context, () => ConfirmModel());
  }

  void dispose() {
    unfocusNode.dispose();
    confirmModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
