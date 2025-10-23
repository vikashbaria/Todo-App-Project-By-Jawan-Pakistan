import 'package:flutter/material.dart';

Widget lowertab({
  required String tasktitle,
  required String date,
  required String status,
}) {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: EdgeInsetsGeometry.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                tasktitle,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Icon(Icons.calendar_month),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 60,
            height: 20,
            decoration: BoxDecoration(
              color: status.contains("To Do")
                  ? Colors.green
                  : Color(0xff254069),

              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Center(
              child: Text(
                status,

                style: TextStyle(
                  //backgroundColor: Color(0xff254069),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Icon(Icons.more_vert_outlined, size: 34),
        ],
      ),
    ),
  );
}
