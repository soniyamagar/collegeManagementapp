import 'dart:convert';
import 'dart:developer';

import 'package:hamroinfofyp/Login/Signup.dart';
import 'package:hamroinfofyp/homePage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = true;
  void validation(){
    if(usernameController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter the username");
    }
    else if(passwordController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter the password");
    }else
    {
      login();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff87cefa),),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  padding: const EdgeInsets.only(top: 30, left: 100),
                  child: Image.asset("asset/image/logo.png",height: 190),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 155),
                  child: const Text(
                    "Login ",
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
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                SizedBox(height: 5,),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 20,right: 10),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Username',
                        hintStyle: const TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),)),

                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top:20,left: 20),
                  child: const Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 20,right: 10),
                  child: TextField(
                    controller: passwordController,
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black26,
                            fontWeight: FontWeight.bold),
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),


                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:80,left: 150, right: 100),
                  child: ElevatedButton(
                      onPressed: () {

                        validation();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
                        // Fluttertoast.showToast(msg: "Success");
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(top:80,left: 100),
                  child: Row(
                    children: [
                      Text("New User? ",style: TextStyle(color: Colors.black),),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                          },
                          child: Text("Create Account",style: TextStyle(color: Colors.purpleAccent),)),
                    ],


                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

  Future<void> login() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.post(
      Uri.parse("https://api-rdms.sooritechnology.com.np/api/login"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: (json.encode(
          {
            "username": usernameController.text,
            "password": passwordController.text
          })),
    );
    log(response.body);
    // log("This is the response form backend"+response.body);
    log("This is the response code"+response.statusCode.toString());

    if (response.statusCode == 200) {
      prefs.setString("access_token", jsonDecode(response.body)['tokens']['access_token']);
      prefs.setString("name", jsonDecode(response.body)['username']);
      usernameController.clear();
      passwordController.clear();
      Fluttertoast.showToast(msg: "Success");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));


    } else if(response.statusCode==401){
      usernameController.clear();
      passwordController.clear();
      Fluttertoast.showToast(msg: "${json.decode(response.body)}");
    }

  }

}
