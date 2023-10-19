import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Open AI chatgpt Group Code

class OpenAIChatgptGroup {
  static String baseUrl = 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static SendFullPromptCall sendFullPromptCall = SendFullPromptCall();
}

class SendFullPromptCall {
  Future<ApiCallResponse> call({
    String? apikey = '',
    dynamic? promptJson,
  }) {
    final prompt = _serializeJson(promptJson);
    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo",
  "messages": ${prompt}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send full prompt',
      apiUrl: '${OpenAIChatgptGroup.baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic createdtimestrap(dynamic response) => getJsonField(
        response,
        r'''$.created''',
      );
  dynamic role(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.role''',
      );
  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.content''',
      );
}

/// End Open AI chatgpt Group Code

class SendingWebsiteToFlutterflowWebsiteUploaderCall {
  static Future<ApiCallResponse> call({
    String? url = '',
    int? linksdeep,
  }) {
    final ffApiRequestBody = '''
{
 "question": "what is this website about?",
 "overrideconfig": {
 "url":"${url}",
 "webScarp": true,
 "limit":${linksdeep}
 }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sending website to flutterflow website uploader',
      apiUrl:
          'https://flowise-nh65.onrender.com/api/v1/prediction/3352c94c-ffa1-42ce-8664-fdbe64dd6393',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer Kk2sixXVFq4eN4dHYUdCbdXTouDNmJsnn+SsPLUwYs4=',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AskFlutterExsampleCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ask flutter exsample ',
      apiUrl:
          'https://flowise-nh65.onrender.com/api/v1/prediction/eb68c2a9-2767-4b4e-826f-8249c1d4e3e9',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer Kk2sixXVFq4eN4dHYUdCbdXTouDNmJsnn+SsPLUwYs4=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AIChatCall {
  static Future<ApiCallResponse> call({
    String? message = '',
    String? apikey = '',
  }) {
    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo",
  "messages": ${message}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AI chat',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic messagecontent(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.content''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
