import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:ejara/env/env.dart';

import 'interceptor.dart';

Options defaultOptions = Options(
  responseType: ResponseType.json,
  contentType: 'application/json',
  headers: {
    'api-key': Env.apiKey,
    'client-id': Env.clientId,
    'app-version': Env.appVersion,
    'app-platform': Env.appPlatform,
    'client': Env.clientId,
    'Accept-language': 'en',
    "Accept": 'application/json',
    "Content-Type": 'application/json',
  },
);

Dio http = Dio(
  BaseOptions(
    baseUrl: Env.apiUrl,
    responseType: ResponseType.json,
    contentType: 'application/json',
  ),
)..interceptors.addAll(
    [
      TokenInterceptor(),
      DioCacheInterceptor(
          options: CacheOptions(
        // A default store is required for interceptor.
        store: MemCacheStore(),

        // All subsequent fields are optional.

        // Default.
        policy: CachePolicy.request,
        // Overrides any HTTP directive to delete entry past this duration.
        // Useful only when origin server has no cache config or custom behaviour is desired.
        // Defaults to [null].
        maxStale: const Duration(days: 7),
        // Default. Allows 3 cache sets and ease cleanup.
        priority: CachePriority.normal,
        // Default. Body and headers encryption with your own algorithm.
        cipher: null,
        // Default. Key builder to retrieve requests.
        keyBuilder: CacheOptions.defaultCacheKeyBuilder,
        // Default. Allows to cache POST requests.
        // Overriding [keyBuilder] is strongly recommended when [true].
        allowPostMethod: false,
      ))
    ],
  );
