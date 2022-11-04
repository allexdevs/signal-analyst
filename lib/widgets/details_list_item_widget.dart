// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsListItemWidget extends StatelessWidget {
  const DetailsListItemWidget(
      {super.key,
      required this.letfIcon,
      required this.bgColor,
      required this.fgColor,
      required this.iconColor,
      required this.date,
      required this.time,
      required this.dayOfWeek});

  final IconData letfIcon;
  final Color bgColor;
  final Color fgColor;
  final Color iconColor;
  final String date;
  final String time;
  final String dayOfWeek;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                iconSize: 18,
                color: iconColor,
                onPressed: () {},
                icon: FaIcon(letfIcon)),
          ),
          title: SizedBox(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                date,
                style: TextStyle(
                    fontFamily: "Poppins Regular",
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: fgColor),
              ),
              Text(
                time,
                style: TextStyle(
                    fontFamily: "Poppins Regular",
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: fgColor),
              )
            ],
          )),
          trailing: Padding(
            padding: const EdgeInsets.only(left: 26.0),
            child: Text(dayOfWeek,
                style: TextStyle(
                    fontFamily: "Poppins Regular",
                    fontWeight: FontWeight.w600,
                    color: fgColor)),
          ),
        ),
      ),
    );
  }
}
