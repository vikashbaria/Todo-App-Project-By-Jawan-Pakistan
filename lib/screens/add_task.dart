import 'package:flutter/material.dart';

class CreateTaskScreen extends StatefulWidget {
  final String imagelink;
  const CreateTaskScreen({super.key, required this.imagelink});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  TimeOfDay fromTime = const TimeOfDay(hour: 10, minute: 0);
  TimeOfDay toTime = const TimeOfDay(hour: 16, minute: 30);
  String selectedPriority = "";

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  Future<void> pickTime(bool isFrom) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: isFrom ? fromTime : toTime,
    );

    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromTime = picked;
        } else {
          toTime = picked;
        }
      });
    }
  }

  String formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? "A.M" : "P.M";
    return "$hour:$minute $period";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8693F3),
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
                  "Create new Task",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(widget.imagelink),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // TIME PICKERS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTimePicker("From", fromTime, () => pickTime(true)),
                buildTimePicker("To", toTime, () => pickTime(false)),
              ],
            ),
            const SizedBox(height: 25),

            // TITLE
            const Text(
              "Title",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            const SizedBox(height: 5),
            buildTextField(titleController, maxLines: 1),
            const SizedBox(height: 20),

            // DESCRIPTION
            const Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            const SizedBox(height: 5),
            buildTextField(descController, maxLines: 3),
            const SizedBox(height: 25),

            // PRIORITY
            const Text(
              "Choose Priority",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                priorityButton("High", Colors.red),
                priorityButton("Medium", Colors.orange),
                priorityButton("Low", Colors.green),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40, left: 30, right: 30),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (titleController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please enter a task title")),
                );
                return;
              }

              final newTask = {
                "title": titleController.text.trim(),
                "date":
                    "${DateTime.now().day} ${DateTime.now().month} ${DateTime.now().year}",
                "status": selectedPriority.isEmpty ? "To Do" : selectedPriority,
              };

              Navigator.pop(context, newTask);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade400,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text(
              "Add",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTimePicker(String label, TimeOfDay time, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 140,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: const BoxDecoration(color: Colors.white),
            child: Text(formatTime(time), style: const TextStyle(fontSize: 20)),
          ),
        ),
      ],
    );
  }

  Widget buildTextField(TextEditingController controller, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget priorityButton(String label, Color color) {
    final bool isSelected = selectedPriority == label;
    return GestureDetector(
      onTap: () => setState(() => selectedPriority = label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
