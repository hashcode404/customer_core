import 'package:customer_core/src/core/constants/app_identifiers.dart';
import 'package:customer_core/src/domain/user/i_user_shared_prefs.dart';
import 'package:customer_core/src/domain/user/models/user_login_response.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IUserSharedPrefsRepo)
class UserSharedPrefsRepo implements IUserSharedPrefsRepo {
  static const String kUserPrefsKey =
      "${AppIdentifiers.kBuildIdentifier}/user_data";
  static const String kGuestPrefsKey =
      "${AppIdentifiers.kBuildIdentifier}/guest_data";

  @override
  Future<UserLoginResponse?> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(kUserPrefsKey);
    if (data == null) return null;
    return UserLoginResponse.fromJson(data);
  }

  @override
  Future<bool> saveUserData(UserLoginResponse userData) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(kUserPrefsKey, userData.toJson());
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> deleteUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs
        .remove(kUserPrefsKey)
        .then((val) => val)
        .catchError((_) => false);
  }

  @override
  Future<bool> deleteGuestID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs
        .remove(kGuestPrefsKey)
        .then((_) => true)
        .catchError((_) => false);
  }

  @override
  Future<String?> getGuestID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(kGuestPrefsKey);
    if (data == null) return null;
    return data;
  }

  @override
  Future<bool> saveGuestID(String guestID) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(kGuestPrefsKey, guestID);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> isTokenExpired() async {
    final userData = await getUserData();
    if (userData == null) return false;
    final expireAt = userData.expireAt;
    if (expireAt == null) return false;
    return DateTime.now()
        .isAfter(DateTime.fromMillisecondsSinceEpoch(expireAt));
  }

  @override
  Future<String?> getToken() async {
    final userData = await getUserData();
    if (userData == null) return null;
    final token = userData.token;
    if (token.isEmpty) return null;
    final expireAt = userData.expireAt;
    if (expireAt == null) return null;
    if (DateTime.now().isAfter(DateTime.fromMillisecondsSinceEpoch(expireAt))) {
      return "Token Expired";
    }

    return token;
  }
}
