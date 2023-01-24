import 'package:flutter/material.dart';

class AssignmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff87cefa),
        title: Padding(
          padding: EdgeInsets.only(left:10),
          child: Text("Assignments", style: TextStyle(color: Colors.black)),
        ),
      ),

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
    children: [


        SizedBox(height: 80),
        Container(
          height:300,
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
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.black),
              title: Text("Assignment 1",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
              subtitle: Text('Due date: tomorrow'),
              trailing: Icon(Icons.more_vert, color: Colors.black),
              onTap: () {
                // Navigate to assignment details page
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.black),
              title: Text("Assignment 2",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
              subtitle: Text('Due date: Sunday'),
              trailing: Icon(Icons.more_vert, color: Colors.black),
              onTap: () {
                // Navigate to assignment details page
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.black),
              title: Text("Assignment 3",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
              subtitle: Text('Due date: 2023/2/7'),
              trailing: Icon(Icons.more_vert, color: Colors.black),
              onTap: () {
                // Navigate to assignment details page
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.black),
              title: Text("Assignment 4",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
              subtitle: Text('Due date: 2023/2/25',  ),
              trailing: Icon(Icons.more_vert, color: Colors.black),
              onTap: () {
                // Navigate to assignment details page
              },
            ),
          ],

        ),

      ),
        ]



      )
    )

    );
  }
}
