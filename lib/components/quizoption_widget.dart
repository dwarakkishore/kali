import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quizoption_model.dart';
export 'quizoption_model.dart';

class QuizoptionWidget extends StatefulWidget {
  const QuizoptionWidget({
    Key? key,
    required this.questionnum,
    required this.questionname,
    bool? istrue,
  })  : this.istrue = istrue ?? false,
        super(key: key);

  final String? questionnum;
  final String? questionname;
  final bool istrue;

  @override
  _QuizoptionWidgetState createState() => _QuizoptionWidgetState();
}

class _QuizoptionWidgetState extends State<QuizoptionWidget> {
  late QuizoptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizoptionModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('QUIZOPTION_Container_iv6nlsfi_ON_TAP');
        if (widget.istrue) {
          if (_model.isanswered != null) {
            logFirebaseEvent('Container_update_component_state');
            setState(() {
              _model.isanswered = true;
            });
            logFirebaseEvent('Container_update_app_state');
            setState(() {
              FFAppState().completedquestions =
                  FFAppState().completedquestions + -1;
            });
            logFirebaseEvent('Container_update_app_state');
            setState(() {
              FFAppState().score = FFAppState().score + -1;
            });
          } else {
            logFirebaseEvent('Container_update_app_state');
            setState(() {
              FFAppState().completedquestions =
                  FFAppState().completedquestions + 1;
            });
            logFirebaseEvent('Container_update_component_state');
            setState(() {
              _model.isanswered = true;
            });
            logFirebaseEvent('Container_update_app_state');
            setState(() {
              FFAppState().score = FFAppState().score + 1;
            });
          }
        } else {
          if (_model.isanswered != null) {
            logFirebaseEvent('Container_update_component_state');
            setState(() {
              _model.isanswered = null;
            });
            logFirebaseEvent('Container_update_app_state');
            setState(() {
              FFAppState().completedquestions =
                  FFAppState().completedquestions + -1;
            });
          } else {
            logFirebaseEvent('Container_update_component_state');
            setState(() {
              _model.isanswered = false;
            });
            logFirebaseEvent('Container_update_app_state');
            setState(() {
              FFAppState().completedquestions =
                  FFAppState().completedquestions + 1;
            });
          }
        }
      },
      onLongPress: () async {
        logFirebaseEvent('QUIZOPTION_Container_iv6nlsfi_ON_LONG_PR');
        if (widget.istrue) {
          if (_model.isanswered != null) {
            logFirebaseEvent('Container_update_component_state');
            setState(() {
              _model.isanswered = true;
            });
            logFirebaseEvent('Container_update_app_state');
            setState(() {
              FFAppState().completedquestions =
                  FFAppState().completedquestions + -1;
            });
            logFirebaseEvent('Container_update_app_state');
            setState(() {
              FFAppState().score = FFAppState().score + -1;
            });
          } else {
            logFirebaseEvent('Container_update_component_state');
            setState(() {
              _model.isanswered = true;
            });
            logFirebaseEvent('Container_update_app_state');
            setState(() {
              FFAppState().completedquestions =
                  FFAppState().completedquestions + 1;
            });
            logFirebaseEvent('Container_update_app_state');
            setState(() {
              FFAppState().score = FFAppState().score + 1;
            });
          }
        } else {
          if (_model.isanswered != null) {
            logFirebaseEvent('Container_update_component_state');
            setState(() {
              _model.isanswered = null;
            });
            logFirebaseEvent('Container_update_app_state');
            setState(() {
              FFAppState().completedquestions =
                  FFAppState().completedquestions + -1;
            });
          } else {
            logFirebaseEvent('Container_update_component_state');
            setState(() {
              _model.isanswered = false;
            });
            logFirebaseEvent('Container_update_app_state');
            setState(() {
              FFAppState().completedquestions =
                  FFAppState().completedquestions + 1;
            });
          }
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            () {
              if (_model.isanswered == true) {
                return Color(0xFF169E59);
              } else if (_model.isanswered == false) {
                return Color(0xFF169E59);
              } else {
                return Color(0xDAFFFFFF);
              }
            }(),
            Color(0xFFFFCBCB),
          ),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: () {
              if (_model.isanswered == true) {
                return Color(0xFF169E59);
              } else if (_model.isanswered == false) {
                return Color(0xFF169E59);
              } else {
                return Colors.white;
              }
            }(),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: () {
                        if (_model.isanswered == true) {
                          return Color(0xFF169E59);
                        } else if (_model.isanswered == false) {
                          return Color(0xFF169E59);
                        } else {
                          return Colors.white;
                        }
                      }(),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: () {
                          if (_model.isanswered == true) {
                            return Color(0xFF169E59);
                          } else if (_model.isanswered == false) {
                            return Color(0xFF169E59);
                          } else {
                            return Colors.white;
                          }
                        }(),
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Text(
                        widget.questionnum!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        widget.questionname!.maybeHandleOverflow(
                          maxChars: 80,
                          replacement: '…',
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
