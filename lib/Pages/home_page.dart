// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'dart:convert';
//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/CatalogHeader.dart';
import '../widgets/home_widgets/CatalogList.dart';
import 'package:http/http.dart' as http;

//import 'package:flutter_application_1/widgets/item_widget.dart';


class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //final url ="https://api.jsonbin.io/b/6300e8a6a1610e6386073b96";
  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    loadData(); //new method
  }
  loadData() async {
      await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/File/catalog.json");
    // final response =
    //     await http.get(Uri.parse("https://api.jsonbin.io/v3/b/6300e8a6a1610e6386073b96"));
    //     final catalogJson=response.body;
    
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
    


  }

  @override
  Widget build(BuildContext context) {
    final _cart= (VxState.store as MyStore).cart;
    int days =30;
    
    //final dummylist = List.generate(20,(index)=>CatalogModel.items[0]); //CatalogModel is class in catalog.dart under models folder
    return Scaffold(
      backgroundColor: context.cardColor, //theme of will be used for it without vx
      floatingActionButton: Builder(
        
        builder: (context) {
          VxState.watch(context, on:[AddMutation, RemoveMutation]);
          return FloatingActionButton(
            // backgroundColor: MyTheme.DarkBluishCOlor,
            // ignore: deprecated_member_use
            backgroundColor: context.theme.buttonColor, 
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(color: Vx.red500,size:22,count: _cart!.items.length,textStyle: TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold,
          ));
        }
      ),
      body: SafeArea(
        child: Container(
          color: context.canvasColor,
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // to make the text from left
            // ignore: prefer_const_literals_to_create_immutables
            children: [
               CatalogHeader(),
               if(CatalogModel.items!=null && CatalogModel.items!.isNotEmpty)
                CatalogList().py32().expand() //to take full screen
               else 
                  CircularProgressIndicator().centered().expand(),
                 
                
      
            ]
            ),
        ),
      ),
//       appBar: AppBar(
//         // backgroundColor: Colors.white,
//         // elevation: 0.0,
//         //iconTheme: IconThemeData(color: Colors.deepPurple),
        
//         title: Text("Catalog App"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: (CatalogModel.items != null )
//         ? 
// //FOR LIST VIEW

//         // ListView.builder(
//         //   itemCount: CatalogModel.items?.length ,
//         //   itemBuilder: (context,index) => ItemWidget(    //item widget is class made by me in item_widget.dart under wodgets folder
//         //       item: CatalogModel.items![index],
//         //     ),
          
//         // )


// //FOR GRID VIEW
//         GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//             ), 
//           itemBuilder: (context,index){
//             final item= CatalogModel.items![index];
//             return Card(
//               clipBehavior: Clip.antiAlias,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15)),
//               child: GridTile(
//                 header: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.deepPurple,
//                   ),
//                   padding: EdgeInsets.all(12),
//                   child: Text(item.name, style: TextStyle(color: Colors.white),)
//                 ),
//                 child: Image.network(
//                   item.image,
//                   ),
//                 footer: Container(
//                   child: Text(
//                     item.price.toString(),
//                     style: TextStyle(color: Colors.white),
//                     ),
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                     ),
//                 ),
//               )
//             );
//           },
//           itemCount: CatalogModel.items?.length ,
//           )
//         :Center(
//           child:CircularProgressIndicator(),
//         )
//       ),
//      drawer: MyDrawer(),
    );
  }
}