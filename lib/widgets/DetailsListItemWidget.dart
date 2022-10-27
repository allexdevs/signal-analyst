// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsListItemWidget extends StatelessWidget {
  const DetailsListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        height: 45,
        decoration: const BoxDecoration(
            color: Color(0xFFBEBBA2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          minVerticalPadding: 2,
          leading: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                iconSize: 18,
                color: const Color(0xFF1DBE0F),
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.circleArrowUp)),
          ),
          title: SizedBox(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text(
                "00/00/0000",
                style: TextStyle(
                    fontFamily: "Poppins Regular",
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.white),
              ),
              Text(
                "00:00:00",
                style: TextStyle(
                    fontFamily: "Poppins Regular",
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.white),
              )
            ],
          )),
          trailing: const Padding(
            padding: EdgeInsets.only(left: 26.0),
            child: Text("Friday",
                style: TextStyle(
                    fontFamily: "Poppins Regular",
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
