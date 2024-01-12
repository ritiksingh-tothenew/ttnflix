import 'package:flutter/material.dart';

import '../../themes/ttnflix_sizes.dart';
import '../model/movie_list.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({
    super.key,
    required this.context,
    required this.movie,
    required this.bannerWidget,
    required this.isGridView,
  });

  final BuildContext context;
  final Movie movie;
  final Widget bannerWidget;
  final bool isGridView;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            bannerWidget,
            Positioned.fill(
              child: InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(TtnFlixSize.size16),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.star_border,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.black.withOpacity(0.15)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: TtnFlixSize.size16, right: TtnFlixSize.size16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        movie.getContentRating(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(movie.originalLanguage?.toUpperCase() ?? '',
                          style: const TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: isGridView ? TtnFlixSize.size2 : TtnFlixSize.size16,
        ),
        Text(movie.title ?? '')
      ],
    );
  }
}
