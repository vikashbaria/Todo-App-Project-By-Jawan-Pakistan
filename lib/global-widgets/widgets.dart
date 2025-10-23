import 'package:flutter/material.dart';

Widget cardCustom({
  required IconData icon,
  required String timeAgo,
  required String title,
  required String subtitle,
}) {
  return Container(
    height: 190,
    width: 150,
    decoration: BoxDecoration(
      color: Color(0xFFA6A6A6),
      borderRadius: BorderRadius.all(Radius.circular(26)),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentGeometry.bottomRight,
            child: Icon(icon, color: Color(0xFFC7C7C7)),
          ),
          Text(
            timeAgo,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFDADADA),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.white)),
        ],
      ),
    ),
  );
}
