import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _systemMessage = prefs.getString('ff_systemMessage') ?? _systemMessage;
    });
    _safeInit(() {
      _UserReinforcement =
          prefs.getString('ff_UserReinforcement') ?? _UserReinforcement;
    });
    _safeInit(() {
      _gptOpener = prefs.getString('ff_gptOpener') ?? _gptOpener;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _completedquestions = 0;
  int get completedquestions => _completedquestions;
  set completedquestions(int _value) {
    _completedquestions = _value;
  }

  int _score = 0;
  int get score => _score;
  set score(int _value) {
    _score = _value;
  }

  String _systemMessage =
      'You are a helpful AI assistant that helps answer any questions people may have!';
  String get systemMessage => _systemMessage;
  set systemMessage(String _value) {
    _systemMessage = _value;
    prefs.setString('ff_systemMessage', _value);
  }

  String _UserReinforcement =
      'Hello! Just to reiterate, you are a helpful AI assistant that helps answer any questions people may have!';
  String get UserReinforcement => _UserReinforcement;
  set UserReinforcement(String _value) {
    _UserReinforcement = _value;
    prefs.setString('ff_UserReinforcement', _value);
  }

  String _gptOpener = 'How can I help you today?';
  String get gptOpener => _gptOpener;
  set gptOpener(String _value) {
    _gptOpener = _value;
    prefs.setString('ff_gptOpener', _value);
  }

  bool _awaitingReply = false;
  bool get awaitingReply => _awaitingReply;
  set awaitingReply(bool _value) {
    _awaitingReply = _value;
  }

  String _prompt = '';
  String get prompt => _prompt;
  set prompt(String _value) {
    _prompt = _value;
  }

  bool _unlocked = false;
  bool get unlocked => _unlocked;
  set unlocked(bool _value) {
    _unlocked = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
