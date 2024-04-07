import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userWalletKey = "USERWALLETKEy";

  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(userIdKey, getUserId);
  }

  //==================================================
  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(userNameKey, getUserName);
  }

  //=====================================================
  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(userEmailKey, getUserEmail);
  }

  //===========================================================
  Future<bool> saveUserWallet(String getUserWallet) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(userWalletKey, getUserWallet);
  }

  Future<String?> getUserid() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(userIdKey);
  }

  Future<String?> getUserName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(userNameKey);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(userEmailKey);
  }

  Future<String?> getUserWallet() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(userWalletKey);
  }
}
