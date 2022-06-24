import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:ecomappv2/domain/domain_shelf.dart';
import 'package:flutter/services.dart';

Future<DeviceInfo> getDeviceDetails() async {
  String name = "Unknown";
  String identifier = "Unknown";
  String version = "Unknown";
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      //Android Bilgileri
      var build = await deviceInfoPlugin.androidInfo;
      name = "${build.brand} ${build.model}";
      identifier = build.androidId;
      version = build.version.codename;
    } else if (Platform.isIOS) {
      //Ios Bilgileri
      var build = await deviceInfoPlugin.iosInfo;
      name = "${build.name} ${build.model}";
      identifier = build.identifierForVendor;
      version = build.systemVersion;
    }
  } on PlatformException {
    //Varsayılan bilgi
    return DeviceInfo(
      name: name,
      version: version,
      identifier: identifier,
    );
  }
  return DeviceInfo(
    name: name,
    version: version,
    identifier: identifier,
  );
}
