library f_yc_storages;

import 'dart:core' as core;
import 'dart:developer';
import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_entity/f_yc_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

/// 初始化
class FYcStorages {
  static FYcConfigStoragesConfig apiConfig = FYcConfigConfigurator.instance
      .getConfig(configId: KIT_CONFIG_ID)
      .storagesConfig;
  static initializer() async {
    await GetStorage.init();
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static core.bool checkLogin() {
    core.String userToken = FYcStorages.userToken();
    core.int userTokenExpired = FYcStorages.userTokenExpired();
    if (userToken.isNotEmpty && userTokenExpired != 0) {
      if (core.DateTime.now().millisecondsSinceEpoch < userTokenExpired) {
        return true;
      }
    }
    return false;
  }

  static void cleanAllLoginInfo() async {
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
    if (kDebugMode) {
      log('----已清除登录信息----');
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static void setUserToken(core.String userToken) async {
    if (apiConfig.userTokenKey.isNotEmpty) {
      await GetStorage().write(apiConfig.userTokenKey, userToken);
    }
  }

  static core.String userToken() {
    if (apiConfig.userTokenKey.isNotEmpty) {
      return GetStorage().read(apiConfig.userTokenKey) ?? "";
    }
    return "";
  }

  static void setUserTokenExpired(core.int userTokenExpired) async {
    if (apiConfig.userTokenExpiredKey.isNotEmpty) {
      await GetStorage().write(apiConfig.userTokenExpiredKey, userTokenExpired);
    }
  }

  static core.int userTokenExpired() {
    if (apiConfig.userTokenExpiredKey.isNotEmpty) {
      return GetStorage().read(apiConfig.userTokenExpiredKey) ?? 0;
    }
    return 0;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static void setIsFirstStartApp() async {
    if (apiConfig.isFirstStartAppKey.isNotEmpty) {
      await GetStorage().write(apiConfig.isFirstStartAppKey, true);
    }
  }

  static core.bool isFirstStartApp() {
    if (apiConfig.isFirstStartAppKey.isNotEmpty) {
      return GetStorage().read(apiConfig.isFirstStartAppKey) ?? false;
    }
    return false;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static void setUserInfo(FYcEntitysUser entitysUser) async {
    if (apiConfig.userInfoKey.isNotEmpty) {
      await GetStorage().write(apiConfig.userInfoKey, entitysUser.toJson());
    }
  }

  static FYcEntitysUser userInfo() {
    if (apiConfig.userInfoKey.isNotEmpty) {
      return FYcEntitysUser.fromJson(
          GetStorage().read(apiConfig.userInfoKey) ?? {});
    }
    return FYcEntitysUser.fromJson({});
  }

  static void setWalletInfo(FYcEntitysWallet entitysWallet) async {
    if (apiConfig.walletInfoKey.isNotEmpty) {
      await GetStorage().write(apiConfig.walletInfoKey, entitysWallet.toJson());
    }
  }

  static FYcEntitysWallet walletInfo() {
    if (apiConfig.walletInfoKey.isNotEmpty) {
      return FYcEntitysWallet.fromJson(
          GetStorage().read(apiConfig.walletInfoKey) ?? {});
    }
    return FYcEntitysWallet.fromJson({});
  }

  static void setBehaviorInfo(FYcEntitysBehavior entitysBehavior) async {
    if (apiConfig.behaviorInfoKey.isNotEmpty) {
      await GetStorage()
          .write(apiConfig.behaviorInfoKey, entitysBehavior.toJson());
    }
  }

  static FYcEntitysBehavior behaviorInfo() {
    if (apiConfig.behaviorInfoKey.isNotEmpty) {
      return FYcEntitysBehavior.fromJson(
          GetStorage().read(apiConfig.behaviorInfoKey) ?? {});
    }
    return FYcEntitysBehavior.fromJson({});
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static void setRemoteConfig(FYcEntitysRemoteConfig remoteConfig) async {
    if (apiConfig.remoteConfigKey.isNotEmpty) {
      await GetStorage()
          .write(apiConfig.remoteConfigKey, remoteConfig.toJson());
    }
  }

  static FYcEntitysRemoteConfig remoteConfig() {
    if (apiConfig.remoteConfigKey.isNotEmpty) {
      return FYcEntitysRemoteConfig.fromJson(
          GetStorage().read(apiConfig.remoteConfigKey) ?? {});
    }
    return FYcEntitysRemoteConfig.fromJson({});
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static void setIsSignPrivacyPolicy() async {
    if (apiConfig.isSignPrivacyPolicyKey.isNotEmpty) {
      await GetStorage().write(apiConfig.isSignPrivacyPolicyKey, true);
    }
  }

  static core.bool isSignPrivacyPolicy() {
    if (apiConfig.isSignPrivacyPolicyKey.isNotEmpty) {
      return GetStorage().read(apiConfig.isSignPrivacyPolicyKey) ?? false;
    }
    return false;
  }

  static core.int lastRemoteConfigTimestamp() {
    if (apiConfig.lastRemoteConfigTimestampKey.isNotEmpty) {
      return GetStorage().read(apiConfig.lastRemoteConfigTimestampKey) ?? 0;
    }
    return 0;
  }

  static void setLastRemoteConfigTimestamp() async {
    if (apiConfig.lastRemoteConfigTimestampKey.isNotEmpty) {
      await GetStorage().write(apiConfig.lastRemoteConfigTimestampKey,
          core.DateTime.now().millisecondsSinceEpoch);
    }
  }

  static core.int lastInterstitialAdShowTimestamp() {
    if (apiConfig.lastInterstitialAdShowTimestampKey.isNotEmpty) {
      return GetStorage().read(apiConfig.lastInterstitialAdShowTimestampKey) ??
          0;
    }
    return 0;
  }

  static void setLastInterstitialAdShowTimestamp() async {
    if (apiConfig.lastInterstitialAdShowTimestampKey.isNotEmpty) {
      await GetStorage().write(apiConfig.lastInterstitialAdShowTimestampKey,
          core.DateTime.now().millisecondsSinceEpoch);
    }
  }

  static core.int lastRewardAdShowTimestamp() {
    if (apiConfig.lastRewardAdShowTimestampKey.isNotEmpty) {
      return GetStorage().read(apiConfig.lastRewardAdShowTimestampKey) ?? 0;
    }
    return 0;
  }

  static void setLastRewardAdShowTimestamp() async {
    if (apiConfig.lastRewardAdShowTimestampKey.isNotEmpty) {
      await GetStorage().write(apiConfig.lastRewardAdShowTimestampKey,
          core.DateTime.now().millisecondsSinceEpoch);
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
