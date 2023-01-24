import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  final List<Course> courses = [
    Course(
      title: 'Introduction to Flutter',
      description: 'Learn how to build beautiful, interactive mobile apps with Flutter',
      instructor: 'John Gurung',
      duration: 10,
      price: 19.99,
    ),
    Course(
      title: 'Dart Programming',
      description: 'Learn the basics of the Dart programming language and how to use it in Flutter apps',
      instructor: 'Sandip Adhikari',
      duration: 8,
      price: 15.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff87cefa),
        title: Padding(
          padding: EdgeInsets.only(left:10),
          child: Text("Courses", style: TextStyle(color: Colors.black)),
        ),
      ),
    body: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
    children: [
    SizedBox(height: 80),
    Container(
    child: Container(
    height:550,
    width: 400,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: const [
    BoxShadow(
    color: Colors.black38,
    offset: Offset(2, 2),
    spreadRadius: 1,
    blurRadius: 10),
    ],
    ),
        child: Container(
        padding: EdgeInsets.all(8),
    child: ListView.builder(
    itemCount: courses.length,
    itemBuilder: (context, index) {
    return Card(
    child: Column(
    children: <Widget>[
    ListTile(
    leading: Icon(Icons.book, color:Colors.black,),
      title: Text(courses[index].title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    subtitle: Text(courses[index].instructor),
    ),
    Padding(
    padding: EdgeInsets.all(8),
    child: Text(courses[index].description),
    ),
      Container(
        padding: const EdgeInsets.only(top:20,left: 150, right: 100),
        child: ElevatedButton(
            onPressed: () {


             // Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
            },
            child: const Text(
              "Details",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )),
      ),
                Container(
      padding: const EdgeInsets.only(top:2,left: 150, right: 100),
         child: ElevatedButton(
            onPressed: () {


              // Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
            },
            child: const Text(
              "Enroll",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )),
      ),

    ],
    ),
    );


    },
    ),
        ),
    ),
    )
    ]
    )
    )
    );
  }


}
class Course {
  final String title;
  final String description;
  final String instructor;
  final int duration;
  final double price;

  Course({required this.title, required this.description, required this.instructor, required this.duration, required this.price});
}




