import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'addquiz_model.dart';
export 'addquiz_model.dart';

class AddquizWidget extends StatefulWidget {
  const AddquizWidget({
    Key? key,
    this.quizset,
  }) : super(key: key);

  final DocumentReference? quizset;

  @override
  _AddquizWidgetState createState() => _AddquizWidgetState();
}

class _AddquizWidgetState extends State<AddquizWidget> {
  late AddquizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddquizModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'addquiz'});
    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    _model.textController4 ??= TextEditingController();
    _model.textController5 ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0x800B9D58),
        appBar: AppBar(
          backgroundColor: Color(0xFF0B9D58),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('ADDQUIZ_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '5qd7ze6s' /* add quiz */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 0.0),
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 6.0, 12.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController1,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'hbyfrinu' /* write question */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  maxLines: null,
                                  minLines: 1,
                                  keyboardType: TextInputType.multiline,
                                  validator: _model.textController1Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 12.0),
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 6.0, 12.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController2,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'mdf9pbla' /* option (a) */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  maxLines: null,
                                  minLines: 1,
                                  keyboardType: TextInputType.multiline,
                                  validator: _model.textController2Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 12.0, 12.0),
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Color(0xFF0B9D58),
                              ),
                            ),
                            child: Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: CircleBorder(),
                                ),
                                unselectedWidgetColor: Colors.black,
                              ),
                              child: Checkbox(
                                value: _model.checkboxValue1 ??= false,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.checkboxValue1 = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'ADDQUIZ_Checkbox_azn26nfx_ON_TOGGLE_ON');
                                    logFirebaseEvent(
                                        'Checkbox_update_page_state');
                                    setState(() {
                                      _model.optionA = true;
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'ADDQUIZ_Checkbox_azn26nfx_ON_TOGGLE_OFF');
                                    logFirebaseEvent(
                                        'Checkbox_update_page_state');
                                    setState(() {
                                      _model.optionA = false;
                                    });
                                  }
                                },
                                activeColor: Color(0xFF0B9D58),
                                checkColor: FlutterFlowTheme.of(context).info,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 12.0),
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 6.0, 12.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController3,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '2gzqwzam' /* option (b) */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  maxLines: null,
                                  minLines: 1,
                                  keyboardType: TextInputType.multiline,
                                  validator: _model.textController3Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 12.0, 12.0),
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Color(0xFF0B9D58),
                              ),
                            ),
                            child: Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: CircleBorder(),
                                ),
                                unselectedWidgetColor: Colors.black,
                              ),
                              child: Checkbox(
                                value: _model.checkboxValue2 ??= false,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.checkboxValue2 = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'ADDQUIZ_Checkbox_vf1xydnb_ON_TOGGLE_ON');
                                    logFirebaseEvent(
                                        'Checkbox_update_page_state');
                                    setState(() {
                                      _model.optionB = true;
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'ADDQUIZ_Checkbox_vf1xydnb_ON_TOGGLE_OFF');
                                    logFirebaseEvent(
                                        'Checkbox_update_page_state');
                                    setState(() {
                                      _model.optionB = false;
                                    });
                                  }
                                },
                                activeColor: Color(0xFF0B9D58),
                                checkColor: FlutterFlowTheme.of(context).info,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 12.0),
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 6.0, 12.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController4,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'vxfwv4r9' /* option (c) */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  maxLines: null,
                                  minLines: 1,
                                  keyboardType: TextInputType.multiline,
                                  validator: _model.textController4Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 12.0, 12.0),
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Color(0xFF0B9D58),
                              ),
                            ),
                            child: Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: CircleBorder(),
                                ),
                                unselectedWidgetColor: Colors.black,
                              ),
                              child: Checkbox(
                                value: _model.checkboxValue3 ??= false,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.checkboxValue3 = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'ADDQUIZ_Checkbox_2rl33yo1_ON_TOGGLE_ON');
                                    logFirebaseEvent(
                                        'Checkbox_update_page_state');
                                    setState(() {
                                      _model.optionC = true;
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'ADDQUIZ_Checkbox_2rl33yo1_ON_TOGGLE_OFF');
                                    logFirebaseEvent(
                                        'Checkbox_update_page_state');
                                    setState(() {
                                      _model.optionC = false;
                                    });
                                  }
                                },
                                activeColor: Color(0xFF0B9D58),
                                checkColor: FlutterFlowTheme.of(context).info,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 12.0),
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 6.0, 12.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController5,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'oxaiz856' /* option (d) */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  maxLines: null,
                                  minLines: 1,
                                  keyboardType: TextInputType.multiline,
                                  validator: _model.textController5Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 12.0, 12.0),
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Color(0xFF0B9D58),
                              ),
                            ),
                            child: Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: CircleBorder(),
                                ),
                                unselectedWidgetColor: Colors.black,
                              ),
                              child: Checkbox(
                                value: _model.checkboxValue4 ??= false,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.checkboxValue4 = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'ADDQUIZ_Checkbox_o2atv8pp_ON_TOGGLE_ON');
                                    logFirebaseEvent(
                                        'Checkbox_update_page_state');
                                    setState(() {
                                      _model.optionD = true;
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'ADDQUIZ_Checkbox_o2atv8pp_ON_TOGGLE_OFF');
                                    logFirebaseEvent(
                                        'Checkbox_update_page_state');
                                    setState(() {
                                      _model.optionD = false;
                                    });
                                  }
                                },
                                activeColor: Color(0xFF0B9D58),
                                checkColor: FlutterFlowTheme.of(context).info,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ADDQUIZ_PAGE_ADD_QUESTION_BTN_ON_TAP');
                    logFirebaseEvent('Button_backend_call');

                    var quizRecordReference = QuizRecord.collection.doc();
                    await quizRecordReference.set(createQuizRecordData(
                      id: 1,
                      question: _model.textController1.text,
                      quizSet: widget.quizset,
                    ));
                    _model.quizcreateresponse = QuizRecord.getDocumentFromData(
                        createQuizRecordData(
                          id: 1,
                          question: _model.textController1.text,
                          quizSet: widget.quizset,
                        ),
                        quizRecordReference);
                    logFirebaseEvent('Button_backend_call');

                    await QuestionARecord.createDoc(
                            _model.quizcreateresponse!.reference)
                        .set(createQuestionARecordData(
                      question: _model.textController2.text,
                      isTrue: _model.optionA,
                    ));
                    logFirebaseEvent('Button_backend_call');

                    await QuestionBRecord.createDoc(
                            _model.quizcreateresponse!.reference)
                        .set(createQuestionBRecordData(
                      question: _model.textController3.text,
                      isTrue: _model.optionB,
                    ));
                    logFirebaseEvent('Button_backend_call');

                    await QuestionCRecord.createDoc(
                            _model.quizcreateresponse!.reference)
                        .set(createQuestionCRecordData(
                      question: _model.textController4.text,
                      isTrue: _model.optionC,
                    ));
                    logFirebaseEvent('Button_backend_call');

                    await QuestionDRecord.createDoc(
                            _model.quizcreateresponse!.reference)
                        .set(createQuestionDRecordData(
                      question: _model.textController5.text,
                      isTrue: _model.optionD,
                    ));
                    logFirebaseEvent('Button_backend_call');

                    await widget.quizset!.update({
                      ...mapToFirestore(
                        {
                          'total_questions': FieldValue.increment(1),
                        },
                      ),
                    });
                    logFirebaseEvent('Button_clear_text_fields_pin_codes');
                    setState(() {
                      _model.textController1?.clear();
                      _model.textController2?.clear();
                      _model.textController3?.clear();
                      _model.textController4?.clear();
                      _model.textController5?.clear();
                    });
                    logFirebaseEvent('Button_show_snack_bar');
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'successful',
                          style: GoogleFonts.getFont(
                            'Outfit',
                            color: Colors.white,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: Color(0x22000000),
                      ),
                    );

                    setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    'c1n7k41h' /* add question */,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF0B9D58),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
