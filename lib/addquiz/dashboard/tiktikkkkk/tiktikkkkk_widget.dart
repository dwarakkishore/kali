import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tiktikkkkk_model.dart';
export 'tiktikkkkk_model.dart';

class TiktikkkkkWidget extends StatefulWidget {
  const TiktikkkkkWidget({
    Key? key,
    required this.docrefvide,
  }) : super(key: key);

  final DocumentReference? docrefvide;

  @override
  _TiktikkkkkWidgetState createState() => _TiktikkkkkWidgetState();
}

class _TiktikkkkkWidgetState extends State<TiktikkkkkWidget>
    with TickerProviderStateMixin {
  late TiktikkkkkModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'videoPlayerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
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
    'videoPlayerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 80.ms,
          duration: 600.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TiktikkkkkModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'tiktikkkkk'});
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
        title: 'tiktikkkkk',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0x29000000),
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
                  logFirebaseEvent('TIKTIKKKKK_arrow_back_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(
                    'Homepage',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );
                },
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: Align(
              alignment: AlignmentDirectional(0.00, 1.00),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: FutureBuilder<List<VideosRecord>>(
                        future: queryVideosRecordOnce(
                          queryBuilder: (videosRecord) => videosRecord
                              .orderBy('postedDate', descending: true),
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
                          List<VideosRecord> pageViewVideosRecordList =
                              snapshot.data!;
                          return Container(
                            width: double.infinity,
                            height: 500.0,
                            child: PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage: min(0,
                                          pageViewVideosRecordList.length - 1)),
                              scrollDirection: Axis.vertical,
                              itemCount: pageViewVideosRecordList.length,
                              itemBuilder: (context, pageViewIndex) {
                                final pageViewVideosRecord =
                                    pageViewVideosRecordList[pageViewIndex];
                                return Stack(
                                  children: [
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.easeInOut,
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: FlutterFlowVideoPlayer(
                                        path: pageViewVideosRecord.video,
                                        videoType: VideoType.network,
                                        autoPlay: true,
                                        looping: false,
                                        showControls: false,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: false,
                                      )
                                          .animateOnPageLoad(animationsMap[
                                              'videoPlayerOnPageLoadAnimation']!)
                                          .animateOnActionTrigger(
                                            animationsMap[
                                                'videoPlayerOnActionTriggerAnimation']!,
                                          ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
