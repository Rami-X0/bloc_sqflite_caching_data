import 'package:bloc_sqflite_caching_data/core/helper/extension.dart';
import 'package:bloc_sqflite_caching_data/core/widgets/app_shimmer_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? circular;
  final double? widthErrorIcon;
  final double? heightErrorIcon;
  final double? widthImage;
  final double? heightImage;
  final BoxFit? fitImage;

  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.circular,
    this.widthErrorIcon,
    this.heightErrorIcon,
    this.widthImage,
    this.heightImage,
    this.fitImage,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(circular ?? 14),
      child: CachedNetworkImage(
        width: widthImage,
        height: heightImage,
        imageUrl: imageUrl.toString(),
        placeholder: (context, url) =>  loadingImage(),
        errorWidget: (context, error, url) => errorDownloadImage(context),
        fit: fitImage,
      ),
    );
  }

  Widget errorDownloadImage(BuildContext context) {
    return SizedBox(
      height: heightErrorIcon ?? context.h*255,
      child: const Center(
        child: FaIcon(
          FontAwesomeIcons.circleExclamation,
          color: Colors.black12,
          size: 50,
        ),
      ),
    );
  }

Widget loadingImage() {
    return AppShimmerLoading(child: Container(
      color: Colors.grey,
      width: 100,
      height: 100,
    ));
  }
}
