import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:tkchatfinal/core/services/services.dart';
import 'package:tkchatfinal/ui/values/values.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();

  bool isFirstOpen = false;
  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';
  bool get isRelease => const bool.fromEnvironment("dart.vm.product"); //what's this
  Locale locale = const Locale('en', 'US');
  List<Locale> languages = [
    const Locale('en', 'US'),
    const Locale('tr', 'TR'),
  ];

  @override
  void onInit() {
    super.onInit();
    isFirstOpen = StorageService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // Mark the user has opened the APP
  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, true);
  }

  void onInitLocale() {
    var langCode = StorageService.to.getString(STORAGE_LANGUAGE_CODE);
    if (langCode.isEmpty) return;
    var index = languages.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = languages[index];
  }

  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    StorageService.to.setString(STORAGE_LANGUAGE_CODE, value.languageCode);
  }
}
