import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_news_app/helper/shared_pref.dart';

import 'api_constants.dart';

@lazySingleton
class ApiClient {
  final Client _client;
  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    Locale language = await getLocale();
    print("Language: ${language.languageCode}");

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiN2YxMzAxMGI2YTU4NDY5NmNkODJlYWFiN2M0Njg2OTBkOTcwOTVkMTM4MjFmMzhiOWY3MmIzZTlmOGI4NWFmOTdhNzY4ODc0NzIwMjllMzciLCJpYXQiOjE2NTQ0MDg5ODUsIm5iZiI6MTY1NDQwODk4NSwiZXhwIjoxNjg1OTQ0OTg1LCJzdWIiOiIiLCJzY29wZXMiOltdfQ.abRJASXkiI_UJ-AdQZhBXfq9-8QcOucfrDa1U8LYtI6Nf0y3trMvVcnacxamCYGxzegSzJAKLs5v6c_b-hu4SFZncNWngZEigW07EoYQPGPzwsytN90NOhnuTZ87R7Xqk5UJNIaW6R44_yg7d9ZlQtQvMlYajv1LPa3O2q3fysaxoU7ILNv53J2m4X4A0LjiYeaHczEnsv5tzyUjR4hb0CogTHxVrdpb4I3wpxpeaYagAno1GjJbiX1HRG0XKjaH2FpqP5Vnob3q3bWhysKR5NSDeNiBhE7p0eM1Hez8O5vhvSMu0Xzrn61bbT-5UNobUmliQC7uM0iGAyAVB9_FbEtVpo6EDqLG-eanLpEBNgnJv58cpEMNRCZt7tYk1beG75AjKJlOlwdvSX33vRLed82FPxL3nLcsOvLAYkmJtL9ilAM3mXCcy7vqeHR3tsB5Iy6oPHC9SyQ20Ud-VOC5FeKaIVq69HbRJY0E-4sc9t5kGP7sAIKCjnCtHB8sgFv0dia0s-aQOwBDVysieOOJSj4WKb2b5lNdcBNgH3V9DFnbzam3aE6Oi7yfJ2f3ayzEMGRxgvs6pat_MZSkCON7sLWAAwzguus4nCbFW8B7vHqwFdp8jQzsX8JBos4LOXQ8hJD-vhjAgDIfoND8gU0D89jI822W9mHH9c_h7fU4VuM'
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
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiN2YxMzAxMGI2YTU4NDY5NmNkODJlYWFiN2M0Njg2OTBkOTcwOTVkMTM4MjFmMzhiOWY3MmIzZTlmOGI4NWFmOTdhNzY4ODc0NzIwMjllMzciLCJpYXQiOjE2NTQ0MDg5ODUsIm5iZiI6MTY1NDQwODk4NSwiZXhwIjoxNjg1OTQ0OTg1LCJzdWIiOiIiLCJzY29wZXMiOltdfQ.abRJASXkiI_UJ-AdQZhBXfq9-8QcOucfrDa1U8LYtI6Nf0y3trMvVcnacxamCYGxzegSzJAKLs5v6c_b-hu4SFZncNWngZEigW07EoYQPGPzwsytN90NOhnuTZ87R7Xqk5UJNIaW6R44_yg7d9ZlQtQvMlYajv1LPa3O2q3fysaxoU7ILNv53J2m4X4A0LjiYeaHczEnsv5tzyUjR4hb0CogTHxVrdpb4I3wpxpeaYagAno1GjJbiX1HRG0XKjaH2FpqP5Vnob3q3bWhysKR5NSDeNiBhE7p0eM1Hez8O5vhvSMu0Xzrn61bbT-5UNobUmliQC7uM0iGAyAVB9_FbEtVpo6EDqLG-eanLpEBNgnJv58cpEMNRCZt7tYk1beG75AjKJlOlwdvSX33vRLed82FPxL3nLcsOvLAYkmJtL9ilAM3mXCcy7vqeHR3tsB5Iy6oPHC9SyQ20Ud-VOC5FeKaIVq69HbRJY0E-4sc9t5kGP7sAIKCjnCtHB8sgFv0dia0s-aQOwBDVysieOOJSj4WKb2b5lNdcBNgH3V9DFnbzam3aE6Oi7yfJ2f3ayzEMGRxgvs6pat_MZSkCON7sLWAAwzguus4nCbFW8B7vHqwFdp8jQzsX8JBos4LOXQ8hJD-vhjAgDIfoND8gU0D89jI822W9mHH9c_h7fU4VuM'
    };

    final response =
        await _client.post(getPath(path, params), headers: headers, body: body);
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
