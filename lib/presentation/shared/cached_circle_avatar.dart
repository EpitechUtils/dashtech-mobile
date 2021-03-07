import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashtech/infrastructure/core/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CachedCircleAvatar extends StatelessWidget {
  final Widget noPicture;
  final double radius;
  final String imagePath;

  final StorageService storageService = Get.find();

  CachedCircleAvatar(
      {Key key,
      @required this.noPicture,
      @required this.radius,
      @required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: radius,
        maxHeight: radius,
        minWidth: radius,
        maxWidth: radius,
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          errorWidget: (BuildContext context, String url, Object error) {
            return this.noPicture;
          },
          progressIndicatorBuilder: (_, __, ___) => Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[200],
            child: Container(
              width: radius,
              height: radius,
              color: Colors.white,
            ),
          ),
          httpHeaders: {
            'Authorization': 'Bearer ${storageService.box.read('token')}'
          },
          fit: BoxFit.cover,
          imageUrl: this.imagePath,
          width: radius,
          height: radius,
        ),
      ),
    );
  }
}
