import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bubblee_model.dart';
export 'bubblee_model.dart';

class BubbleeWidget extends StatefulWidget {
  const BubbleeWidget({
    Key? key,
    required this.messageText,
    required this.gptResponse,
    required this.userMessage,
  }) : super(key: key);

  final String? messageText;
  final bool? gptResponse;
  final bool? userMessage;

  @override
  _BubbleeWidgetState createState() => _BubbleeWidgetState();
}

class _BubbleeWidgetState extends State<BubbleeWidget> {
  late BubbleeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BubbleeModel());

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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (widget.gptResponse == true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 5.0, 0.0),
                    child: Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xB2272A32),
                                borderRadius: BorderRadius.circular(18.0),
                                border: Border.all(
                                  color: Color(0xB2272A32),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 10.0),
                                child: Text(
                                  widget.messageText!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          if (_model.copyhover ?? true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 31.0,
                                fillColor: Color(0x53222630),
                                hoverColor: Color(0xFF222630),
                                hoverIconColor: Colors.white,
                                icon: Icon(
                                  Icons.content_copy_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 15.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'BUBBLEE_content_copy_rounded_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_copy_to_clipboard');
                                  await Clipboard.setData(
                                      ClipboardData(text: widget.messageText!));
                                  logFirebaseEvent('IconButton_show_snack_bar');
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Copied to clipboard!',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 3100),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                    ),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                      onEnter: ((event) async {
                        setState(() => _model.mouseRegionHovered = true);
                        logFirebaseEvent(
                            'BUBBLEE_MouseRegion_ihp66ca1_ON_TOGGLE_O');
                        logFirebaseEvent('MouseRegion_update_component_state');
                        setState(() {
                          _model.copyhover = true;
                        });
                      }),
                      onExit: ((event) async {
                        setState(() => _model.mouseRegionHovered = false);
                        logFirebaseEvent(
                            'BUBBLEE_MouseRegion_ihp66ca1_ON_TOGGLE_O');
                        logFirebaseEvent('MouseRegion_update_component_state');
                        setState(() {
                          _model.copyhover = true;
                        });
                      }),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 100.0,
                      height: 20.0,
                      decoration: BoxDecoration(),
                    ),
                  ),
                ],
              ),
            ),
          if (widget.userMessage == true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 100.0,
                      height: 20.0,
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x0FFFFFFF),
                              borderRadius: BorderRadius.circular(18.0),
                              border: Border.all(
                                color: Color(0x0FFFFFFF),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 15.0, 10.0),
                              child: Text(
                                widget.messageText!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(7.0, 4.0, 7.0, 0.0),
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/Vectary_texture.png',
                          ).image,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xB700CA67),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
