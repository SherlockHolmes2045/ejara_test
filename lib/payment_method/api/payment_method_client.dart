import 'package:dio/dio.dart';
import 'package:ejara/network/dio.dart';
import '../models/payment_method.dart';

/// Thrown if an exception occurs while making an `http` request.
class HttpException implements Exception {}

/// {@template http_request_failure}
/// Thrown if an `http` request returns a non-200 status code.
/// {@endtemplate}
class HttpRequestFailure implements Exception {
  /// {@macro http_request_failure}
  const HttpRequestFailure(this.statusCode);

  /// The status code of the response.
  final int statusCode;
}

/// Thrown when an error occurs while decoding the response body.
class JsonDecodeException implements Exception {}

/// Thrown when an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {}

class PaymentMethodClient {
  Future<List<PaymentMethod>> fetchAllPaymentMethods() async {
    final responseBody = await _get("/marketplace/payment-types-per-country?countryCode=CM&transactionType=buy");
    try {
      return responseBody
          .map((dynamic item) => PaymentMethod.fromJson(item))
          .toList();
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  Future<List<dynamic>> _get(String url) async {
    Response response;

    try {
      response = await http.get(url,options: defaultOptions);
    } catch (_) {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode!);
    }

    try {
      return response.data["data"];
    } catch (_) {
      throw JsonDecodeException();
    }
  }
}
