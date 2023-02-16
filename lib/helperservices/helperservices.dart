import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/models/course_models.dart';

class HelperServices {
  Future<List<Courses>> getCourses() async {
    var client = http.Client();
    var uri = 'https://nut-case.s3.amazonaws.com/coursessc.json';
    var url = Uri.parse(uri);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return coursesFromJson(json);
    }
    return [];
  }
}
