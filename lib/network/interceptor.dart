import 'package:dio/dio.dart';
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

    if (options.path != "/auth/refresh-tokens") {
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

      if (options?.data is FormData) {
        FormData formData = FormData();
        formData.fields.addAll(options?.data.fields);
        for (MapEntry mapFile in options?.data.files) {
          /*  formData.files.add(MapEntry(mapFile.key,
              MultipartFileExtended.fromFileSync(mapFile.value.filePath)));*/
        }
        options?.data = formData;
      }
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

      Dio refreshDio = Dio(BaseOptions(baseUrl: Env.apiUrl));
      var refreshToken = await SharedPreferenceHelper(instance).authToken;
      Map<String, dynamic> data = {
        "refreshToken": refreshToken,
      };

      // Add the Api method to get the token on the server
      refreshDio.post("/auth/refresh-tokens", data: data).then((value) async {
        // need to modify this
        accessToken = value.data["access"]["token"];
        await SharedPreferenceHelper(instance).saveAuthToken(accessToken!);
        await SharedPreferenceHelper(instance)
            .saveAuthToken(value.data["refresh"]["token"]);
        options?.headers["Authorization"] = "Bearer ${accessToken!}";

        //repeat
        Dio().fetch(options!).then(
          (r) => handler.resolve(r),
          onError: (e) {
            handler.reject(e);
          },
        );
      }).onError((error, stackTrace) {
        handler.next(error as DioError);
      });

      return;
    }

    return handler.next(err);
  }
}
