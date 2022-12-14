import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start, // to make the text from left
            // ignore: prefer_const_literals_to_create_immutables
            children: [
               // ignore: deprecated_member_use
               "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
               "Trending products".text.xl2.make(),
      
            ]
    );
  }
}