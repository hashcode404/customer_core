import 'package:customer_core/src/domain/user/models/user_login_response.dart';

abstract class IUserSharedPrefsRepo {
  Future<bool> saveUserData(UserLoginResponse userData);

  Future<bool> deleteUserData();

  Future<UserLoginResponse?> getUserData();

  Future<bool> saveGuestID(String guestID);

  Future<bool> deleteGuestID();

  Future<String?> getGuestID();

  Future<bool> isTokenExpired();

  Future<String?> getToken();
}
