import '/addquiz/bubblee/bubblee_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'gptpage_model.dart';
export 'gptpage_model.dart';

class GptpageWidget extends StatefulWidget {
  const GptpageWidget({
    Key? key,
    required this.chatref,
  }) : super(key: key);

  final DocumentReference? chatref;

  @override
  _GptpageWidgetState createState() => _GptpageWidgetState();
}

class _GptpageWidgetState extends State<GptpageWidget>
    with TickerProviderStateMixin {
  late GptpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 410.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 410.ms,
          begin: Offset(0.0, 17.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'bubbleeOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 530.ms,
          begin: Offset(0.0, 19.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GptpageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'gptpage'});
    _model.titleController ??= TextEditingController();
    _model.promptController ??= TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.titleController?.text = FFLocalizations.of(context).getText(
            '47tt1ir6' /* Welcome chief */,
          );
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<MessageRecord>>(
      stream: queryMessageRecord(
        parent: widget.chatref,
        queryBuilder: (messageRecord) => messageRecord
            .where(
              'uid',
              isEqualTo: currentUserReference,
            )
            .orderBy('timestamp', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
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
        List<MessageRecord> gptpageMessageRecordList = snapshot.data!;
        return Title(
            title: 'gptpage',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: Colors.black,
                drawer: Drawer(
                  elevation: 16.0,
                  child: StreamBuilder<List<ChatRecord>>(
                    stream: queryChatRecord(
                      queryBuilder: (chatRecord) => chatRecord
                          .where(
                            'uid',
                            isEqualTo: currentUserReference,
                          )
                          .orderBy('timestamp', descending: true),
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
                      List<ChatRecord> containerChatRecordList = snapshot.data!;
                      return Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 30.0, 15.0, 30.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'GPTPAGE_PAGE_NEW_CHAT_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.goNamed(
                                      'welcomegpt',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                        ),
                                      },
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '0g97m6uw' /* New Chat */,
                                  ),
                                  icon: Icon(
                                    Icons.library_add,
                                    size: 16.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 150.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0x00AFB5BF),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFFA8B1BD),
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(18.0),
                                    hoverColor: Color(0xFF262B33),
                                    hoverTextColor: Colors.white,
                                    hoverElevation: 0.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'qoq8dclu' /* Past Chats */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 30.0),
                                  child: Builder(
                                    builder: (context) {
                                      final chat =
                                          containerChatRecordList.toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: chat.length,
                                        itemBuilder: (context, chatIndex) {
                                          final chatItem = chat[chatIndex];
                                          return Stack(
                                            children: [],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: Color(0x00AFB5BF),
                                hoverColor: Color(0x8C191921),
                                hoverIconColor: Colors.white,
                                icon: Icon(
                                  Icons.exit_to_app,
                                  color: Color(0xFFA8B1BD),
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'GPTPAGE_PAGE_exit_to_app_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_drawer');
                                  if (scaffoldKey.currentState!.isDrawerOpen ||
                                      scaffoldKey
                                          .currentState!.isEndDrawerOpen) {
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                body: SafeArea(
                  top: true,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          FlutterFlowTheme.of(context).secondary
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: 1100.0,
                              ),
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 30.0, 0.0, 30.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 5.0,
                                                        color:
                                                            Color(0x00FFFFFF),
                                                        offset:
                                                            Offset(1.0, 2.0),
                                                      )
                                                    ],
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xDA25272D),
                                                        Color(0x4231353C)
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              1.0, 0.87),
                                                      end: AlignmentDirectional(
                                                          -1.0, -0.87),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Color(0x56FFFFFF),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius: 4.0,
                                                              buttonSize: 35.0,
                                                              fillColor: Color(
                                                                  0x00FFFFFF),
                                                              hoverColor: Color(
                                                                  0xA62E313C),
                                                              hoverIconColor:
                                                                  Colors.white,
                                                              icon: Icon(
                                                                Icons
                                                                    .menu_rounded,
                                                                color: Color(
                                                                    0xFFBBC5D3),
                                                                size: 18.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'GPTPAGE_PAGE_menu_rounded_ICN_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'IconButton_drawer');
                                                                scaffoldKey
                                                                    .currentState!
                                                                    .openDrawer();
                                                              },
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child:
                                                                StreamBuilder<
                                                                    ChatRecord>(
                                                              stream: ChatRecord
                                                                  .getDocument(
                                                                      widget
                                                                          .chatref!),
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
                                                                        color: Color(
                                                                            0x9900CB68),
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final containerChatRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return Container(
                                                                  width: 300.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Form(
                                                                    key: _model
                                                                        .formKey,
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .disabled,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          5.0,
                                                                          8.0,
                                                                          5.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.titleController,
                                                                        onFieldSubmitted:
                                                                            (_) async {
                                                                          logFirebaseEvent(
                                                                              'GPTPAGE_PAGE_Title_ON_TEXTFIELD_SUBMIT');
                                                                          logFirebaseEvent(
                                                                              'Title_backend_call');

                                                                          await containerChatRecord
                                                                              .reference
                                                                              .update(createChatRecordData(
                                                                            title:
                                                                                _model.titleController.text,
                                                                          ));
                                                                        },
                                                                        textCapitalization:
                                                                            TextCapitalization.sentences,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                fontSize: 11.0,
                                                                              ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                fontSize: 11.0,
                                                                              ),
                                                                          enabledBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              15.0,
                                                                              0.0,
                                                                              15.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 11.0,
                                                                            ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        validator: _model
                                                                            .titleControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
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
                                                                        10.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 4.0,
                                                              buttonSize: 35.0,
                                                              fillColor: Color(
                                                                  0x00FFFFFF),
                                                              hoverColor: Color(
                                                                  0xA62E313C),
                                                              hoverIconColor:
                                                                  Colors.white,
                                                              icon: Icon(
                                                                Icons
                                                                    .delete_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 18.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'GPTPAGE_PAGE_delete_outlined_ICN_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'IconButton_alert_dialog');
                                                                var confirmDialogResponse =
                                                                    await showDialog<
                                                                            bool>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              content: Text('Are you sure you\'d like to delete this chat?'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: Text('Nevermind'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: Text('Yes, I\'m sure.'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ) ??
                                                                        false;
                                                                if (confirmDialogResponse) {
                                                                  logFirebaseEvent(
                                                                      'IconButton_navigate_to');

                                                                  context
                                                                      .goNamed(
                                                                    'welcomegpt',
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                      ),
                                                                    },
                                                                  );

                                                                  logFirebaseEvent(
                                                                      'IconButton_backend_call');
                                                                  await widget
                                                                      .chatref!
                                                                      .delete();
                                                                  return;
                                                                } else {
                                                                  return;
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      10.0,
                                                                      15.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 100.0,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 700.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final message =
                                                                    gptpageMessageRecordList
                                                                        .toList();
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  reverse: true,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      message
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          messageIndex) {
                                                                    final messageItem =
                                                                        message[
                                                                            messageIndex];
                                                                    return BubbleeWidget(
                                                                      key: Key(
                                                                          'Keykio_${messageIndex}_of_${message.length}'),
                                                                      messageText:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        messageItem
                                                                            .message,
                                                                        'Hello!',
                                                                      ),
                                                                      gptResponse:
                                                                          messageItem.user ==
                                                                              'gpt',
                                                                      userMessage: (messageItem.user ==
                                                                              'user') &&
                                                                          (messageItem.firstmessage ==
                                                                              false),
                                                                    ).animateOnActionTrigger(
                                                                      animationsMap[
                                                                          'bubbleeOnActionTriggerAnimation']!,
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (FFAppState()
                                                          .awaitingReply)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      5.0,
                                                                      15.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 50.0,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 700.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .auto_awesome,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                                Lottie.asset(
                                                                  'assets/lottie_animations/6652-dote-typing-animation.json',
                                                                  width: 38.0,
                                                                  height: 72.0,
                                                                  fit: BoxFit
                                                                      .fitHeight,
                                                                  animate: true,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    25.0,
                                                                    0.0,
                                                                    30.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 750.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Flexible(
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.promptController,
                                                                          onFieldSubmitted:
                                                                              (_) async {
                                                                            logFirebaseEvent('GPTPAGE_PAGE_Prompt_ON_TEXTFIELD_SUBMIT');
                                                                            var _shouldSetState =
                                                                                false;
                                                                            logFirebaseEvent('Prompt_update_page_state');
                                                                            setState(() {
                                                                              _model.prompttype = _model.promptController.text;
                                                                            });
                                                                            logFirebaseEvent('Prompt_backend_call');

                                                                            await MessageRecord.createDoc(widget.chatref!).set(createMessageRecordData(
                                                                              timestamp: getCurrentTimestamp,
                                                                              message: _model.promptController.text,
                                                                              user: 'user',
                                                                              uid: currentUserReference,
                                                                              firstmessage: false,
                                                                            ));
                                                                            logFirebaseEvent('Prompt_clear_text_fields_pin_codes');
                                                                            setState(() {
                                                                              _model.promptController?.clear();
                                                                            });
                                                                            logFirebaseEvent('Prompt_update_app_state');
                                                                            setState(() {
                                                                              FFAppState().awaitingReply = true;
                                                                            });
                                                                            logFirebaseEvent('Prompt_backend_call');
                                                                            _model.gptResponse =
                                                                                await AIChatCall.call(
                                                                              message: functions.generatemessage(gptpageMessageRecordList.toList(), _model.prompttype!)?.toString(),
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.gptResponse?.succeeded ??
                                                                                true)) {
                                                                              logFirebaseEvent('Prompt_backend_call');

                                                                              await MessageRecord.createDoc(widget.chatref!).set(createMessageRecordData(
                                                                                timestamp: getCurrentTimestamp,
                                                                                message: AIChatCall.messagecontent(
                                                                                  (_model.gptResponse?.jsonBody ?? ''),
                                                                                ).toString().trim(),
                                                                                user: 'gpt',
                                                                                uid: currentUserReference,
                                                                                firstmessage: false,
                                                                              ));
                                                                              logFirebaseEvent('Prompt_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().awaitingReply = false;
                                                                              });
                                                                              logFirebaseEvent('Prompt_widget_animation');
                                                                              if (animationsMap['bubbleeOnActionTriggerAnimation'] != null) {
                                                                                await animationsMap['bubbleeOnActionTriggerAnimation']!.controller.forward(from: 0.0);
                                                                              }
                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            } else {
                                                                              logFirebaseEvent('Prompt_show_snack_bar');
                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'Oops, looks like that didn\'t go through. Let\'s try again!',
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 3000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                ),
                                                                              );
                                                                              logFirebaseEvent('Prompt_update_app_state');
                                                                              setState(() {
                                                                                FFAppState().awaitingReply = false;
                                                                              });
                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: Color(0xFFA5AAB4),
                                                                                  fontSize: 11.0,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'cs4d0fay' /* Ask me anything... */,
                                                                            ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: Color(0xFFA5AAB4),
                                                                                  fontSize: 11.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                width: 0.2,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.2,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 0.2,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 0.2,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                Color(0x0FFFFFFF),
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                15.0,
                                                                                20.0,
                                                                                15.0),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: Color(0xFFA5AAB4),
                                                                                fontSize: 11.0,
                                                                              ),
                                                                          keyboardType:
                                                                              TextInputType.emailAddress,
                                                                          validator: _model
                                                                              .promptControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ).animateOnPageLoad(animationsMap[
                                                      'columnOnPageLoadAnimation']!),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
