import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size.constants.dart';
import 'package:movies_app/data/core/api.constants.dart';

import '../../../../common/extensions/size_extensions.dart';

class MovieCardWidget extends StatelessWidget {
  // We’ll need movieId in the future, when we tap on this card to move to the movie detail screen.
  final int movieId;
  // The posterPath is required to load the image. This will be taken from MovieEntity and will be
  // in this format kqjL17yufvn9OVLyXYpvtyrFfak.jpg.
  final String posterPath;

  const MovieCardWidget({
    Key? key,
    required this.movieId,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Material to give elevation to the card.
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
      // Use GestureDetector to enable tappable events on the card.
      child: GestureDetector(
        onTap: () {},
        // Use ClipRRect to clip the image, with a borderRadius. This will add the curves
        // on all the vertices of the images.
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
          // Use CachedNetworkImage with the imageUrl prepended with CachedNetworkImage.
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.TMDB_BASE_IMAGE_URL}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}