import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confetie_model.dart';
export 'confetie_model.dart';

class ConfetieWidget extends StatefulWidget {
  const ConfetieWidget({Key? key}) : super(key: key);

  @override
  _ConfetieWidgetState createState() => _ConfetieWidgetState();
}

class _ConfetieWidgetState extends State<ConfetieWidget> {
  late ConfetieModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfetieModel());

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
      height: double.infinity,
      child: custom_widgets.ConfettiOverlay(
        width: double.infinity,
        height: double.infinity,
        loop: false,
        particleCount: 30,
        gravity: 50.0,
      ),
    );
  }
}
