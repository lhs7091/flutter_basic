import 'dart:convert';

import 'package:quiz_app_test/export.dart';

List<Quiz> parseQuizes(String response) {
  final parsed = json.decode(response).cast<Map<String, dynamic>>();
  return parsed.map<Quiz>((json) => Quiz.fromJson(json)).toList();
}
