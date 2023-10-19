import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'slider_track_model.dart';
export 'slider_track_model.dart';

class SliderTrackWidget extends StatefulWidget {
  const SliderTrackWidget({Key? key}) : super(key: key);

  @override
  _SliderTrackWidgetState createState() => _SliderTrackWidgetState();
}

class _SliderTrackWidgetState extends State<SliderTrackWidget>
    with TickerProviderStateMixin {
  late SliderTrackModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 550.ms),
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 550.ms,
          duration: 400.ms,
          begin: Offset(2.0, 2.0),
          end: Offset(1.0, 1.0),
        ),
        FadeEffect(
          curve: Curves.easeOut,
          delay: 550.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        BlurEffect(
          curve: Curves.easeOut,
          delay: 550.ms,
          duration: 400.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
        MoveEffect(
          curve: Curves.easeOut,
          delay: 550.ms,
          duration: 400.ms,
          begin: Offset(100.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SliderTrackModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.menu_book_outlined,
              color: Color(0xFF00B55A),
              size: 30.0,
            ),
          ],
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
