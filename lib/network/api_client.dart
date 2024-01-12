import 'package:dio/dio.dart';
import 'package:ttnflix/di/service_locator.dart';
import 'package:ttnflix/model/base_response.dart';
import 'package:ttnflix/network/api_interface.dart';
import 'package:ttnflix/network/api_service.dart';
import 'package:ttnflix/network/ttnflix_exceptions.dart';

class ApiClient implements ApiInterface {
  final ApiService _apiService = TTNFlixSL.get<ApiService>();

  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _apiService.cancelRequests(cancelToken: cancelToken);
  }

  @override
  Future<T> getDataFromApi<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    required T Function(JSON responseBody) converter,
  }) async {
    Object? body;
    try {
      // Entire map of response
      final data = await _apiService.getRequest<JSON>(
        endpoint,
        queryParams,
        cancelToken,
      );

      body = data.body;
      if (body == null) throw TTNFlixException(message: data.message ?? "");
    } on Exception catch (ex) {
      throw TTNFlixException.fromDioException(ex);
    }
    return mapObjectIntoModel(converter, body);
  }

  mapObjectIntoModel(Function(JSON responseBody) converter, Object body) {
    try {
      return converter(body as JSON);
    } on Exception catch (ex) {
      throw TTNFlixException.fromParsingException(ex);
    }
  }

  @override
  Future<T> postDataFromApi<T>(
      {required String endpoint,
      required QueryParams? queryParam,
      CancelToken? cancelToken,
      Object? body,
      required T Function(JSON responseBody) converter}) async {
    Object? response;
    try {
      // Entire map of response
      final data = await _apiService.postRequest<BaseResponse?>(
          endpoint, queryParam, body, cancelToken);

      // Items of table as json
      response = data.body;
    } on Exception catch (ex) {
      throw TTNFlixException.fromDioException(ex);
    }
    return mapObjectIntoModel(converter, response!);
  }
}
