import 'package:connectivity_plus/connectivity_plus.dart';

class AppHelper {
  static Future<bool> hasConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    }
    return false;
  }

  static String getLanguageCode(String languageCode) {
    if (languageCode == 'my') {
      return 'mm';
    }

    if (languageCode == 'de') {
      return 'mm_mon';
    }

    return 'en';
  }
}
