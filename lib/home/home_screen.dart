import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttnflix/home/bloc/cubit/home_cubit.dart';
import 'package:ttnflix/home/bloc/state/home_state.dart';
import 'package:ttnflix/home/repository/home_repository.dart';
import 'package:ttnflix/network/api_url.dart';
import 'package:ttnflix/themes/ttnflix_sizes.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(HomeRepository())..loadMoviesData(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          return state is HomeLoaded
              ? SingleChildScrollView(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(bottom: TtnFlixSize.size16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 320,
                        child: PageView.builder(
                            itemCount: state.movieData.movieList?.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      SizedBox(
                                          height: 280,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image.network(
                                            ApiUrl.IMAGE_BASE_URL +
                                                    state
                                                        .movieData
                                                        .movieList![index]
                                                        .backdropPath! ??
                                                "",
                                            fit: BoxFit.cover,
                                          )),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              //   gradient: LinearGradient(begin:Alignment.bottomLeft,end:Alignment.topRight,colors: [Colors.black,Colors.white])
                                              color: Colors.black
                                                  .withOpacity(0.15)),
                                          height: TtnFlixSize.size50,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: TtnFlixSize.size16,
                                                right: TtnFlixSize.size16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  state.movieData
                                                          .movieList?[index]
                                                          .getContentRating() ??
                                                      '',
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                    state
                                                            .movieData
                                                            .movieList?[index]
                                                            .originalLanguage
                                                            ?.toUpperCase() ??
                                                        '',
                                                    style: const TextStyle(
                                                        color: Colors.white))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: TtnFlixSize.size16,
                                  ),
                                  Text(
                                      state.movieData.movieList?[index].title ??
                                          '')
                                ],
                              );
                            }),
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.3, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Image.network(ApiUrl.IMAGE_BASE_URL +
                                          state.movieData.movieList![index]
                                              .backdropPath! ??
                                      ''),
                                  Container(
                                    decoration: BoxDecoration(
                                        //   gradient: LinearGradient(begin:Alignment.bottomLeft,end:Alignment.topRight,colors: [Colors.black,Colors.white])
                                        color: Colors.black.withOpacity(0.15)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: TtnFlixSize.size10,
                                          right: TtnFlixSize.size10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            state.movieData.movieList?[index]
                                                    .getContentRating() ??
                                                '',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          Text(
                                              state.movieData.movieList?[index]
                                                      .originalLanguage
                                                      ?.toUpperCase() ??
                                                  '',
                                              style: const TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                  state.movieData.movieList?[index].title ?? '')
                            ],
                          );
                        },
                        itemCount: state.movieData.movieList?.length,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: TtnFlixSize.size16),
                        child: CircularProgressIndicator(),
                      )
                    ],
                  ),
                )
              : Container();
        }),
      ),
    );
  }
}
