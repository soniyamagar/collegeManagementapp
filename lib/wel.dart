
import 'package:flutter/material.dart';
import 'package:hamroinfofyp/Login/login.dart';




class welcomePage extends StatefulWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  _welcomePageState createState() => _welcomePageState();

}
class _welcomePageState extends State<welcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.0, -0.94),
                end: Alignment(0.968, 1.0),
                colors: [Color(0xff87cefa ), Color(0xff6b88e8)],
                stops: [0.0, 1.0],
              ),
            ),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 40),
                      child:Image.asset(
                        'animated_images/welcome.gif',
                        package: 'flutter_gallery_assets',
                      ),
                    ),


                    Container(
                      padding: const EdgeInsets.only(top:10),
                      height: 310,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment(-1.0, -0.94),
                          end: Alignment(0.968, 1.0),
                          colors: [Color(0xff87cefa ), Color(0xff6b88e8)],
                          stops: [0.0, 1.0],
                        ),
                      ),
                      child: Image.asset("asset/image/wel.png"),
                    ),


                    Container(
                      padding: const EdgeInsets.only(top:80,left: 150, right: 100),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

                            // validation();

                          },
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )),
                    ),

                  ]
              ),
            )
        )
    );
  }


}
