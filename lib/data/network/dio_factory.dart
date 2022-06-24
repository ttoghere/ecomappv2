import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:ecomappv2/app/app_prefs.dart';
import 'package:ecomappv2/app/app_shelf.dart';

const String Application_Json = "application/json";
const String Content_Type = "content-type";
const String Accept = "accept";
const String Authorization = "authorization";
const String Default_Language = "language";

class DioFactory {
  AppPreferences appPreferences;
  DioFactory({
    required this.appPreferences,
  });

  Future<Dio> getDio() async {
    Dio dio = Dio();
    int timeOut = 60 * 1000;
    String language = await appPreferences.getAppLanguage();
    Map<String, String> headers = {
      Content_Type: Application_Json,
      Accept: Application_Json,
      Authorization: Constants.token,
      Default_Language: language,
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      headers: headers,
    );

    if (kReleaseMode) {
      print("Yayın modu girişi");
    } else {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
