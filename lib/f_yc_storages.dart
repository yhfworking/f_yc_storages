library f_yc_storages;

import 'dart:core';
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
  static bool checkLogin() {
    String userToken = FYcStorages.userToken();
    int userTokenExpired = FYcStorages.userTokenExpired();
    if (userToken.isNotEmpty && userTokenExpired != 0) {
      if (DateTime.now().millisecondsSinceEpoch < userTokenExpired) {
        return true;
      }
    }
    return false;
  }

  static Future<bool> cleanAllLoginInfo() async {
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
    return true;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static Future<bool> setUserToken(String userToken) async {
    if (apiConfig.userTokenKey.isNotEmpty) {
      await GetStorage().write(apiConfig.userTokenKey, userToken);
      return true;
    }
    return false;
  }

  static String userToken() {
    if (apiConfig.userTokenKey.isNotEmpty) {
      return GetStorage().read(apiConfig.userTokenKey) ?? "";
    }
    return "";
  }

  static Future<bool> setUserTokenExpired(int userTokenExpired) async {
    if (apiConfig.userTokenExpiredKey.isNotEmpty) {
      await GetStorage().write(apiConfig.userTokenExpiredKey, userTokenExpired);
      return true;
    }
    return false;
  }

  static int userTokenExpired() {
    if (apiConfig.userTokenExpiredKey.isNotEmpty) {
      return GetStorage().read(apiConfig.userTokenExpiredKey) ?? 0;
    }
    return 0;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static Future<bool> setIsFirstStartApp() async {
    if (apiConfig.isFirstStartAppKey.isNotEmpty) {
      await GetStorage().write(apiConfig.isFirstStartAppKey, true);
      return true;
    }
    return false;
  }

  static bool isFirstStartApp() {
    if (apiConfig.isFirstStartAppKey.isNotEmpty) {
      return GetStorage().read(apiConfig.isFirstStartAppKey) ?? false;
    }
    return false;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static Future<bool> setUserInfo(FYcEntitysUser entitysUser) async {
    if (apiConfig.userInfoKey.isNotEmpty) {
      await GetStorage().write(apiConfig.userInfoKey, entitysUser.toJson());
      return true;
    }
    return false;
  }

  static FYcEntitysUser userInfo() {
    if (apiConfig.userInfoKey.isNotEmpty) {
      return FYcEntitysUser.fromJson(
          GetStorage().read(apiConfig.userInfoKey) ?? {});
    }
    return FYcEntitysUser.fromJson({});
  }

  static Future<bool> setWalletInfo(FYcEntitysWallet entitysWallet) async {
    if (apiConfig.walletInfoKey.isNotEmpty) {
      await GetStorage().write(apiConfig.walletInfoKey, entitysWallet.toJson());
      return true;
    }
    return false;
  }

  static FYcEntitysWallet walletInfo() {
    if (apiConfig.walletInfoKey.isNotEmpty) {
      return FYcEntitysWallet.fromJson(
          GetStorage().read(apiConfig.walletInfoKey) ?? {});
    }
    return FYcEntitysWallet.fromJson({});
  }

  static Future<bool> setBehaviorInfo(
      FYcEntitysBehavior entitysBehavior) async {
    if (apiConfig.behaviorInfoKey.isNotEmpty) {
      await GetStorage()
          .write(apiConfig.behaviorInfoKey, entitysBehavior.toJson());
      return true;
    }
    return false;
  }

  static FYcEntitysBehavior behaviorInfo() {
    if (apiConfig.behaviorInfoKey.isNotEmpty) {
      return FYcEntitysBehavior.fromJson(
          GetStorage().read(apiConfig.behaviorInfoKey) ?? {});
    }
    return FYcEntitysBehavior.fromJson({});
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static Future<bool> setRemoteConfig(
      FYcEntitysRemoteConfig remoteConfig) async {
    if (apiConfig.remoteConfigKey.isNotEmpty) {
      await GetStorage()
          .write(apiConfig.remoteConfigKey, remoteConfig.toJson());
      return true;
    }
    return false;
  }

  static FYcEntitysRemoteConfig remoteConfig() {
    if (apiConfig.remoteConfigKey.isNotEmpty) {
      return FYcEntitysRemoteConfig.fromJson(
          GetStorage().read(apiConfig.remoteConfigKey) ?? {});
    }
    return FYcEntitysRemoteConfig.fromJson({});
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static Future<bool> setIsSignPrivacyPolicy() async {
    if (apiConfig.isSignPrivacyPolicyKey.isNotEmpty) {
      await GetStorage().write(apiConfig.isSignPrivacyPolicyKey, true);
      return true;
    }
    return false;
  }

  static bool isSignPrivacyPolicy() {
    if (apiConfig.isSignPrivacyPolicyKey.isNotEmpty) {
      return GetStorage().read(apiConfig.isSignPrivacyPolicyKey) ?? false;
    }
    return false;
  }

  static int lastRemoteConfigTimestamp() {
    if (apiConfig.lastRemoteConfigTimestampKey.isNotEmpty) {
      return GetStorage().read(apiConfig.lastRemoteConfigTimestampKey) ?? 0;
    }
    return 0;
  }

  static Future<bool> setLastRemoteConfigTimestamp() async {
    if (apiConfig.lastRemoteConfigTimestampKey.isNotEmpty) {
      await GetStorage().write(apiConfig.lastRemoteConfigTimestampKey,
          DateTime.now().millisecondsSinceEpoch);
      return true;
    }
    return false;
  }

  static int lastInterstitialAdShowTimestamp() {
    if (apiConfig.lastInterstitialAdShowTimestampKey.isNotEmpty) {
      return GetStorage().read(apiConfig.lastInterstitialAdShowTimestampKey) ??
          0;
    }
    return 0;
  }

  static Future<bool> setLastInterstitialAdShowTimestamp() async {
    if (apiConfig.lastInterstitialAdShowTimestampKey.isNotEmpty) {
      await GetStorage().write(apiConfig.lastInterstitialAdShowTimestampKey,
          DateTime.now().millisecondsSinceEpoch);
      return true;
    }
    return false;
  }

  static bool isInterstitialAdEnableShow() {
    int lastInterstitialAdShowTimestamp =
        FYcStorages.lastInterstitialAdShowTimestamp();
    int diffMs = (DateTime.now().millisecondsSinceEpoch -
            lastInterstitialAdShowTimestamp)
        .abs();
    FYcEntitysRemoteConfig entitysRemoteConfig = remoteConfig();
    int interstitialAdIntervalSec =
        entitysRemoteConfig.ad!.interstitialAdIntervalSec!;
    if (diffMs > interstitialAdIntervalSec * 1000) {
      return true;
    }
    return false;
  }

  static int lastRewardAdShowTimestamp() {
    if (apiConfig.lastRewardAdShowTimestampKey.isNotEmpty) {
      return GetStorage().read(apiConfig.lastRewardAdShowTimestampKey) ?? 0;
    }
    return 0;
  }

  static Future<bool> setLastRewardAdShowTimestamp() async {
    if (apiConfig.lastRewardAdShowTimestampKey.isNotEmpty) {
      await GetStorage().write(apiConfig.lastRewardAdShowTimestampKey,
          DateTime.now().millisecondsSinceEpoch);
      return true;
    }
    return false;
  }

  static bool isRewardAdEnableShow() {
    int lastRewardAdShowTimestamp = FYcStorages.lastRewardAdShowTimestamp();
    int diffMs =
        (DateTime.now().millisecondsSinceEpoch - lastRewardAdShowTimestamp)
            .abs();
    FYcEntitysRemoteConfig entitysRemoteConfig = remoteConfig();
    int rewardAdIntervalSec = entitysRemoteConfig.ad!.rewardAdIntervalSec!;
    if (diffMs > rewardAdIntervalSec * 1000) {
      return true;
    }
    return false;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
