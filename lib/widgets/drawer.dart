// ignore_for_file: prefer_const_constructors
//ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageurl = "https://pbs.twimg.com/profile_images/1399251518746808320/LimSocNm_400x400.jpg";
    return Drawer(
       child: Container(
         color:Colors.deepPurple,
         child: ListView(
           padding: EdgeInsets.zero,
           children: [
             DrawerHeader(
               
               padding: EdgeInsets.zero,
               child: UserAccountsDrawerHeader(
                 margin: EdgeInsets.zero,
                 decoration: BoxDecoration(
                   //color: Color(0xff4C3575),
                   color:Colors.deepPurple,
                 ),
                 accountName: Text("Pratik", style: TextStyle(color: Colors.white)), 
                 accountEmail: Text("pratik.sau09@gmail.com", style: TextStyle(color: Colors.white)),
                 //currentAccountPicture: Image.network(imageurl),
                 currentAccountPicture: CircleAvatar(
                   backgroundImage: NetworkImage(imageurl),
                 ),
                 )
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text("Home",

                 style: TextStyle(
                   color: Colors.white,
                  ),
                  textScaleFactor: 1.5,
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text("Profile",

                 style: TextStyle(
                   color: Colors.white,
                  ),
                  textScaleFactor: 1.5,
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                ),
                title: Text("Email me",

                 style: TextStyle(
                   color: Colors.white,
                  ),
                  textScaleFactor: 1.5,
                ),
              ),
           ],
         ),
       ) ,
    );
  }
}