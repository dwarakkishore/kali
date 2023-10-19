import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quizpage_model.dart';
export 'quizpage_model.dart';

class QuizpageWidget extends StatefulWidget {
  const QuizpageWidget({
    Key? key,
    required this.quizsetref,
    required this.quizduration,
    required this.cov,
    required this.ccccc,
  }) : super(key: key);

  final DocumentReference? quizsetref;
  final int? quizduration;
  final FFUploadedFile? cov;
  final String? ccccc;

  @override
  _QuizpageWidgetState createState() => _QuizpageWidgetState();
}

class _QuizpageWidgetState extends State<QuizpageWidget>
    with TickerProviderStateMixin {
  late QuizpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 320.ms,
          begin: Offset(-100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'pageViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizpageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Quizpage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('QUIZPAGE_PAGE_Quizpage_ON_INIT_STATE');
      logFirebaseEvent('Quizpage_start_periodic_action');
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          logFirebaseEvent('Quizpage_timer');
          _model.timerController.onStartTimer();
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<int>(
      future: queryQuizRecordCount(
        queryBuilder: (quizRecord) => quizRecord.where(
          'quiz_set',
          isEqualTo: widget.quizsetref,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF1F4F8),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingFour(
                  color: Color(0x9900CB68),
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        int quizpageCount = snapshot.data!;
        return Title(
            title: 'Quizpage',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor: Color(0xFFF1F4F8),
                  body: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 48.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 121.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.timer_sharp,
                                                color: Colors.black,
                                                size: 24.0,
                                              ),
                                              FlutterFlowTimer(
                                                initialTime:
                                                    widget.quizduration!,
                                                getDisplayTime: (value) =>
                                                    StopWatchTimer
                                                        .getDisplayTime(
                                                  value,
                                                  hours: false,
                                                  milliSecond: false,
                                                ),
                                                controller:
                                                    _model.timerController,
                                                updateStateInterval: Duration(
                                                    milliseconds: 1000),
                                                onChanged: (value, displayTime,
                                                    shouldUpdate) {
                                                  _model.timerMilliseconds =
                                                      value;
                                                  _model.timerValue =
                                                      displayTime;
                                                  if (shouldUpdate)
                                                    setState(() {});
                                                },
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.black,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'hpfd0aav' /* Q */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Color(0xFF169E59),
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          (_model.pagenavigate + 1).toString(),
                                          '0',
                                        ),
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation']!),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 96.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    LinearPercentIndicator(
                                      percent: valueOrDefault<double>(
                                        FFAppState().completedquestions /
                                            quizpageCount,
                                        0.0,
                                      ),
                                      width: 100.0,
                                      lineHeight: 9.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor: Color(0xFF289C00),
                                      backgroundColor: Color(0xB2FFFFFF),
                                      barRadius: Radius.circular(0.0),
                                      padding: EdgeInsets.zero,
                                    ),
                                    Expanded(
                                      child: StreamBuilder<List<QuizRecord>>(
                                        stream: queryQuizRecord(
                                          queryBuilder: (quizRecord) =>
                                              quizRecord.where(
                                            'quiz_set',
                                            isEqualTo: widget.quizsetref,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitFadingFour(
                                                  color: Color(0x9900CB68),
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<QuizRecord>
                                              pageViewQuizRecordList =
                                              snapshot.data!;
                                          return Container(
                                            width: double.infinity,
                                            height: 500.0,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 40.0),
                                              child: PageView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: min(
                                                            0,
                                                            pageViewQuizRecordList
                                                                    .length -
                                                                1)),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    pageViewQuizRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, pageViewIndex) {
                                                  final pageViewQuizRecord =
                                                      pageViewQuizRecordList[
                                                          pageViewIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Text(
                                                          pageViewQuizRecord
                                                              .question,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: ListView(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      QuestionARecord>>(
                                                                stream:
                                                                    queryQuestionARecord(
                                                                  parent: pageViewQuizRecord
                                                                      .reference,
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitFadingFour(
                                                                          color:
                                                                              Color(0x9900CB68),
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<QuestionARecord>
                                                                      checkboxListTileQuestionARecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final checkboxListTileQuestionARecord = checkboxListTileQuestionARecordList
                                                                          .isNotEmpty
                                                                      ? checkboxListTileQuestionARecordList
                                                                          .first
                                                                      : null;
                                                                  return Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        visualDensity:
                                                                            VisualDensity.compact,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                    ),
                                                                    child:
                                                                        CheckboxListTile(
                                                                      value: _model
                                                                              .checkboxListTileValueMap1[pageViewQuizRecord] ??=
                                                                          false,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        setState(() =>
                                                                            _model.checkboxListTileValueMap1[pageViewQuizRecord] =
                                                                                newValue!);
                                                                        if (newValue!) {
                                                                          logFirebaseEvent(
                                                                              'QUIZCheckboxListTile_yyed0z9z_ON_TOGGLE_');
                                                                          logFirebaseEvent(
                                                                              'CheckboxListTile_wait__delay');
                                                                          await Future.delayed(
                                                                              const Duration(milliseconds: 400));
                                                                          logFirebaseEvent(
                                                                              'CheckboxListTile_page_view');
                                                                          await _model
                                                                              .pageViewController
                                                                              ?.nextPage(
                                                                            duration:
                                                                                Duration(milliseconds: 300),
                                                                            curve:
                                                                                Curves.ease,
                                                                          );
                                                                          if (_model
                                                                              .checkboxListTileValueMap1[pageViewQuizRecord]!) {
                                                                            if (_model.checkboxListTileValueMap1[pageViewQuizRecord] !=
                                                                                null) {
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().completedquestions = FFAppState().completedquestions + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().score = FFAppState().score + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_page_state');
                                                                              setState(() {
                                                                                _model.pagenavigate = _model.pagenavigate + 1;
                                                                              });
                                                                            } else {
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().completedquestions = FFAppState().completedquestions + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().score = FFAppState().score + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_page_state');
                                                                              setState(() {
                                                                                _model.pagenavigate = _model.pagenavigate + -1;
                                                                              });
                                                                            }
                                                                          } else {
                                                                            if (_model.checkboxListTileValueMap1[pageViewQuizRecord] !=
                                                                                null) {
                                                                              logFirebaseEvent('CheckboxListTile_close_dialog,_drawer,_e');
                                                                            }
                                                                          }
                                                                        }
                                                                      },
                                                                      title:
                                                                          Text(
                                                                        checkboxListTileQuestionARecord!
                                                                            .question,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      activeColor:
                                                                          Color(
                                                                              0xFF00B55A),
                                                                      checkColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      dense:
                                                                          true,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .leading,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      QuestionBRecord>>(
                                                                stream:
                                                                    queryQuestionBRecord(
                                                                  parent: pageViewQuizRecord
                                                                      .reference,
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitFadingFour(
                                                                          color:
                                                                              Color(0x9900CB68),
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<QuestionBRecord>
                                                                      checkboxListTileQuestionBRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final checkboxListTileQuestionBRecord = checkboxListTileQuestionBRecordList
                                                                          .isNotEmpty
                                                                      ? checkboxListTileQuestionBRecordList
                                                                          .first
                                                                      : null;
                                                                  return Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        visualDensity:
                                                                            VisualDensity.compact,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                    ),
                                                                    child:
                                                                        CheckboxListTile(
                                                                      value: _model
                                                                              .checkboxListTileValueMap2[pageViewQuizRecord] ??=
                                                                          false,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        setState(() =>
                                                                            _model.checkboxListTileValueMap2[pageViewQuizRecord] =
                                                                                newValue!);
                                                                        if (newValue!) {
                                                                          logFirebaseEvent(
                                                                              'QUIZCheckboxListTile_r463t86z_ON_TOGGLE_');
                                                                          logFirebaseEvent(
                                                                              'CheckboxListTile_wait__delay');
                                                                          await Future.delayed(
                                                                              const Duration(milliseconds: 400));
                                                                          logFirebaseEvent(
                                                                              'CheckboxListTile_page_view');
                                                                          await _model
                                                                              .pageViewController
                                                                              ?.nextPage(
                                                                            duration:
                                                                                Duration(milliseconds: 300),
                                                                            curve:
                                                                                Curves.ease,
                                                                          );
                                                                          if (_model
                                                                              .checkboxListTileValueMap2[pageViewQuizRecord]!) {
                                                                            if (_model.checkboxListTileValueMap2[pageViewQuizRecord] !=
                                                                                null) {
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().completedquestions = FFAppState().completedquestions + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().score = FFAppState().score + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_page_state');
                                                                              setState(() {
                                                                                _model.pagenavigate = _model.pagenavigate + 1;
                                                                              });
                                                                            } else {
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().completedquestions = FFAppState().completedquestions + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().score = FFAppState().score + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_page_state');
                                                                              setState(() {
                                                                                _model.pagenavigate = _model.pagenavigate + -1;
                                                                              });
                                                                            }
                                                                          } else {
                                                                            if (_model.checkboxListTileValueMap2[pageViewQuizRecord] !=
                                                                                null) {
                                                                              logFirebaseEvent('CheckboxListTile_close_dialog,_drawer,_e');
                                                                            }
                                                                          }
                                                                        }
                                                                      },
                                                                      title:
                                                                          Text(
                                                                        checkboxListTileQuestionBRecord!
                                                                            .question,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      activeColor:
                                                                          Color(
                                                                              0xFF00B55A),
                                                                      checkColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      dense:
                                                                          true,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .leading,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      QuestionCRecord>>(
                                                                stream:
                                                                    queryQuestionCRecord(
                                                                  parent: pageViewQuizRecord
                                                                      .reference,
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitFadingFour(
                                                                          color:
                                                                              Color(0x9900CB68),
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<QuestionCRecord>
                                                                      checkboxListTileQuestionCRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final checkboxListTileQuestionCRecord = checkboxListTileQuestionCRecordList
                                                                          .isNotEmpty
                                                                      ? checkboxListTileQuestionCRecordList
                                                                          .first
                                                                      : null;
                                                                  return Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        visualDensity:
                                                                            VisualDensity.compact,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                    ),
                                                                    child:
                                                                        CheckboxListTile(
                                                                      value: _model
                                                                              .checkboxListTileValueMap3[pageViewQuizRecord] ??=
                                                                          false,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        setState(() =>
                                                                            _model.checkboxListTileValueMap3[pageViewQuizRecord] =
                                                                                newValue!);
                                                                        if (newValue!) {
                                                                          logFirebaseEvent(
                                                                              'QUIZCheckboxListTile_gn5tmfd9_ON_TOGGLE_');
                                                                          logFirebaseEvent(
                                                                              'CheckboxListTile_wait__delay');
                                                                          await Future.delayed(
                                                                              const Duration(milliseconds: 400));
                                                                          logFirebaseEvent(
                                                                              'CheckboxListTile_page_view');
                                                                          await _model
                                                                              .pageViewController
                                                                              ?.nextPage(
                                                                            duration:
                                                                                Duration(milliseconds: 300),
                                                                            curve:
                                                                                Curves.ease,
                                                                          );
                                                                          if (_model
                                                                              .checkboxListTileValueMap3[pageViewQuizRecord]!) {
                                                                            if (_model.checkboxListTileValueMap3[pageViewQuizRecord] !=
                                                                                null) {
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().completedquestions = FFAppState().completedquestions + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().score = FFAppState().score + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_page_state');
                                                                              setState(() {
                                                                                _model.pagenavigate = _model.pagenavigate + 1;
                                                                              });
                                                                            } else {
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().completedquestions = FFAppState().completedquestions + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().score = FFAppState().score + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_page_state');
                                                                              setState(() {
                                                                                _model.pagenavigate = _model.pagenavigate + -1;
                                                                              });
                                                                            }
                                                                          } else {
                                                                            if (_model.checkboxListTileValueMap3[pageViewQuizRecord] !=
                                                                                null) {
                                                                              logFirebaseEvent('CheckboxListTile_close_dialog,_drawer,_e');
                                                                            }
                                                                          }
                                                                        }
                                                                      },
                                                                      title:
                                                                          Text(
                                                                        checkboxListTileQuestionCRecord!
                                                                            .question,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      activeColor:
                                                                          Color(
                                                                              0xFF00B55A),
                                                                      checkColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      dense:
                                                                          true,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .leading,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      QuestionDRecord>>(
                                                                stream:
                                                                    queryQuestionDRecord(
                                                                  parent: pageViewQuizRecord
                                                                      .reference,
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitFadingFour(
                                                                          color:
                                                                              Color(0x9900CB68),
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<QuestionDRecord>
                                                                      checkboxListTileQuestionDRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final checkboxListTileQuestionDRecord = checkboxListTileQuestionDRecordList
                                                                          .isNotEmpty
                                                                      ? checkboxListTileQuestionDRecordList
                                                                          .first
                                                                      : null;
                                                                  return Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        visualDensity:
                                                                            VisualDensity.compact,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                    ),
                                                                    child:
                                                                        CheckboxListTile(
                                                                      value: _model
                                                                              .checkboxListTileValueMap4[pageViewQuizRecord] ??=
                                                                          false,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        setState(() =>
                                                                            _model.checkboxListTileValueMap4[pageViewQuizRecord] =
                                                                                newValue!);
                                                                        if (newValue!) {
                                                                          logFirebaseEvent(
                                                                              'QUIZCheckboxListTile_xkvo3ouj_ON_TOGGLE_');
                                                                          logFirebaseEvent(
                                                                              'CheckboxListTile_wait__delay');
                                                                          await Future.delayed(
                                                                              const Duration(milliseconds: 400));
                                                                          logFirebaseEvent(
                                                                              'CheckboxListTile_page_view');
                                                                          await _model
                                                                              .pageViewController
                                                                              ?.nextPage(
                                                                            duration:
                                                                                Duration(milliseconds: 300),
                                                                            curve:
                                                                                Curves.ease,
                                                                          );
                                                                          if (_model
                                                                              .checkboxListTileValueMap4[pageViewQuizRecord]!) {
                                                                            if (_model.checkboxListTileValueMap4[pageViewQuizRecord] !=
                                                                                null) {
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().completedquestions = FFAppState().completedquestions + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().score = FFAppState().score + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_page_state');
                                                                              setState(() {
                                                                                _model.pagenavigate = _model.pagenavigate + 1;
                                                                              });
                                                                            } else {
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().completedquestions = FFAppState().completedquestions + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().score = FFAppState().score + 1;
                                                                              });
                                                                              logFirebaseEvent('CheckboxListTile_update_page_state');
                                                                              setState(() {
                                                                                _model.pagenavigate = _model.pagenavigate + -1;
                                                                              });
                                                                            }
                                                                          } else {
                                                                            if (_model.checkboxListTileValueMap4[pageViewQuizRecord] !=
                                                                                null) {
                                                                              logFirebaseEvent('CheckboxListTile_close_dialog,_drawer,_e');
                                                                            }
                                                                          }
                                                                        }
                                                                      },
                                                                      title:
                                                                          Text(
                                                                        checkboxListTileQuestionDRecord!
                                                                            .question,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      activeColor:
                                                                          Color(
                                                                              0xFF00B55A),
                                                                      checkColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      dense:
                                                                          true,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .leading,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'pageViewOnPageLoadAnimation']!);
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 24.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.instantTimer.isActive)
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'QUIZPAGE_PAGE_NEXT_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_page_view');
                                                    await _model
                                                        .pageViewController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                    if (quizpageCount !=
                                                        _model.pagenavigate) {
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      setState(() {
                                                        _model.pagenavigate =
                                                            _model.pagenavigate +
                                                                1;
                                                      });
                                                    }
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'b19hkj2c' /* Next */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 60.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFF169E59),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (FFAppState().completedquestions ==
                                              quizpageCount)
                                            Expanded(
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'QUIZPAGE_PAGE_COMPLETED_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.pushNamed(
                                                    'score',
                                                    queryParameters: {
                                                      'scoreachieved':
                                                          serializeParam(
                                                        FFAppState().score,
                                                        ParamType.int,
                                                      ),
                                                      'totalscore':
                                                          serializeParam(
                                                        quizpageCount,
                                                        ParamType.int,
                                                      ),
                                                      'quizref': serializeParam(
                                                        widget.quizsetref,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'cov': serializeParam(
                                                        widget.ccccc,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  logFirebaseEvent(
                                                      'Button_update_app_state');
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .completedquestions = 0;
                                                  });
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'uiv6vddv' /* Completed */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF169E59),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
