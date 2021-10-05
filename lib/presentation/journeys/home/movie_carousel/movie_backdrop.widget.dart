import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size.constants.dart';
import 'package:movies_app/common/screenutil/screenutil.dart';
import 'package:movies_app/data/core/api.constants.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import '../../../../common/extensions/size_extensions.dart';

class MovieBackdropWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Also, this backdrop is in a Stack and should not take full height, so wrap this with
    // FractionallySizedBox with 0.7 as heightFactor and top alignment.
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.7,
      // We also have to give bottom radius, so wrap the Stack with ClipRRect with 40.w as a bottom radius.
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(Sizes.dimen_40.w),),
        // If you noticed, we’re using the Frosty Glassy look on the Backdrop Image.
        // For that, we need a layer on top, so use Stack for that.
        child: Stack(
          children: <Widget>[
            // To allow the Image to take full width and height, let’s use the heightFactor
            // and widthFactor in FractionallySizedBox.
            FractionallySizedBox(
              heightFactor: 1, widthFactor: 1,
              // A simple stateless widget with BlocBuilder giving us the selected movie.
              child: BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
                builder: (context, state) {
                  if (state is MovieBackdropChanged) {
                    // Use CachedNetworkImage with backdropPath and fitHeight.
                    return CachedNetworkImage(
                      imageUrl: '${ApiConstants.TMDB_BASE_IMAGE_URL}${state.movie.backdropPath}',
                      fit: BoxFit.fitHeight,
                    );
                  }
                  // In case, the state is MovieBackdropInitial, we can't show anything in the UI,
                  // so using SizedBox.shrink().
                  return const SizedBox.shrink();
                },
              ),
            ),
            // The top layer will have BackdropFilter.
            BackdropFilter(
              // Apply a filter with 5.0 as sigmaX and sigmaY. Give the full width to the container to cover
              // the full screen with height as minimum 1 and color as transparent. If you give height as 0,
              // the backdrop will not work. If you give any color other than, there will be a strip of that
              // color on top.
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(width: ScreenUtil.screenWidth, height: 1, color: Colors.transparent,),
            ),
          ],
        ),
      ),
    );
  }
}