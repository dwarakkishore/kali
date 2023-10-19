import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'slider_thumb_model.dart';
export 'slider_thumb_model.dart';

class SliderThumbWidget extends StatefulWidget {
  const SliderThumbWidget({Key? key}) : super(key: key);

  @override
  _SliderThumbWidgetState createState() => _SliderThumbWidgetState();
}

class _SliderThumbWidgetState extends State<SliderThumbWidget>
    with TickerProviderStateMixin {
  late SliderThumbModel _model;

  final animationsMap = {
    'mouseRegionOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(3.0, 3.0),
          end: Offset(1.0, 1.0),
        ),
        FadeEffect(
          curve: Curves.easeOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        BlurEffect(
          curve: Curves.easeOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(15.0, 15.0),
          end: Offset(0.0, 0.0),
        ),
        MoveEffect(
          curve: Curves.easeOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(-100.0, -50.0),
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
    _model = createModel(context, () => SliderThumbModel());

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

    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click ?? MouseCursor.defer,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF008E49),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_3,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 24.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'un8hvnch' /* Join us */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
      }),
    ).animateOnPageLoad(animationsMap['mouseRegionOnPageLoadAnimation']!);
  }
}
