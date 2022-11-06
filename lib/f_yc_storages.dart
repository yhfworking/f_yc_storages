library f_yc_storages;

import 'dart:core' as core;
import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_entity/f_yc_entity.dart';
import 'package:get_storage/get_storage.dart';

/// 初始化
class FYcStorages {
  static final FYcStorages _instance = FYcStorages._();

  static FYcStorages get instance => FYcStorages();

  factory FYcStorages() => _instance;

  static FYcConfigStoragesConfig apiConfig = FYcConfigConfigurator.instance
      .getConfig(configId: KIT_CONFIG_ID)
      .storagesConfig;

  FYcStorages._() {
    GetStorage.init().then((value) => {});
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  core.bool checkLogin() {
    core.String userToken = this.userToken();
    core.int userTokenExpired = this.userTokenExpired();
    if (userToken.isNotEmpty && userTokenExpired != 0) {
      if (core.DateTime.now().millisecondsSinceEpoch < userTokenExpired) {
        return true;
      }
    }
    return false;
  }

  void cleanAllLoginInfo() async {
    if (apiConfig.userTokenKey.isNotEmpty) {
      await GetStorage().remove(apiConfig.userTokenKey);
    }
    if (apiConfig.userTokenExpiredKey.isNotEmpty) {
      await GetStorage().remove(apiConfig.userTokenExpiredKey);
    }
    if (apiConfig.userInfoKey.isNotEmpty) {
      await GetStorage().remove(apiConfig.userInfoKey);
    }
    if (apiConfig.walletInfoKey.isNotEmpty) {
      await GetStorage().remove(apiConfig.walletInfoKey);
    }
    if (apiConfig.behaviorInfoKey.isNotEmpty) {
      await GetStorage().remove(apiConfig.behaviorInfoKey);
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void setUserToken(core.String userToken) async {
    if (apiConfig.userTokenKey.isNotEmpty) {
      await GetStorage().write(apiConfig.userTokenKey, userToken);
    }
  }

  core.String userToken() {
    if (apiConfig.userTokenKey.isNotEmpty) {
      return GetStorage().read(apiConfig.userTokenKey) ?? "";
    }
    return "";
  }

  void setUserTokenExpired(core.int userTokenExpired) async {
    if (apiConfig.userTokenExpiredKey.isNotEmpty) {
      await GetStorage().write(apiConfig.userTokenExpiredKey, userTokenExpired);
    }
  }

  core.int userTokenExpired() {
    if (apiConfig.userTokenExpiredKey.isNotEmpty) {
      return GetStorage().read(apiConfig.userTokenExpiredKey) ?? 0;
    }
    return 0;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void setIsFirstStartApp() async {
    if (apiConfig.isFirstStartAppKey.isNotEmpty) {
      await GetStorage().write(apiConfig.isFirstStartAppKey, true);
    }
  }

  core.bool isFirstStartApp() {
    if (apiConfig.isFirstStartAppKey.isNotEmpty) {
      return GetStorage().read(apiConfig.isFirstStartAppKey) ?? false;
    }
    return false;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void setUserInfo(FYcEntitysUser entitysUser) async {
    if (apiConfig.userInfoKey.isNotEmpty) {
      await GetStorage().write(apiConfig.userInfoKey, entitysUser.toJson());
    }
  }

  FYcEntitysUser userInfo() {
    if (apiConfig.userInfoKey.isNotEmpty) {
      return FYcEntitysUser.fromJson(
          GetStorage().read(apiConfig.userInfoKey) ?? {});
    }
    return FYcEntitysUser.fromJson({});
  }

  void setWalletInfo(FYcEntitysWallet entitysWallet) async {
    if (apiConfig.walletInfoKey.isNotEmpty) {
      await GetStorage().write(apiConfig.walletInfoKey, entitysWallet.toJson());
    }
  }

  FYcEntitysWallet walletInfo() {
    if (apiConfig.walletInfoKey.isNotEmpty) {
      return FYcEntitysWallet.fromJson(
          GetStorage().read(apiConfig.walletInfoKey) ?? {});
    }
    return FYcEntitysWallet.fromJson({});
  }

  void setBehaviorInfo(FYcEntitysBehavior entitysBehavior) async {
    if (apiConfig.behaviorInfoKey.isNotEmpty) {
      await GetStorage()
          .write(apiConfig.behaviorInfoKey, entitysBehavior.toJson());
    }
  }

  FYcEntitysBehavior behaviorInfo() {
    if (apiConfig.behaviorInfoKey.isNotEmpty) {
      return FYcEntitysBehavior.fromJson(
          GetStorage().read(apiConfig.behaviorInfoKey) ?? {});
    }
    return FYcEntitysBehavior.fromJson({});
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void setRemoteConfig(FYcEntitysRemoteConfig remoteConfig) async {
    if (apiConfig.remoteConfigKey.isNotEmpty) {
      await GetStorage()
          .write(apiConfig.remoteConfigKey, remoteConfig.toJson());
    }
  }

  FYcEntitysRemoteConfig remoteConfig() {
    if (apiConfig.remoteConfigKey.isNotEmpty) {
      return FYcEntitysRemoteConfig.fromJson(
          GetStorage().read(apiConfig.remoteConfigKey) ?? {});
    }
    return FYcEntitysRemoteConfig.fromJson({});
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void setIsSignPrivacyPolicy() async {
    if (apiConfig.isSignPrivacyPolicyKey.isNotEmpty) {
      await GetStorage().write(apiConfig.isSignPrivacyPolicyKey, true);
    }
  }

  core.bool isSignPrivacyPolicy() {
    if (apiConfig.isSignPrivacyPolicyKey.isNotEmpty) {
      return GetStorage().read(apiConfig.isSignPrivacyPolicyKey) ?? false;
    }
    return false;
  }

  core.int lastRemoteConfigTimestamp() {
    if (apiConfig.lastRemoteConfigTimestampKey.isNotEmpty) {
      return GetStorage().read(apiConfig.lastRemoteConfigTimestampKey) ?? 0;
    }
    return 0;
  }

  void setLastRemoteConfigTimestamp() async {
    if (apiConfig.lastRemoteConfigTimestampKey.isNotEmpty) {
      await GetStorage().write(apiConfig.lastRemoteConfigTimestampKey,
          core.DateTime.now().millisecondsSinceEpoch);
    }
  }

  core.int lastInterstitialAdShowTimestamp() {
    if (apiConfig.lastInterstitialAdShowTimestampKey.isNotEmpty) {
      return GetStorage().read(apiConfig.lastInterstitialAdShowTimestampKey) ??
          0;
    }
    return 0;
  }

  void setLastInterstitialAdShowTimestamp() async {
    if (apiConfig.lastInterstitialAdShowTimestampKey.isNotEmpty) {
      await GetStorage().write(apiConfig.lastInterstitialAdShowTimestampKey,
          core.DateTime.now().millisecondsSinceEpoch);
    }
  }

  core.int lastRewardAdShowTimestamp() {
    if (apiConfig.lastRewardAdShowTimestampKey.isNotEmpty) {
      return GetStorage().read(apiConfig.lastRewardAdShowTimestampKey) ?? 0;
    }
    return 0;
  }

  void setLastRewardAdShowTimestamp() async {
    if (apiConfig.lastRewardAdShowTimestampKey.isNotEmpty) {
      await GetStorage().write(apiConfig.lastRewardAdShowTimestampKey,
          core.DateTime.now().millisecondsSinceEpoch);
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
