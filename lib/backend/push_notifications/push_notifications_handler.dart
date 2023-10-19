import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Desktop_-_3_(1).jpg',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'loginpage': ParameterData.none(),
  'forgetpassword': ParameterData.none(),
  'Homepage': ParameterData.none(),
  'Quizpage': (data) async => ParameterData(
        allParams: {
          'quizsetref': getParameter<DocumentReference>(data, 'quizsetref'),
          'quizduration': getParameter<int>(data, 'quizduration'),
          'ccccc': getParameter<String>(data, 'ccccc'),
        },
      ),
  'createquizsets': ParameterData.none(),
  'addquiz': (data) async => ParameterData(
        allParams: {
          'quizset': getParameter<DocumentReference>(data, 'quizset'),
        },
      ),
  'Quizconifrmation': (data) async => ParameterData(
        allParams: {
          'quizref': getParameter<DocumentReference>(data, 'quizref'),
          'quizduratioh': getParameter<int>(data, 'quizduratioh'),
          'tit': getParameter<String>(data, 'tit'),
          'des': getParameter<String>(data, 'des'),
          'totques': getParameter<int>(data, 'totques'),
          'cov': getParameter<String>(data, 'cov'),
        },
      ),
  'signupnew': (data) async => ParameterData(
        allParams: {
          'newuser': getParameter<bool>(data, 'newuser'),
        },
      ),
  'score': (data) async => ParameterData(
        allParams: {
          'scoreachieved': getParameter<int>(data, 'scoreachieved'),
          'totalscore': getParameter<int>(data, 'totalscore'),
          'quizref': getParameter<DocumentReference>(data, 'quizref'),
          'cov': getParameter<String>(data, 'cov'),
        },
      ),
  'welcomegpt': ParameterData.none(),
  'gptpage': (data) async => ParameterData(
        allParams: {
          'chatref': getParameter<DocumentReference>(data, 'chatref'),
        },
      ),
  'tiktikkkkk': (data) async => ParameterData(
        allParams: {
          'docrefvide': getParameter<DocumentReference>(data, 'docrefvide'),
        },
      ),
  'Details36ArticleDetails': (data) async => ParameterData(
        allParams: {
          'doc': getParameter<DocumentReference>(data, 'doc'),
        },
      ),
  'OnboardingPage': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
