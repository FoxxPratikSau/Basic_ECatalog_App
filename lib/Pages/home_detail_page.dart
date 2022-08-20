// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar( //AppBAR for back button
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container( //to add price and buy button
        color: context.cardColor,
        child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween, //to get max dist between two horizontal thing
                  //buttonPadding: Vx.mOnly(right: 16),
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl4.color(context.accentColor).make(),
                    AddToCart(catalog: catalog).wh(120,50),
                    // ElevatedButton(
                    //   onPressed: () {}, 
                    //   style: ButtonStyle(
                    //     backgroundColor: MaterialStateProperty.all(
                    //       // ignore: deprecated_member_use
                    //       context.theme.buttonColor,
                    //     ),

                    //     shape: MaterialStateProperty.all(
                    //       StadiumBorder(), 
                    //     )
                    //   ),
                    //   child: "Add to Cart".text.make()
                    // ).wh(120,50),
                  ],
                ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()) ,
            child: Image.network(catalog.image)
          ).p16().px32().h32(context),//padding given here to make it look good
          Expanded(
            child: VxArc(// making container arced
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      catalog.name.text.xl4.bold.color(context.accentColor).make(),
                      catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                      10.heightBox,
                      "Gave fast songs upon my then entreating wind of sat. Gently craven soul soul reply sad a one the prophet, sorrow whom my surely raven my fiery. Bust mien truly in thrilled grim wrought. Thee undaunted the with plutonian little sorrowsorrow oer from metell, i both above of tempest me."
                      .text
                      .textStyle(context.captionStyle)
                      .make()
                      .p20(),
                    ]).py64(),
                ),
              ),
            ))
        ]
        ),
      ),//Safe area leaves the top area of phone
    );
  }
}


