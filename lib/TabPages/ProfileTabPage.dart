import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hamroinfofyp/Login/login.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  _ProfileTabPageState createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {


  String? userId;
  String? username;
  String? email;
  String? address;
  String? mobilenumber;
  int? gender;
  String? created_date_bs;

  File? imageFile;

  String Name="";

  Future<void> getName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Name = prefs.getString("name").toString();
  }

  @override
  void initState() {
    getName();
    // TODO: implement initState
    super.initState();
  }
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff87cefa),
        title: Padding(
          padding: EdgeInsets.only(left:100),
          child: Text("Profile", style: TextStyle(color: Colors.black)),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)
                      ),
                      color: Color(0xff87cefa),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(70),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(65),
                              child: imageFile == null
                                  ? Image.network(
                                "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png",
                                fit: BoxFit.fill,
                              )
                                  : Image.file(
                                imageFile!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              _showImageDialog();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(width: 2, color: Colors.white),
                                  shape: BoxShape.circle,
                                  color: Colors.blueGrey),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              Text(
                "Soniya",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "soniyatmagar@gmail.com",
                style: const TextStyle(color: Colors.blueGrey, fontSize: 14),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(height: 10),
              Container(
                  height:280,
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
                            Icon(Icons.call,color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top:10),
                              child: Text("9812167134", style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black),
                              ),
                            )
                          ]),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, top:20),
                          child: Row(children: [
                            Icon(Icons.mail,color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top:10),
                              child: Text("soniyatmagar@gmail.com", style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black),
                              ),
                            ),
                          ]),
                        ),

                        Padding(
                            padding: const EdgeInsets.only(left: 10, top:20),
                            child: Row(children: [
                              Icon(Icons.location_on,color: Colors.black),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top:10),
                                child: Text("Pokhara", style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black),
                                ),
                              ),
                            ])
                        ),


                        Padding(
                          padding: const EdgeInsets.only(left: 10, top:20),
                          child: Row(children: [
                            Icon(Icons.logout,color: Colors.black),
                            GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                },

                              child: Text("Logout", style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black),
                              ),
                            )
                          ]),
                        ),

                      ]

                  )

              ),

            ],
          ),
        ),
      ),
    );
  }

  void _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Choose an option"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    _getFromCamera();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _getFromGallery();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.image,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    // _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }

  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    // _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }



//
// void _cropImage(filePath) async {
//   File? croppedImage = await ImageCropper.cropImage(
//     sourcePath: filePath,
//     maxHeight: 1080,
//     maxWidth: 1080,
//   );
//   if (croppedImage != null) {
//     imageFile = croppedImage;
//   }
// }
}






