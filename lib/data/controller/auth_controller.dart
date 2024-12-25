import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static const String _tokenKey = 'token-key';
  static const String _userId = 'user-id-key';
  static const String _userPass = 'user-pass-key';

  static String? accessToken;
  static String? user;
  static String? userPass;

  static Future<void> saveAccessToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_tokenKey, token);
    accessToken = token;
  }

  static Future<void> saveUserData(String userId, String userPassword) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_userId, userId);
    await sharedPreferences.setString(_userPass, userPassword);
    user = userId;
    userPass = userPassword;
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);
    accessToken = token;
    return token;
  }

  static Future<String?> getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userid = sharedPreferences.getString(_userId);
    user = userid;
    return userid;
  }

  static Future<String?> getUserPass() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userPassword = sharedPreferences.getString(_userPass);
    userPass = userPassword;
    return userPassword;
  }

  static bool isLoggedIn() {
    accessToken != null;
    return user != null;
  }

  static Future<void> clearAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_tokenKey);
    await sharedPreferences.remove(_userId);
    await sharedPreferences.remove(_userPass);
    accessToken = null;
    user = null;
    userPass = null;
  }
}
