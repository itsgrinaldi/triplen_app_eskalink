import 'package:dio/dio.dart';

class HttpClient {
  Dio dio = Dio();

  HttpClient() {
    setDioClient();
  }

  void setDioClient() {
    dio = Dio(BaseOptions(
      baseUrl: "https://multazamgsd.com/api-triplen/v1",
      responseType: ResponseType.json,
      validateStatus: (statusCode) {
        if (statusCode == null) {
          return false;
        }
        if (statusCode == 422) {
          // your http status code
          return true;
        } else {
          return statusCode >= 200 && statusCode < 300;
        }
      },
    ));

    dio.options.headers["Content-Type"] = "application/json";

    dio.interceptors
        .add(InterceptorsWrapper(onError: (DioError e, handler) async {
      //Map<String, dynamic> data = e.response.data;
      if (e.response?.statusCode != null) {
        if (e.response?.statusCode == 400) {}
        // INFO : Kicking out user to login page when !authenticated
        if (e.response?.statusCode == 401) {
          //String message = data['message'];
        }
      }
      return handler.next(e);
    }));
  }
}
