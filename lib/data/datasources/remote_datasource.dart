import 'package:injectable/injectable.dart';

import '../../core/api/api.dart';
import '../../core/api_response/api_response.dart';
import '../../core/constants/constants.dart';
import '../../core/dio_response/dio_base_response.dart';
import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract class RemoteDataSource {
  //WEATHER
  Future<ApiResponse<List<LocationEntity>>> location(String? params);

  Future<ApiResponse<ForecastEntity>> forecastById(
      Map<String, dynamic>? params);
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiConsumer apiConsumer;

  RemoteDataSourceImpl({required this.apiConsumer});

  final EndPointConstant endPointConstant = EndPointConstant();

  @override
  Future<ApiResponse<List<LocationEntity>>> location(String? params) async {
    final response = await _getLocation(params: params);
    if (response.statusCode == StatusCodeConstant.statusCodeOk200) {
      return ApiResponse(
          data: response.data
              .map<LocationEntity>(
                  (data) => LocationModels.fromJson(data).toDomain())
              .toList());
    } else {
      throw ErrorException(message: response.message);
    }
  }

  @override
  Future<ApiResponse<ForecastEntity>> forecastById(
      Map<String, dynamic>? params) async {
    final response = await _getForecastById(params: params);
    if (response.statusCode == StatusCodeConstant.statusCodeOk200) {
      return ApiResponse(
          data: ForecastModels.fromJson(response.data).toDomain());
    } else {
      throw ErrorException(message: response.message);
    }
  }

  Future<DioBaseResponse> _getLocation({required String? params}) async =>
      apiConsumer
          .get(url: endPointConstant.location, params: {'q': params}).then(
              (value) => DioBaseResponse(
                  statusCode: value.statusCode,
                  message: value.message,
                  data: value.data));

  Future<DioBaseResponse> _getForecastById(
          {required Map<String, dynamic>? params}) async =>
      apiConsumer.get(url: endPointConstant.forCastIdHistory, params: {
        'q': 'id:1104989',
        'days': 5,
        'aqi': 'no',
        'alerts': 'no'
      }).then((value) => DioBaseResponse(
          statusCode: value.statusCode,
          message: value.message,
          data: value.data));
}
