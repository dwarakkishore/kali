import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'welcomegpt_model.dart';
export 'welcomegpt_model.dart';

class WelcomegptWidget extends StatefulWidget {
  const WelcomegptWidget({Key? key}) : super(key: key);

  @override
  _WelcomegptWidgetState createState() => _WelcomegptWidgetState();
}

class _WelcomegptWidgetState extends State<WelcomegptWidget>
    with TickerProviderStateMixin {
  late WelcomegptModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 260.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 260.ms,
          begin: Offset(0.0, 18.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 260.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 260.ms,
          begin: Offset(0.0, 18.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 260.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 260.ms,
          begin: Offset(0.0, 18.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 350.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(64.0, 100.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 350.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomegptModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'welcomegpt'});
    _model.textController ??= TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return Title(
        title: 'welcomegpt',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
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
                  logFirebaseEvent('WELCOMEGPT_arrow_back_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed('Homepage');
                },
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
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
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 50.0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 900.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
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
                                                    color: Color(0x00FFFFFF),
                                                    offset: Offset(1.0, 2.0),
                                                  )
                                                ],
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xDA25272D),
                                                    Color(0x4231353C)
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      1.0, 0.87),
                                                  end: AlignmentDirectional(
                                                      -1.0, -0.87),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: Color(0x56FFFFFF),
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  ClipRect(
                                                    child: ImageFiltered(
                                                      imageFilter:
                                                          ImageFilter.blur(
                                                        sigmaX: 2.0,
                                                        sigmaY: 2.0,
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            12.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'pb4nvxlk' /* Kali Generative */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                    ),
                                                                    GradientText(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'rbmbfzku' /* ai */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                Color(0xFFB7BDC7),
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                      colors: [
                                                                        Colors
                                                                            .black,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        Color(
                                                                            0xDA00FF79)
                                                                      ],
                                                                      gradientDirection:
                                                                          GradientDirection
                                                                              .ttb,
                                                                      gradientType:
                                                                          GradientType
                                                                              .linear,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .auto_awesome_sharp,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ],
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'rowOnPageLoadAnimation1']!),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            30.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '1onwf350' /* How can I help you today? */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                Color(0xFFB7BDC7),
                                                                            fontSize:
                                                                                13.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'rowOnPageLoadAnimation2']!),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        600.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
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
                                                                            _model.textController,
                                                                        onFieldSubmitted:
                                                                            (_) async {
                                                                          logFirebaseEvent(
                                                                              'WELCOMEGPT_TextField_qzpylzet_ON_TEXTFIE');
                                                                          var _shouldSetState =
                                                                              false;
                                                                          logFirebaseEvent(
                                                                              'TextField_backend_call');

                                                                          var chatRecordReference = ChatRecord
                                                                              .collection
                                                                              .doc();
                                                                          await chatRecordReference
                                                                              .set(createChatRecordData(
                                                                            uid:
                                                                                currentUserReference,
                                                                            timestamp:
                                                                                getCurrentTimestamp,
                                                                            title:
                                                                                valueOrDefault<String>(
                                                                              'Chat Title (${valueOrDefault<String>(
                                                                                dateTimeFormat(
                                                                                  'M/d h:mm a',
                                                                                  getCurrentTimestamp,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                'Chart Title',
                                                                              )})',
                                                                              'Chat Title',
                                                                            ),
                                                                          ));
                                                                          _model.chatRef = ChatRecord.getDocumentFromData(
                                                                              createChatRecordData(
                                                                                uid: currentUserReference,
                                                                                timestamp: getCurrentTimestamp,
                                                                                title: valueOrDefault<String>(
                                                                                  'Chat Title (${valueOrDefault<String>(
                                                                                    dateTimeFormat(
                                                                                      'M/d h:mm a',
                                                                                      getCurrentTimestamp,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    'Chart Title',
                                                                                  )})',
                                                                                  'Chat Title',
                                                                                ),
                                                                              ),
                                                                              chatRecordReference);
                                                                          _shouldSetState =
                                                                              true;
                                                                          logFirebaseEvent(
                                                                              'TextField_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'gptpage',
                                                                            queryParameters:
                                                                                {
                                                                              'chatref': serializeParam(
                                                                                _model.chatRef?.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );

                                                                          logFirebaseEvent(
                                                                              'TextField_update_app_state');
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().awaitingReply =
                                                                                true;
                                                                            FFAppState().prompt =
                                                                                _model.textController.text;
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'TextField_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'gptpage',
                                                                            queryParameters:
                                                                                {
                                                                              'chatref': serializeParam(
                                                                                _model.chatRef?.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );

                                                                          logFirebaseEvent(
                                                                              'TextField_backend_call');

                                                                          var messageRecordReference1 = MessageRecord.createDoc(_model
                                                                              .chatRef!
                                                                              .reference);
                                                                          await messageRecordReference1
                                                                              .set(createMessageRecordData(
                                                                            timestamp:
                                                                                getCurrentTimestamp,
                                                                            message:
                                                                                FFAppState().systemMessage,
                                                                            user:
                                                                                'system',
                                                                            uid:
                                                                                currentUserReference,
                                                                            firstmessage:
                                                                                false,
                                                                          ));
                                                                          _model.msg1 = MessageRecord.getDocumentFromData(
                                                                              createMessageRecordData(
                                                                                timestamp: getCurrentTimestamp,
                                                                                message: FFAppState().systemMessage,
                                                                                user: 'system',
                                                                                uid: currentUserReference,
                                                                                firstmessage: false,
                                                                              ),
                                                                              messageRecordReference1);
                                                                          _shouldSetState =
                                                                              true;
                                                                          logFirebaseEvent(
                                                                              'TextField_update_page_state');
                                                                          setState(
                                                                              () {
                                                                            _model.addToInitialmessage(_model.msg1!);
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'TextField_backend_call');

                                                                          var messageRecordReference2 = MessageRecord.createDoc(_model
                                                                              .chatRef!
                                                                              .reference);
                                                                          await messageRecordReference2
                                                                              .set(createMessageRecordData(
                                                                            timestamp:
                                                                                getCurrentTimestamp,
                                                                            message:
                                                                                FFAppState().UserReinforcement,
                                                                            user:
                                                                                'user',
                                                                            uid:
                                                                                currentUserReference,
                                                                            firstmessage:
                                                                                true,
                                                                          ));
                                                                          _model.msg2 = MessageRecord.getDocumentFromData(
                                                                              createMessageRecordData(
                                                                                timestamp: getCurrentTimestamp,
                                                                                message: FFAppState().UserReinforcement,
                                                                                user: 'user',
                                                                                uid: currentUserReference,
                                                                                firstmessage: true,
                                                                              ),
                                                                              messageRecordReference2);
                                                                          _shouldSetState =
                                                                              true;
                                                                          logFirebaseEvent(
                                                                              'TextField_update_page_state');
                                                                          setState(
                                                                              () {
                                                                            _model.addToInitialmessage(_model.msg2!);
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'TextField_backend_call');

                                                                          var messageRecordReference3 = MessageRecord.createDoc(_model
                                                                              .chatRef!
                                                                              .reference);
                                                                          await messageRecordReference3
                                                                              .set(createMessageRecordData(
                                                                            timestamp:
                                                                                getCurrentTimestamp,
                                                                            message:
                                                                                FFAppState().gptOpener,
                                                                            user:
                                                                                'gpt',
                                                                            uid:
                                                                                currentUserReference,
                                                                            firstmessage:
                                                                                false,
                                                                          ));
                                                                          _model.msg3 = MessageRecord.getDocumentFromData(
                                                                              createMessageRecordData(
                                                                                timestamp: getCurrentTimestamp,
                                                                                message: FFAppState().gptOpener,
                                                                                user: 'gpt',
                                                                                uid: currentUserReference,
                                                                                firstmessage: false,
                                                                              ),
                                                                              messageRecordReference3);
                                                                          _shouldSetState =
                                                                              true;
                                                                          logFirebaseEvent(
                                                                              'TextField_update_page_state');
                                                                          setState(
                                                                              () {
                                                                            _model.addToInitialmessage(_model.msg3!);
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'TextField_backend_call');

                                                                          var messageRecordReference4 = MessageRecord.createDoc(_model
                                                                              .chatRef!
                                                                              .reference);
                                                                          await messageRecordReference4
                                                                              .set(createMessageRecordData(
                                                                            timestamp:
                                                                                getCurrentTimestamp,
                                                                            message:
                                                                                _model.textController.text,
                                                                            user:
                                                                                'user',
                                                                            uid:
                                                                                currentUserReference,
                                                                            firstmessage:
                                                                                false,
                                                                          ));
                                                                          _model.msg4 = MessageRecord.getDocumentFromData(
                                                                              createMessageRecordData(
                                                                                timestamp: getCurrentTimestamp,
                                                                                message: _model.textController.text,
                                                                                user: 'user',
                                                                                uid: currentUserReference,
                                                                                firstmessage: false,
                                                                              ),
                                                                              messageRecordReference4);
                                                                          _shouldSetState =
                                                                              true;
                                                                          logFirebaseEvent(
                                                                              'TextField_update_page_state');
                                                                          setState(
                                                                              () {
                                                                            _model.addToInitialmessage(_model.msg4!);
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'TextField_clear_text_fields_pin_codes');
                                                                          setState(
                                                                              () {
                                                                            _model.textController?.clear();
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'TextField_navigate_to');

                                                                          context
                                                                              .goNamed(
                                                                            'gptpage',
                                                                            queryParameters:
                                                                                {
                                                                              'chatref': serializeParam(
                                                                                _model.chatRef?.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );

                                                                          logFirebaseEvent(
                                                                              'TextField_backend_call');
                                                                          _model.gptResponse =
                                                                              await AIChatCall.call(
                                                                            message:
                                                                                functions.generatemessage(_model.initialmessage.toList(), FFAppState().prompt)?.toString(),
                                                                            apikey:
                                                                                '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',
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          if ((_model.gptResponse?.succeeded ??
                                                                              true)) {
                                                                            logFirebaseEvent('TextField_backend_call');

                                                                            await MessageRecord.createDoc(_model.chatRef!.reference).set(createMessageRecordData(
                                                                              timestamp: getCurrentTimestamp,
                                                                              message: AIChatCall.messagecontent(
                                                                                (_model.gptResponse?.jsonBody ?? ''),
                                                                              ).toString().trim(),
                                                                              user: 'gpt',
                                                                              uid: currentUserReference,
                                                                              firstmessage: false,
                                                                            ));
                                                                            logFirebaseEvent('TextField_update_app_state');
                                                                            FFAppState().update(() {
                                                                              FFAppState().awaitingReply = false;
                                                                            });
                                                                            logFirebaseEvent('TextField_widget_animation');
                                                                            if (animationsMap['containerOnActionTriggerAnimation'] !=
                                                                                null) {
                                                                              await animationsMap['containerOnActionTriggerAnimation']!.controller.forward(from: 0.0);
                                                                            }
                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                            return;
                                                                          } else {
                                                                            logFirebaseEvent('TextField_show_snack_bar');
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
                                                                            logFirebaseEvent('TextField_update_app_state');
                                                                            FFAppState().update(() {
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
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: Color(0xFFA5AAB4),
                                                                                fontSize: 11.0,
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'bn71omq8' /* hello Ask me anything... */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: Color(0xFFA5AAB4),
                                                                                fontSize: 11.0,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              width: 0.2,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.2,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.2,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.2,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
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
                                                                            .textControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                                        .animateOnPageLoad(
                                                                            animationsMap['containerOnPageLoadAnimation']!)
                                                                        .animateOnActionTrigger(
                                                                          animationsMap[
                                                                              'containerOnActionTriggerAnimation']!,
                                                                        ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.09, 0.35),
                                                    child: Container(
                                                      width: 336.0,
                                                      height: 34.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFEFC439),
                                                            Color(0xFFD23939)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  1.0, 0.87),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -1.0, -0.87),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'md02n0lp' /* Upgrade to Premium */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .star_purple500_outlined,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 24.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
  }
}
