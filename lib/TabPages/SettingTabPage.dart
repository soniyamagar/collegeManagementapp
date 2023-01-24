import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hamroinfofyp/TabPages/services/settingTabPageApi.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/settingTabPageModel.dart';

class SettingTabPage extends StatefulWidget {
  const SettingTabPage({Key ?key}) : super(key: key);

  @override
  State<SettingTabPage> createState() =>
      _SettingTabPageState();
}

class _SettingTabPageState extends State<SettingTabPage> {

  ListingServices listingservices = ListingServices();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff87cefa),
        title: Padding(
          padding: EdgeInsets.only(left:100),
          child: Text("Setting", style: TextStyle(color: Colors.black)),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
              children: [

                SizedBox(height: 50),
                Container(

                  child: Container(
                    height: 140,
                    width: 395,
                    decoration: BoxDecoration(
                      color: Color(0xff87cefa),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(150.0),
                        topRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),

                      ),
                    ),

                    padding: const EdgeInsets.only(left: 200, top: 50),
                    child: Text(" HamroInfo",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white),
                    ),


                  ),

                ),



                SizedBox(height: 50),
                Container(
                    height:300,
                    width: 380,
                    decoration: BoxDecoration(
                      color: const Color(0xffe7feff),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(2, 2),
                            spreadRadius: 1,
                            blurRadius: 10),
                      ],
                    ),

                    child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top:20),
                            child: Row(children: [
                              Icon(Icons.person,color: Colors.black),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top:10),
                                child: Text("Username", style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black),
                                ),
                              )
                            ]),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top:10),
                            child: Row(children: [
                              Icon(Icons.help_center,color: Colors.black),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top:10),
                                child: Text("Help", style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black),
                                ),
                              ),
                            ]),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 10, top:10),
                              child: Row(children: [
                                Icon(Icons.home,color: Colors.black),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top:10),
                                  child: Text("Home", style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black),
                                  ),
                                ),
                              ])
                          ),
                          Divider(
                            color: Colors.black,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10, top:10),
                            child: Row(children: [
                              Icon(Icons.logout,color: Colors.black),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top:10),
                                child: Text("Logout", style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black),
                                ),
                              )
                            ]),
                          ),

                        ]

                    )

                )

              ]
          ),
        ),
      ),
    );
  }
}
