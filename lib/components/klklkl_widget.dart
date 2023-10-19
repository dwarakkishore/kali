import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'klklkl_model.dart';
export 'klklkl_model.dart';

class KlklklWidget extends StatefulWidget {
  const KlklklWidget({
    Key? key,
    required this.questionname,
    bool? istrue,
  })  : this.istrue = istrue ?? false,
        super(key: key);

  final String? questionname;
  final bool istrue;

  @override
  _KlklklWidgetState createState() => _KlklklWidgetState();
}

class _KlklklWidgetState extends State<KlklklWidget> {
  late KlklklModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KlklklModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('KLKLKL_COMP_klklkl_ON_INIT_STATE');
      if (widget.istrue) {
        if (_model.isanswered != null) {
          logFirebaseEvent('klklkl_update_component_state');
          setState(() {
            _model.isanswered = true;
          });
          logFirebaseEvent('klklkl_update_app_state');
          setState(() {
            FFAppState().completedquestions =
                FFAppState().completedquestions + -1;
          });
          logFirebaseEvent('klklkl_update_app_state');
          setState(() {
            FFAppState().score = FFAppState().score + -1;
          });
        } else {
          logFirebaseEvent('klklkl_update_component_state');
          setState(() {
            _model.isanswered = false;
          });
          logFirebaseEvent('klklkl_update_app_state');
          setState(() {
            FFAppState().completedquestions =
                FFAppState().completedquestions + 1;
          });
          logFirebaseEvent('klklkl_update_app_state');
          setState(() {
            FFAppState().score = FFAppState().score + 1;
          });
        }
      } else {
        if (_model.isanswered != null) {
          logFirebaseEvent('klklkl_update_component_state');
          setState(() {
            _model.isanswered = null;
          });
          logFirebaseEvent('klklkl_update_app_state');
          setState(() {
            FFAppState().completedquestions =
                FFAppState().completedquestions + -1;
          });
        } else {
          logFirebaseEvent('klklkl_update_component_state');
          setState(() {
            _model.isanswered = false;
          });
          logFirebaseEvent('klklkl_update_app_state');
          setState(() {
            FFAppState().completedquestions =
                FFAppState().completedquestions + 1;
          });
        }
      }
    });

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: Theme(
        data: ThemeData(
          checkboxTheme: CheckboxThemeData(
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
        ),
        child: CheckboxListTile(
          value: _model.checkboxListTileValue ??= false,
          onChanged: (newValue) async {
            setState(() => _model.checkboxListTileValue = newValue!);
          },
          title: Text(
            widget.questionname!,
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          tileColor: FlutterFlowTheme.of(context).secondaryBackground,
          activeColor: Color(0xFF00B55A),
          checkColor: FlutterFlowTheme.of(context).info,
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ),
    );
  }
}
