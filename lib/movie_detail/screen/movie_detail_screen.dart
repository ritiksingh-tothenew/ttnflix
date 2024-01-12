import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ttnflix/themes/ttnflix_colors.dart';
import 'package:ttnflix/themes/ttnflix_sizes.dart';

import '../../home/model/movie_list.dart';
import '../../network/api_url.dart';

@RoutePage()
class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(appLocalizations.detail),
            const Icon(
              Icons.star_border,
              color: Colors.white,
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "${ApiUrl.IMAGE_BASE_URL}${movie.posterPath ?? ''}"),
              fit: BoxFit.fill),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: TtnFlixSize.size10, sigmaY: TtnFlixSize.size10),
          // Adjust sigmaX and sigmaY for the blur effect
          child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                      "${ApiUrl.IMAGE_BASE_URL}${movie.posterPath ?? ''}"),
                  const SizedBox(
                    height: TtnFlixSize.size16,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.black.withOpacity(0.75),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(TtnFlixSize.size8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontSize: TtnFlixSize.size24),
                              ),
                              const SizedBox(
                                height: TtnFlixSize.size16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.aspect_ratio,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: TtnFlixSize.size5,
                                      ),
                                      Text(movie.getContentRating()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.perm_media_outlined,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: TtnFlixSize.size5,
                                      ),
                                      Text(
                                          movie.mediaType?.toUpperCase() ?? ''),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.language,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: TtnFlixSize.size5,
                                      ),
                                      Text(movie.originalLanguage
                                              ?.toUpperCase() ??
                                          ''),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: TtnFlixSize.size8,
                              ),
                              Text(appLocalizations.overview,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: TTnFlixColors.whiteGlow)),
                              Text(movie.overview ?? ''),
                              const SizedBox(
                                height: TtnFlixSize.size8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: TtnFlixSize.size5,
                                      ),
                                      Text(movie.releaseDate ?? '')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.thumb_up,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: TtnFlixSize.size5,
                                      ),
                                      Text(movie.voteAverage.toString())
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
