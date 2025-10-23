import 'package:flutter/material.dart';
import 'package:todo_app/global%20widgets/widgets.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardCustom(
                  icon: Icons.mobile_off_rounded,
                  timeAgo: "2 hours Ago",
                  title: "Mobile App\nUI Design",
                  subtitle: "using Figma and other tools",
                ),
                cardCustom(
                  icon: Icons.camera_alt_outlined,
                  timeAgo: "4 hours Ago",
                  title: "Capture sun\nRise Shots",
                  subtitle: "using Figma and other tools",
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Tasks ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF00BA00),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
