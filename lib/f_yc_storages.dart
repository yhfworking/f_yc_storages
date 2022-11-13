library f_yc_storages;

import 'dart:core';
import 'dart:developer';
import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_entity/f_yc_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

/// 初始化
class FYcStorages {
  static FYcConfigStoragesConfig storagesConfig = FYcConfigConfigurator.instance
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
    if (storagesConfig.userTokenKey.isNotEmpty) {
      await GetStorage().remove(storagesConfig.userTokenKey);
    }
    if (storagesConfig.userTokenExpiredKey.isNotEmpty) {
      await GetStorage().remove(storagesConfig.userTokenExpiredKey);
    }
    if (storagesConfig.userInfoKey.isNotEmpty) {
      await GetStorage().remove(storagesConfig.userInfoKey);
    }
    if (storagesConfig.walletInfoKey.isNotEmpty) {
      await GetStorage().remove(storagesConfig.walletInfoKey);
    }
    if (storagesConfig.behaviorInfoKey.isNotEmpty) {
      await GetStorage().remove(storagesConfig.behaviorInfoKey);
    }
    if (kDebugMode) {
      log('----已清除登录信息----');
    }
    return true;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static Future<bool> setUserToken(String userToken) async {
    if (storagesConfig.userTokenKey.isNotEmpty) {
      await GetStorage().write(storagesConfig.userTokenKey, userToken);
      return true;
    }
    return false;
  }

  static String userToken() {
    if (storagesConfig.userTokenKey.isNotEmpty) {
      return GetStorage().read(storagesConfig.userTokenKey) ?? "";
    }
    return "";
  }

  static Future<bool> setUserTokenExpired(int userTokenExpired) async {
    if (storagesConfig.userTokenExpiredKey.isNotEmpty) {
      await GetStorage()
          .write(storagesConfig.userTokenExpiredKey, userTokenExpired);
      return true;
    }
    return false;
  }

  static int userTokenExpired() {
    if (storagesConfig.userTokenExpiredKey.isNotEmpty) {
      return GetStorage().read(storagesConfig.userTokenExpiredKey) ?? 0;
    }
    return 0;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static Future<bool> setIsFirstStartApp() async {
    if (storagesConfig.isFirstStartAppKey.isNotEmpty) {
      await GetStorage().write(storagesConfig.isFirstStartAppKey, true);
      return true;
    }
    return false;
  }

  static bool isFirstStartApp() {
    if (storagesConfig.isFirstStartAppKey.isNotEmpty) {
      return GetStorage().read(storagesConfig.isFirstStartAppKey) ?? false;
    }
    return false;
  }

  static Future<bool> setRewardAmount(int amount) async {
    if (storagesConfig.rewardAmountKey.isNotEmpty) {
      await GetStorage().write(storagesConfig.rewardAmountKey, amount);
      return true;
    }
    return false;
  }

  static int rewardAmount() {
    if (storagesConfig.rewardAmountKey.isNotEmpty) {
      return GetStorage().read(storagesConfig.rewardAmountKey) ?? 0;
    }
    return 0;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static Future<bool> setUserInfo(FYcEntitysUser entitysUser) async {
    if (storagesConfig.userInfoKey.isNotEmpty) {
      await GetStorage()
          .write(storagesConfig.userInfoKey, entitysUser.toJson());
      return true;
    }
    return false;
  }

  static FYcEntitysUser userInfo() {
    if (storagesConfig.userInfoKey.isNotEmpty) {
      return FYcEntitysUser.fromJson(
          GetStorage().read(storagesConfig.userInfoKey) ?? {});
    }
    return FYcEntitysUser.fromJson({});
  }

  static Future<bool> setWalletInfo(FYcEntitysWallet entitysWallet) async {
    if (storagesConfig.walletInfoKey.isNotEmpty) {
      await GetStorage()
          .write(storagesConfig.walletInfoKey, entitysWallet.toJson());
      return true;
    }
    return false;
  }

  static FYcEntitysWallet walletInfo() {
    if (storagesConfig.walletInfoKey.isNotEmpty) {
      return FYcEntitysWallet.fromJson(
          GetStorage().read(storagesConfig.walletInfoKey) ?? {});
    }
    return FYcEntitysWallet.fromJson({});
  }

  static Future<bool> setBehaviorInfo(
      FYcEntitysBehavior entitysBehavior) async {
    if (storagesConfig.behaviorInfoKey.isNotEmpty) {
      await GetStorage()
          .write(storagesConfig.behaviorInfoKey, entitysBehavior.toJson());
      return true;
    }
    return false;
  }

  static FYcEntitysBehavior behaviorInfo() {
    if (storagesConfig.behaviorInfoKey.isNotEmpty) {
      return FYcEntitysBehavior.fromJson(
          GetStorage().read(storagesConfig.behaviorInfoKey) ?? {});
    }
    return FYcEntitysBehavior.fromJson({});
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static Future<bool> setRemoteConfig(
      FYcEntitysRemoteConfig remoteConfig) async {
    if (storagesConfig.remoteConfigKey.isNotEmpty) {
      await GetStorage()
          .write(storagesConfig.remoteConfigKey, remoteConfig.toJson());
      return true;
    }
    return false;
  }

  static FYcEntitysRemoteConfig remoteConfig() {
    if (storagesConfig.remoteConfigKey.isNotEmpty) {
      return FYcEntitysRemoteConfig.fromJson(
          GetStorage().read(storagesConfig.remoteConfigKey) ?? {});
    }
    return FYcEntitysRemoteConfig.fromJson({});
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static Future<bool> setIsSignPrivacyPolicy() async {
    if (storagesConfig.isSignPrivacyPolicyKey.isNotEmpty) {
      await GetStorage().write(storagesConfig.isSignPrivacyPolicyKey, true);
      return true;
    }
    return false;
  }

  static bool isSignPrivacyPolicy() {
    if (storagesConfig.isSignPrivacyPolicyKey.isNotEmpty) {
      return GetStorage().read(storagesConfig.isSignPrivacyPolicyKey) ?? false;
    }
    return false;
  }

  static int lastRemoteConfigTimestamp() {
    if (storagesConfig.lastRemoteConfigTimestampKey.isNotEmpty) {
      return GetStorage().read(storagesConfig.lastRemoteConfigTimestampKey) ??
          0;
    }
    return 0;
  }

  static Future<bool> setLastRemoteConfigTimestamp() async {
    if (storagesConfig.lastRemoteConfigTimestampKey.isNotEmpty) {
      await GetStorage().write(storagesConfig.lastRemoteConfigTimestampKey,
          DateTime.now().millisecondsSinceEpoch);
      return true;
    }
    return false;
  }

  static int lastInterstitialAdShowTimestamp() {
    if (storagesConfig.lastInterstitialAdShowTimestampKey.isNotEmpty) {
      return GetStorage()
              .read(storagesConfig.lastInterstitialAdShowTimestampKey) ??
          0;
    }
    return 0;
  }

  static Future<bool> setLastInterstitialAdShowTimestamp() async {
    if (storagesConfig.lastInterstitialAdShowTimestampKey.isNotEmpty) {
      await GetStorage().write(
          storagesConfig.lastInterstitialAdShowTimestampKey,
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
    if (storagesConfig.lastRewardAdShowTimestampKey.isNotEmpty) {
      return GetStorage().read(storagesConfig.lastRewardAdShowTimestampKey) ??
          0;
    }
    return 0;
  }

  static Future<bool> setLastRewardAdShowTimestamp() async {
    if (storagesConfig.lastRewardAdShowTimestampKey.isNotEmpty) {
      await GetStorage().write(storagesConfig.lastRewardAdShowTimestampKey,
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
