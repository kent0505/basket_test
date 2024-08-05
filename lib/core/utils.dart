import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/match.dart';

bool onboard = true;

// SHARED PREFS
Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboard');
  onboard = prefs.getBool('onboard') ?? true;
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}

// HIVE
List<MatchModel> matchesList = [];

Future<List<MatchModel>> getModels() async {
  final box = await Hive.openBox('matchesbox');
  List data = box.get('matchesList') ?? [];
  matchesList = data.cast<MatchModel>();
  log(matchesList.length.toString());
  return matchesList;
}

Future<List<MatchModel>> updateModels() async {
  final box = await Hive.openBox('matchesbox');
  box.put('matchesList', matchesList);
  matchesList = await box.get('matchesList');
  return matchesList;
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}
