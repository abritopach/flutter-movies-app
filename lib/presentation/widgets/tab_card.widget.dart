import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size.constants.dart';
import 'package:movies_app/data/core/api.constants.dart';

import '../../common/extensions/size_extensions.dart';

class TabCardWidget extends StatelessWidget {
  // We need movieId in the future for loading movie details.
  final int movieId;
  // posterPath to load the image and title for showing the name of the movie below image.
  final String title, posterPath;

  const TabCardWidget({
    Key? key,
    required this.movieId,
    required this.title,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap this whole widget in GestureDetector to handle tap. On tap of this, we will land on Movie
    // Detail Screen.
    return GestureDetector(
      onTap: () {},
      // To layout in image and title, use Column with horizontal center alignment. So that both image
      // and title are in the center horizontally.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // The image will take the most of the available space, so use Expanded.
          Expanded(
            // Use ClipRRect for clipping with a border to the image.
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
              // Use CachedNetworkImage to load the poster image.
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.TMDB_BASE_IMAGE_URL}$posterPath',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // To give some space in between the image and title, add a Padding widget.
          Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_4.h),
            // Text widget to show the title of the movie.
            child: Text(
              title,
              // We want to have a single line of the title, with text aligned as a center and bodyText2
              // text style.
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}