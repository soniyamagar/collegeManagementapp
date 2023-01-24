import 'package:flutter/material.dart';
class Notice {
  final String title;
  final String description;
  final String teacher;


  Notice({required this.title, required this.description, required this.teacher});

}

class NoticePage extends StatelessWidget {
  final List<Notice> notices = [
    Notice(
      title: 'Homework Assignment',
      description: 'Complete the attached homework and submit it by Friday',
      teacher: 'Mr. Smith',

    ),
    Notice(
      title: 'Upcoming Exam',
      description: 'There will be an exam on Monday covering chapter 3',
      teacher: 'Ms. Johnson',

    ),
    Notice(
      title: 'Meeting',
      description: 'Join the meeting with your supervisor on Sunday',
      teacher: 'Mr. Smith',

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff87cefa),
          title: Padding(
            padding: EdgeInsets.only(left:10),
            child: Text("Notices", style: TextStyle(color: Colors.black)),
          ),
        ),
    body: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
    children: [
    SizedBox(height: 80),
    Container(
    child: Container(
    height:400,
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
          child: ListView.builder(
              itemCount: notices.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.announcement, color: Colors.black),
                        title: Text(notices[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(notices[index].teacher),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(notices[index].description),
                      ),
                    ],
                  ),
                );
              }
          ),

        )
        )
    ]
    )
    )
    );
  }
}

