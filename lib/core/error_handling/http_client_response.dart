import 'package:http/http.dart' as http;

/// A class that provides utility methods for handling HTTP client responses.

final class HttpClientResponse {
  /// Validates the given HTTP response.
  /// 
  /// Throws a [ClientException] if the response status code is not in the range 200-299.
  /// 
  /// Takes a [Response] as input and validates the response status code is not in the range 200-299
  static void validate(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw http.ClientException(
        'Status code: ${response.statusCode}',
        response.request?.url,
      );
    }
  }
}
