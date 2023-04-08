import 'package:dio/dio.dart';
import 'package:ejara/network/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../env/env.dart';
import '../helper/shared_preference_helper.dart';

class TokenInterceptor extends QueuedInterceptor {
  String? accessToken;

  Future<SharedPreferences> instance = SharedPreferences.getInstance();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (accessToken == null) {
      accessToken = await SharedPreferenceHelper(instance).authToken;

      if (accessToken == null) {
        return handler.next(options);
      }
    }

    if (options.path != "/auth/login") {
      options.headers["Authorization"] = "Bearer $accessToken";
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.badResponse &&
            err.response?.statusCode == 403 ||
        err.response?.statusCode == 401) {
      var options = err.response?.requestOptions;

      // If the token has been updated, repeat directly.
      if (options?.headers['Authorization'] != null &&
          !options!.headers['Authorization']
              .toString()
              .contains(accessToken!)) {
        options.headers["Authorization"] = "Bearer ${accessToken!}";
        //repeat
        Dio().fetch(options).then(
          (r) => handler.resolve(r),
          onError: (e) {
            handler.reject(e);
          },
        );
        return;
      }

      Dio refreshDio = Dio(BaseOptions(baseUrl: Env.loginUrl));
      Map<String, dynamic> data = {
        "log": Env.username,
        "password": Env.password
      };

      // Add the Api method to get the token on the server
      refreshDio
          .post("/auth/login", data: data, options: defaultOptions)
          .then((value) async {
        // need to modify this
        accessToken = value.data["token"];
        await SharedPreferenceHelper(instance).saveAuthToken(accessToken!);
        options?.headers["Authorization"] = "Bearer ${accessToken!}";

        //repeat
        Dio().fetch(options!).then(
          (r) => handler.resolve(r),
          onError: (e) {
            handler.reject(e);
          },
        );
      }).onError((error, stackTrace) {
        print(error.runtimeType);
        handler.next(error as DioError);
      });

      return;
    }

    return handler.next(err);
  }
}
