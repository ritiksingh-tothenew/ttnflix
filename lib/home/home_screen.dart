import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttnflix/home/bloc/cubit/home_cubit.dart';
import 'package:ttnflix/home/bloc/state/home_state.dart';
import 'package:ttnflix/home/repository/home_repository.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(HomeRepository())..loadMoviesData(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          return state is HomeLoaded
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(state.movieData.movieList?[index].title ?? "");
                  },
                  itemCount: state.movieData.movieList?.length,
                )
              : Container();
        }),
      ),
    );
  }
}
