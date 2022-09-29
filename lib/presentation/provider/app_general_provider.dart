import 'package:flutter/material.dart';

import '../../data/app_repo.dart';
import '../../helper/shared_pref.dart';

class AppGeneralProvider with ChangeNotifier {
  final AppRepo appRepo;

  AppGeneralProvider({required this.appRepo});

  Future<int> postDonate(String name, String email, String phoneNumber) async {
    try {
      final result = await appRepo.postDonate(name, email, phoneNumber);
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> postFeedback(
      String name, String email, String phoneNumber, String message) async {
    try {
      final result =
          await appRepo.postFeedback(name, email, phoneNumber, message);
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getAuth() async {
    try {
      final result = await appRepo.getAuth();
      setAuth(result);
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
