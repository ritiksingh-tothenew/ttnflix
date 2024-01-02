import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttnflix/home/bloc/state/home_state.dart';

import '../../repository/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeLoading());

  Future<void> loadMoviesData() async {
    try {
      final dataList = await _homeRepository.getMoviesData();
      emit(HomeLoaded(dataList));
    } catch (e) {
      emit(HomeError('Failed to load data: $e'));
    }
  }
}
