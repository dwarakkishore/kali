import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'preeeeeee_model.dart';
export 'preeeeeee_model.dart';

class PreeeeeeeWidget extends StatefulWidget {
  const PreeeeeeeWidget({Key? key}) : super(key: key);

  @override
  _PreeeeeeeWidgetState createState() => _PreeeeeeeWidgetState();
}

class _PreeeeeeeWidgetState extends State<PreeeeeeeWidget> {
  late PreeeeeeeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreeeeeeeModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
          child: Container(
            width: 340.0,
            height: 120.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 6.0,
                  color: Color(0x4B1A1F24),
                  offset: Offset(0.0, 2.0),
                )
              ],
              gradient: LinearGradient(
                colors: [Color(0x99009B50), Color(0xD7FFE700), Colors.black],
                stops: [0.0, 0.5, 1.0],
                begin: AlignmentDirectional(0.9, -1.0),
                end: AlignmentDirectional(-0.9, 1.0),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(1.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 12.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'gwb7mv6t' /* Later */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 11.0,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 10.0, 0.0),
                    child: Image.asset(
                      'assets/images/Asset_1.png',
                      width: 44.0,
                      height: 32.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'zla1wlx7' /* Upgrade to PRO */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.00, 0.00),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'wcvhbq7q' /* Upgrade to remove ads, unlimit... */,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                'd6wxha0a' /* Upgrade */,
                              ),
                              icon: Icon(
                                Icons.grade,
                                size: 10.0,
                              ),
                              options: FFButtonOptions(
                                width: 120.0,
                                height: 23.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.black,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Color(0x99006131),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
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
        ),
      ],
    );
  }
}
