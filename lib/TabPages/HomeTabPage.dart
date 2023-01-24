
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hamroinfofyp/TabPages/Assignment.dart';
import 'package:hamroinfofyp/TabPages/Schedules.dart';
import 'package:hamroinfofyp/TabPages/course.dart';
import 'package:hamroinfofyp/TabPages/notice.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff87cefa),
        title: Padding(
        padding: EdgeInsets.only(left:10),
    child: Text("Student", style: TextStyle(color: Colors.black)),
    ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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



            SizedBox(height: 70),
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          focusColor: Colors.white,

                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AssignmentPage()));},

                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 140,

                            decoration: BoxDecoration(
                              color: const Color(0xffD3F3F4),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  offset: Offset(2, 2),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ],
                            ),

                            child: Column(
                              children: const [
                                Image(
                                  height: 100,
                                  image: AssetImage("asset/image/assignment.png",),
                                  fit: BoxFit.fill,
                                ),
                                Text("Assignments",
                                  style: TextStyle(fontSize: 15,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:50),
                        child: InkWell(
                          focusColor: Colors.white,
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SchedulePage()));},
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 140,

                            decoration: BoxDecoration(
                              color: const Color(0xffD3F3F4),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  offset: Offset(2, 2),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Column(
                              children: const [
                                Image(
                                  height: 100,
                                  image: AssetImage("asset/image/schedule.png",),
                                  fit: BoxFit.fill,
                                ),
                                Text("Schedules",
                                  style: TextStyle(fontSize: 15,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          focusColor: Colors.white,
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CoursePage()));},


                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 140,

                            decoration: BoxDecoration(
                              color: const Color(0xffD3F3F4),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  offset: Offset(2, 2),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ],
                            ),

                            child: Column(
                              children: const [
                                Image(
                                  height: 100,
                                  image: AssetImage("asset/image/modules.png",),
                                  fit: BoxFit.fill,
                                ),
                                Text("Courses",
                                  style: TextStyle(fontSize: 15,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:50),
                        child: InkWell(
                          focusColor: Colors.white,
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>NoticePage()));},
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 140,

                            decoration: BoxDecoration(
                              color: const Color(0xffD3F3F4),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  offset: Offset(2, 2),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Column(
                              children: const [
                                Image(
                                  height: 100,
                                  image: AssetImage("asset/image/notice.png",),
                                  fit: BoxFit.fill,
                                ),
                                Text("Notice",
                                  style: TextStyle(fontSize: 15,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )





          ],
        ),
      ),
    );
  }
}