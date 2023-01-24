import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hamroinfofyp/Login/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hamroinfofyp/Login/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool _passwordVisible = true;
  void validation(){
    if(usernameController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter the username");
    }
    else if(passwordController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter the password");
    }else
    {
      Singup();
    }

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff87cefa),
        title: Text("Signup"),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30, left: 145),
                child: const Text(
                  "Signup ",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Divider(
                color: Colors.purpleAccent,
                indent: 50,
                endIndent: 50,
                thickness: 1,

              ),
              Container(
                padding: const EdgeInsets.only(top:20,left: 20),
                child: const Text(
                  "Username",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 7,),
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 20,right: 10),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Please enter your Username',
                      hintStyle: const TextStyle(
                          color: Colors.black26,
                          fontSize: 13),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),)),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.only(top:20,left: 20),
                child: const Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 7,),
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 20,right: 10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Please enter your Password',
                      hintStyle: const TextStyle(
                          color: Colors.black26,
                          fontSize: 13),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),)),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.only(top:20,left: 20),
                child: const Text(
                  "Confirm Password",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 7,),
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 20,right: 10),
                child: TextField(
                  obscureText: true,
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Please confirm your Password',
                      hintStyle: const TextStyle(
                          color: Colors.black26,
                          fontSize: 13),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),)),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.only(top:20,left: 20),
                child: const Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 7,),
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 20,right: 10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Please enter your Email',
                      hintStyle: const TextStyle(
                          color: Colors.black26,
                          fontSize: 13),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),)),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top:20,left: 20),
                child: const Text(
                  "Address",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 20,right: 10),
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Please enter your Address',
                      hintStyle: const TextStyle(
                          color: Colors.black26,
                          fontSize: 13),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),)),
                ),
              ),


              Container(
                padding: const EdgeInsets.only(top:20,left: 20),
                child: const Text(
                  "Phone number",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 7,),
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 20,right: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Please enter your Phone number',
                      hintStyle: const TextStyle(
                          color: Colors.black26,
                          fontSize: 13),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),)),
                ),
              ),

              SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.only(top:20,left: 150, right: 100),
                child: ElevatedButton(
                    onPressed: () {
                      validation();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      //Fluttertoast.showToast(msg: "Successful");
                      Singup();
                    },

                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                ),
              ),

              Container(
                padding: EdgeInsets.only(top:20,left: 100),
                child: Row(
                  children: [
                    Text("Already have an account? ",style: TextStyle(color: Colors.black),),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                        },
                        child: Text("Login",style: TextStyle(color: Colors.purpleAccent),)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> Singup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.post(
        Uri.parse("https://eazycare-api-staging.dipendranath.com.np/api/v1/public-app/user-app/register"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: (jsonEncode({
          "user": {
            "userName": usernameController.text,
            "password": passwordController.text,
            "email": emailController.text,
            "confirmPassword": confirmPasswordController.text
          },
          "address": addressController.text,
          "phoneNo": phoneController.text,
        })));
    log("this is the body"+response.body);
    log("This is the status code"+response.statusCode.toString());
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Success");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    } else if(response.statusCode==400){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
      Fluttertoast.showToast(msg: "${json.decode(response.body)}");
    }
  }
}
