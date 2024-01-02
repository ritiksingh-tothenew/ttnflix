import 'package:ttnflix/di/service_locator.dart';
import 'package:ttnflix/home/model/movie_list.dart';
import 'package:ttnflix/network/api_client.dart';
import 'package:ttnflix/network/api_url.dart';

class HomeRepository {
  late ApiClient _apiService;

  HomeRepository() {
    _apiService = TTNFlixSL.get<ApiClient>();
  }

  Future<MovieListModel> getMoviesData() async {
    final response = await _apiService.getDataFromApi(
        endpoint: ApiUrl.GET_MOVIES, converter: MovieListModel.fromJson);
    return response;
  }
}
