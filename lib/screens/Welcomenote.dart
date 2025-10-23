import 'package:flutter/material.dart';
import 'package:todo_app/global-widgets/lower_tab.dart';
import 'package:todo_app/global-widgets/tab_task.dart';
import 'package:todo_app/global-widgets/widgets.dart';
import 'package:todo_app/screens/add_task.dart';

class Welcomenote extends StatefulWidget {
  const Welcomenote({super.key});

  @override
  State<Welcomenote> createState() => _WelcomenoteState();
}

class _WelcomenoteState extends State<Welcomenote> {
  List<Map<String, String>> taskList = [
    {
      "title": "Complete Assignment #2",
      "date": "10 October 2025",
      "status": "To Do",
    },
    {
      "title": "Submit Fee Challan",
      "date": "10 September 2025",
      "status": "Done",
    },
  ];

  String imageurl =
      "https://scontent.fkhi10-1.fna.fbcdn.net/v/t1.6435-9/35549898_1731946206920610_7671100783688941568_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=yy4Mz9ABkSEQ7kNvwET3zz5&_nc_oc=AdmmH24THsmj5DTzl9TK4MMqQ6f0Bv5KQ9ZZww7LjYaXorKMeO8WzjkOB5F8lYjFX-U&_nc_zt=23&_nc_ht=scontent.fkhi10-1.fna&_nc_gid=RiUnhpHzqHQdAF5_SLhvEg&oh=00_AfdTEIARVzGtLdYKC7N9-AUqeTcHHATD2WNuWyZoTGEgFw&oe=69215519";
  String selectedTab = "Today's Task";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Welcome to Notes",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(imageurl),
                  radius: 26,
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
            const Text(
              "Have a great Day",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),

            const Text(
              "My Priority Task",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),

            // PRIORITY CARDS
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
                  subtitle: "using DSLR camera",
                ),
              ],
            ),
            const SizedBox(height: 20),

            // MY TASKS HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "My Tasks",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () async {
                    final newTask = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CreateTaskScreen(imagelink: imageurl),
                      ),
                    );

                    if (newTask != null) {
                      setState(() {
                        taskList.add(newTask);
                      });
                    }
                  },
                  child: Image.asset("assets/plus-icon.png", height: 30),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // TASK TABS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tabtask(
                  title: "Today's Task",
                  selectedtab: selectedTab,
                  onTap: () => setState(() => selectedTab = "Today's Task"),
                ),
                tabtask(
                  title: "Weekly Task",
                  selectedtab: selectedTab,
                  onTap: () => setState(() => selectedTab = "Weekly Task"),
                ),
                tabtask(
                  title: "Monthly Task",
                  selectedtab: selectedTab,
                  onTap: () => setState(() => selectedTab = "Monthly Task"),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // TASK LIST
            Expanded(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  final task = taskList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: lowertab(
                      tasktitle: task["title"] ?? "",
                      date: task["date"] ?? "",
                      status: task["status"] ?? "To Do",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
