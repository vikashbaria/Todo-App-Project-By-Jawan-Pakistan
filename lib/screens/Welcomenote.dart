import 'package:flutter/material.dart';

class Welcomenote extends StatefulWidget {
  const Welcomenote({super.key});

  @override
  State<Welcomenote> createState() => _WelcomenoteState();
}

class _WelcomenoteState extends State<Welcomenote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome to Notes",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                CircleAvatar(radius: 26, backgroundColor: Colors.grey),
              ],
            ),
            Text(
              "Have a great Day",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            Text(
              "My Priority Task ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 190,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFFA6A6A6),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentGeometry.bottomRight,
                          child: Icon(
                            Icons.mobile_off_rounded,
                            color: Color(0xFFC7C7C7),
                          ),
                        ),
                        Text(
                          "2 hours Ago",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFDADADA),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text("Mobile App UI Design"),
                        Text("Mobile App UI Design"),
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 40),
                  height: 190,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFFA6A6A6),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(children: []),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
