import 'package:ecomappv2/data/network/failure.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  recieveTimeout,
  sendTimeout,
  cacheError,
  niInternetConnection,
}

class ResponseCode {
  //Api durumları
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unauthorised = 401;
  static const int notFound = 404;
  static const int internalServerError = 500;
  //Yerel kodlar
  static const int unknown = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int recieveTimeout = -5;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int niInternetConnection = -7;
}

class ResponseMessage {
  //Api durumları
  static const String success = "success";
  static const String noContent = "noContent";
  static const String badRequest = "badRequest";
  static const String forbidden = "forbidden";
  static const String unauthorised = "unauthorised";
  static const String notFound = "notFound";
  static const String internalServerError = "internalServerError";
  //Yerel kodlar
  static const String unknown = "Something went wrong, try again later";
  static const String connectTimeout = "time out error, try again later";
  static const String cancel = "request was canceled, try again later";
  static const String recieveTimeout = "time out error, try again later";
  static const String sendTimeout = "time out error, try again later";
  static const String cacheError = "Cache out error, try again later";
  static const String niInternetConnection = "Check your internet connection";
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(
            code: ResponseCode.success, message: ResponseMessage.success);
      case DataSource.noContent:
        return Failure(
            code: ResponseCode.noContent, message: ResponseMessage.noContent);
      case DataSource.badRequest:
        return Failure(
            code: ResponseCode.badRequest, message: ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(
            code: ResponseCode.forbidden, message: ResponseMessage.forbidden);
      case DataSource.unauthorised:
        return Failure(
            code: ResponseCode.unauthorised,
            message: ResponseMessage.unauthorised);
      case DataSource.notFound:
        return Failure(
            code: ResponseCode.notFound, message: ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(
            code: ResponseCode.internalServerError,
            message: ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return Failure(
            code: ResponseCode.connectTimeout,
            message: ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return Failure(
            code: ResponseCode.cancel, message: ResponseMessage.cancel);
      case DataSource.recieveTimeout:
        return Failure(
            code: ResponseCode.recieveTimeout,
            message: ResponseMessage.recieveTimeout);
      case DataSource.sendTimeout:
        return Failure(
            code: ResponseCode.sendTimeout,
            message: ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(
            code: ResponseCode.cacheError, message: ResponseMessage.cacheError);
      case DataSource.niInternetConnection:
        return Failure(
            code: ResponseCode.niInternetConnection,
            message: ResponseMessage.niInternetConnection);
    }
  }
}
