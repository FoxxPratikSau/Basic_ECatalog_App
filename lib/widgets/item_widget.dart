// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';


class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({ Key? key, required this.item }) :assert(item != null),super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card( //to give card view and gives a elevation shadow
      //elevation: 0.0, //to remove elevation
      //shape: StadiumBorder(), //to give shapes
      child: ListTile(
        onTap: (){
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price.toString()}",
          textScaleFactor: 1.5, //size
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          ),
      ),
    );
  }
}