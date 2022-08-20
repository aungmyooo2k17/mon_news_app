import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_news_app/helper/shared_pref.dart';
import '../../helper/shared_pref.dart';
import 'api_constants.dart';

@lazySingleton
class ApiClient {
  final Client _client;
  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    Locale language = await getLocale();

    String auth = await getAuth();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $auth'
    };

    String lanCode = '';
    if (language.languageCode == 'my') {
      lanCode = 'mm';
      headers.addAll({"Accept-Language": lanCode});
    }

    if (language.languageCode == 'de') {
      lanCode = 'mm_mon';
      headers.addAll({"Accept-Language": lanCode});
    }

    final response = await _client.get(getPath(path, params), headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(
      {required String path,
      Map<dynamic, dynamic>? params,
      Map<dynamic, dynamic>? body}) async {
    String auth = await getAuth();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $auth'
    };

    final response =
        await _client.post(getPath(path, params), headers: headers, body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic delete(
      {required String path,
      Map<dynamic, dynamic>? params,
      Map<dynamic, dynamic>? body}) async {
    String auth = await getAuth();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $auth'
    };

    final response = await _client.delete(getPath(path, params),
        headers: headers, body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return Uri.parse('${ApiConstants.BASE_URL}$path?$paramsString');
  }
}
