import 'package:flutter/material.dart';
import 'package:todo_app/screens/Welcomenote.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Manage your \nDaily TO DO",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
            ),
            Image.asset('assets/Illustration.png', width: 379, height: 497),
            Text(
              "Without much worry just manage\nthings as easy as piece of cake",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 15,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFC727),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 15,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFC727),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 15,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFC727),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Welcomenote()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFC00E),
                foregroundColor: Colors.black,
              ),
              child: Text("Create a Note", style: TextStyle(fontSize: 22)),
            ),
          ],
        ),
      ),
    );
  }
}
