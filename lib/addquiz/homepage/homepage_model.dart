import '/addquiz/dashboard/photoupload/photoupload_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/aiiiiii_widget.dart';
import '/components/preeeeeee_widget.dart';
import '/components/quizsets_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'homepage_widget.dart' show HomepageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomepageModel extends FlutterFlowModel<HomepageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for Preeeeeee component.
  late PreeeeeeeModel preeeeeeeModel;
  // Model for aiiiiii component.
  late AiiiiiiModel aiiiiiiModel;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // State field(s) for Row widget.
  ScrollController? rowController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for Row widget.
  ScrollController? rowController2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    preeeeeeeModel = createModel(context, () => PreeeeeeeModel());
    aiiiiiiModel = createModel(context, () => AiiiiiiModel());
    rowController1 = ScrollController();
    listViewController = ScrollController();
    rowController2 = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    preeeeeeeModel.dispose();
    aiiiiiiModel.dispose();
    rowController1?.dispose();
    listViewController?.dispose();
    rowController2?.dispose();
  }

  /// Action blocks are added here.

  Future cccc(BuildContext context) async {}

  /// Additional helper methods are added here.
}
