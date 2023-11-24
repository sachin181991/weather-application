import '../dio_response/dio_response.dart';

abstract class ApiConsumer {
  Future<DioBaseResponse> get(
      {Duration? cacheAge,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? params,
      required String url});
}
