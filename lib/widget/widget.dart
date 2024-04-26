import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/pages/full_screen.dart';

import '../models/photo_model.dart';

Widget wallpaper(List<PhotosModel> listPhotos, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      padding: EdgeInsets.all(4),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: listPhotos.map((PhotosModel photosModel) {
        return GridTile(
            child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FullScreen(imagepath: photosModel.src!.portrait!)));
          },
          child: Hero(
            tag: photosModel.src!.portrait!,
            child: Container(
              child: CachedNetworkImage(
                imageUrl: photosModel.src!.portrait!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
      }).toList(),
    ),
  );
}
