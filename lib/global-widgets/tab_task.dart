import 'package:flutter/material.dart';

Widget tabtask({
  required String title,
  required String selectedtab,
  required VoidCallback onTap,
}) {
  bool isselectedTab = selectedtab == title;
  return GestureDetector(
    onTap: onTap,
    child: Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: isselectedTab ? FontWeight.w600 : FontWeight.normal,
        color: isselectedTab ? Colors.black : Colors.black,
      ),
    ),
  );
}
