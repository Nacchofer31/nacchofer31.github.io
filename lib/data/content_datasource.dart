import 'dart:convert';

import 'package:flutter/services.dart';

class ContentDataSource {
  Future<Map<String, dynamic>> getData(String path) async {
    final content = await rootBundle.loadString(path);
    return jsonDecode(content);
  }
}
