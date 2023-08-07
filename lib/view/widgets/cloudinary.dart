import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading/LoadingWidget.dart';


class Cloudinary extends StatelessWidget {
  final String image;
  final bool cache;
  final heightImage;

  const Cloudinary({ this.heightImage, required this.image,  this.cache = true});

  String imageWidth(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var dpr = MediaQuery.of(context).devicePixelRatio;

// Get a rounded up image width by a multiple of 100.
// Why? Initial loading time of a new transformation in Cloudinary is slow. If we get image sizes that look like this:
// 1100, 1300 instead of 1121, 1322 we have a better chance of caching and improving experience of first time users
    var physicalScreenWidth = screenWidth * (dpr * .7);

// Some kind of absolute max image size
    if (physicalScreenWidth > 3000) physicalScreenWidth = 3000;

    int rounded = ((physicalScreenWidth / 100).round() * 100).ceil();
    return rounded.round().toString();
  }

  @override
  Widget build(BuildContext context) {
    var src;
    if (image == null) return SizedBox();

    var width = imageWidth(context);

    if (image.contains("https")) {
      src = image;
    } else {
      src =
      'https://res.cloudinary.com/swiftr/image/upload/q_auto,f_auto,w_$width,fl_progressive/$image';
    }

    if (cache) {
      return CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) =>
            LoadingWidget(),
        errorWidget: (context, url, error) =>
            Center(child: new Icon(Icons.error)),
        fit: BoxFit.cover,
        fadeInDuration: Duration.zero,
        fadeInCurve: Curves.linear,
        fadeOutCurve: Curves.linear,
        fadeOutDuration: Duration.zero,

        height: heightImage??400,
        // TEMP-code due to this issue: https://github.com/renefloor/flutter_cached_network_image/issues/134
        width: double
            .infinity, // TEMP-code due to this issue: https://github.com/renefloor/flutter_cached_network_image/issues/134
      );
    } else {
      return FadeInImage.assetNetwork(
        image: src,
        fadeInCurve: Curves.linear,
        fadeInDuration: Duration(milliseconds: 20),
        // fadeOutCurve: Curves.linear,  // Duration.zero stopped working in Flutter 1.7  -  crashes..
        // fadeOutDuration: Duration.zero,
        fit: BoxFit.cover,
        placeholder: "assets/images/placeholder.jpg",
        width: double.infinity,
      );
    }
  }
}