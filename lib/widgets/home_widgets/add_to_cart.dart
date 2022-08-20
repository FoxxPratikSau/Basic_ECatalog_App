import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key, required this.catalog,
  }) : super(key: key);

   

 
  // final _cart= CartModel();
 
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on:[AddMutation, RemoveMutation]);
     final CartModel? _cart=(VxState.store as MyStore).cart;
      // final CatalogModel? _catalog=(VxState.store as MyStore).catalog;
    bool? isInCart=_cart?.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        
        if (!isInCart!){
          // isInCart = isInCart!.toggle();
          // final _catalog =CatalogModel(); //_catalog private
          // _cart?.catalog=_catalog!;
          // _cart?.add(catalog);
          AddMutation(catalog);

          //setState(() {});
        }
        
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          // ignore: deprecated_member_use
          context.theme.buttonColor,
        ),

        shape: MaterialStateProperty.all(
          // ignore: prefer_const_constructors
          StadiumBorder(), 
        )
      ),
      child: (isInCart!=null && isInCart)?const Icon(Icons.done):const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}





//to change all variable name at one use F2