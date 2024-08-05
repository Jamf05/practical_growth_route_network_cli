import 'package:http/http.dart' as http;

final class HttpClientResponse {
  static void validate(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw http.ClientException(
        'Status code: ${response.statusCode}',
        response.request?.url,
      );
    }
  }
}
