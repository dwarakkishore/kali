import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_model.dart';
export 'quiz_model.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({
    Key? key,
    required this.questionname,
    bool? istrue,
  })  : this.istrue = istrue ?? false,
        super(key: key);

  final String? questionname;
  final bool istrue;

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  late QuizModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizModel());

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

    return Theme(
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
        activeColor: FlutterFlowTheme.of(context).primary,
        checkColor: FlutterFlowTheme.of(context).info,
        dense: false,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
