import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_shaadi/app/data/model/people.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://randomuser.me/api/?results=10';

class RemoteSource {
  final http.Client httpClient;
  RemoteSource({@required this.httpClient});

  getAll() async {
    try {
      var response = await httpClient.get(baseUrl);
      print('Response: ' + response.body);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body)['results'] as List;
        List<People> list =
            jsonResponse.map((model) => People.fromJson(model)).toList();
        print('Response List: ${list.length}');
        return list;
      } else {
        print('Error');
      }
    } catch (_) {
      print('Response Exception: $_');
    }
  }
}
