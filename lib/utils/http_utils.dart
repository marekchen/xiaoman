import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

final client = http.Client();

Future<Response> postRequest(String uri, dynamic body) {
  print("uri:" + uri);
  return client.post(uri, body: body);
}
