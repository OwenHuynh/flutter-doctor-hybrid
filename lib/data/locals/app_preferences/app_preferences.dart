import 'package:flutter_doctors_demo/data/locals/app_preferences/app_preferences_keys.dart';
import 'package:flutter_doctors_demo/domain/entities/user.dart';
import 'package:flutter_doctors_demo/utils/device_util.dart';
import 'package:flutter_doctors_demo/utils/shared_preferences_util.dart';

class AppPreferences {
  Future<void> saveUserTokenInfo(
      {required String accessToken,
      required int expiresIn,
      required int timestamp}) async {
    await setAccessToken(accessToken);
    await setExpiresIn(expiresIn);
    await setTimestamp(timestamp);
  }

  Future<void> setAccessToken(String token) async {
    await SharedPreferencesUtil.putString(
        AppPreferencesKeys.accessTokenKey, token);
  }

  Future<String?> getAccessToken() async {
    final accessToken = await SharedPreferencesUtil.getString(
        AppPreferencesKeys.accessTokenKey);
    return accessToken;
  }

  Future<void> setRefreshToken(String refreshToken) async {
    await SharedPreferencesUtil.putString(
        AppPreferencesKeys.refreshTokenKey, refreshToken);
  }

  Future<String?> getRefreshToken() async {
    final refreshToken = await SharedPreferencesUtil.getString(
        AppPreferencesKeys.refreshTokenKey);
    return refreshToken;
  }

  Future<void> setExpiresIn(int expires) async {
    await SharedPreferencesUtil.putString(
        AppPreferencesKeys.expiresInKey, expires.toString());
  }

  Future<int> getExpiresIn() async {
    final expires =
        await SharedPreferencesUtil.getString(AppPreferencesKeys.expiresInKey);
    return int.parse(expires ?? "0");
  }

  Future<void> setTimestamp(int timestamp) async {
    await SharedPreferencesUtil.putString(
        AppPreferencesKeys.timestampKey, timestamp.toString());
  }

  Future<int> getTimestamp() async {
    final timestamp =
        await SharedPreferencesUtil.getString(AppPreferencesKeys.timestampKey);
    return int.parse(timestamp ?? "0");
  }

  Future<void> deleteKey(String key) async {
    await SharedPreferencesUtil.deleteKey(key);
  }

  Future<bool> isLogged() async {
    final result = await getAccessToken();
    if (result == null) {
      return false;
    }

    return result.isNotEmpty;
  }

  Future<String> loadDeviceId() async {
    final uuidPreference =
        await SharedPreferencesUtil.getString(AppPreferencesKeys.deviceIdKey);

    if (uuidPreference == null) {
      final temp = DeviceUtil.deviceId;
      await SharedPreferencesUtil.deleteKey(AppPreferencesKeys.deviceIdKey);
      await SharedPreferencesUtil.putString(
          AppPreferencesKeys.deviceIdKey, temp);

      return temp;
    }

    return uuidPreference;
  }

  Future<void> setUserData(User user) async {
    await SharedPreferencesUtil.putObject(
        AppPreferencesKeys.profileDataKey, user);
  }

  Future<User?> getUserData() async {
    final data =
        // ignore: cast_nullable_to_non_nullable
        await SharedPreferencesUtil.getObject(AppPreferencesKeys.profileDataKey)
            as Map<String, dynamic>;
    return User.fromJson(data);
  }
}
