import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) :super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Image.network(
            //catalog.image
            image,
          ).box.p8.rounded.color(context.canvasColor).make().p8().w32(context);
          //w is width, p is padding
  }
}