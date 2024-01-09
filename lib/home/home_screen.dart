import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttnflix/generated/flutter_gen/assets.gen.dart';
import 'package:ttnflix/home/bloc/cubit/home_cubit.dart';
import 'package:ttnflix/home/bloc/state/home_state.dart';
import 'package:ttnflix/home/repository/home_repository.dart';
import 'package:ttnflix/home/widgets/movie_item_widget.dart';
import 'package:ttnflix/network/api_url.dart';
import 'package:ttnflix/themes/ttnflix_sizes.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) =>
          HomeCubit(HomeRepository())..loadFirstTwoPageOfMovie(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          return state is HomeLoaded
              ? SingleChildScrollView(
                  controller: initScrollListener(context),
                  padding: const EdgeInsets.only(bottom: TtnFlixSize.size16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: TtnFlixSize.size320,
                        child: Stack(children: [
                          PageView.builder(
                              controller:
                                  context.read<HomeCubit>().pageController,
                              onPageChanged: (int page) {
                                BlocProvider.of<HomeCubit>(context)
                                    .updateDotIndicator(page);
                              },
                              itemCount: state.carouselList?.length,
                              itemBuilder: (context, index) {
                                return MovieItemWidget(
                                    context: context,
                                    movie: state.carouselList![index],
                                    bannerWidget: SizedBox(
                                        height: TtnFlixSize.size280,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.network(
                                          "${ApiUrl.IMAGE_BASE_URL}${state.carouselList![index].backdropPath ?? ''}",
                                          fit: BoxFit.cover,
                                        )),
                                    isGridView: false);
                              }),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: TtnFlixSize.size120,
                              margin: const EdgeInsets.only(
                                  bottom: TtnFlixSize.size20),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.all(TtnFlixSize.size5),
                                    child: SizedBox(
                                        height: TtnFlixSize.size10,
                                        child:
                                            state.carouselCurrentPage == index
                                                ? const Icon(
                                                    Icons.circle,
                                                    size: TtnFlixSize.size8,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    Icons.circle_outlined,
                                                    size: TtnFlixSize.size8,
                                                    color: Colors.white,
                                                  )),
                                  );
                                },
                                itemCount: state.carouselList?.length,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.3, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return MovieItemWidget(
                              context: context,
                              movie: state.gridList![index],
                              bannerWidget: Image.network(
                                  "${ApiUrl.IMAGE_BASE_URL}${state.gridList?[index].backdropPath ?? ''}"),
                              isGridView: true);
                        },
                        itemCount: state.gridList?.length,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: TtnFlixSize.size16),
                        child: state.isReachedEnd
                            ? const CircularProgressIndicator()
                            : Container(),
                      )
                    ],
                  ),
                )
              : state is HomeLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state is HomeError
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(Assets.icons.icError.path),
                              const SizedBox(
                                height: TtnFlixSize.size16,
                              ),
                              Text(state.errorMessage)
                            ],
                          ),
                        )
                      : Container();
        }),
      ),
    );
  }

  ScrollController initScrollListener(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        BlocProvider.of<HomeCubit>(context).loadMore();
      }
    });

    return _scrollController;
  }
}
