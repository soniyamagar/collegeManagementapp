import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  final List<Schedule> schedules = [
    Schedule(time: '9:00 AM', title: 'Course 1'),
    Schedule(time: '11:00 AM', title: 'Course 2'),
    Schedule(time: '1:00 PM', title: 'Presentation'),
    Schedule(time: '3:00 PM', title: 'Break'),
    Schedule(time: '5:00 PM', title: 'Meeting with supervisor'),
  ];

  void addSchedule(String time, String title) {
    if (time != null && time.isNotEmpty) {
      schedules.add(Schedule(time: time, title: title));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff87cefa),
          title: Padding(
            padding: EdgeInsets.only(left:10),
            child: Text("Schedules", style: TextStyle(color: Colors.black)),
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
          child: ListView.builder(
            itemCount: schedules.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue[100],
                  child: Text(schedules[index].time,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                title: Text(schedules[index].title),
                trailing: Icon(Icons.more_vert),
                onTap: () {
                  // Navigate to schedule details page
                },
              );
            },
          ),
        ),

    )
    ]
    )
    )
    );
  }
}

class Schedule {
  final String time;
  final String title;

  Schedule({required this.time, required this.title});
}






