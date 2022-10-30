// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardListItemWidget extends StatelessWidget {
  const CardListItemWidget(
      {super.key,
      required this.signalIcon,
      required this.signalIconColor,
      required this.bgColor,
      required this.fgColor});

  final IconData signalIcon;
  final Color signalIconColor;
  final Color bgColor;
  final Color fgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Time: 00:00:00",
                  style: TextStyle(
                      color: fgColor,
                      fontFamily: "Poppins Regular",
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Symbol: EUR/USD",
                  style: TextStyle(
                      color: fgColor,
                      fontFamily: "Poppins Regular",
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: FaIcon(
                              FontAwesomeIcons.circleArrowUp,
                              size: 16,
                              color: Color(0xFF1DBE0F),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text("Call",
                                style: TextStyle(
                                    color: fgColor,
                                    fontFamily: "Poppins Regular",
                                    fontWeight: FontWeight.w600)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text("Amount: 09",
                                style: TextStyle(
                                    color: fgColor,
                                    fontFamily: "Poppins Regular",
                                    fontWeight: FontWeight.w600)),
                          ),
                          Text("%: 69.23",
                              style: TextStyle(
                                  color: fgColor,
                                  fontFamily: "Poppins Regular",
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: FaIcon(
                                FontAwesomeIcons.circleArrowDown,
                                size: 16,
                                color: Color(0xFFC34848),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Text("Put",
                                  style: TextStyle(
                                      color: fgColor,
                                      fontFamily: "Poppins Regular",
                                      fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text("Amount: 04",
                                  style: TextStyle(
                                      color: fgColor,
                                      fontFamily: "Poppins Regular",
                                      fontWeight: FontWeight.w600)),
                            ),
                            Text("%: 30.76",
                                style: TextStyle(
                                    color: fgColor,
                                    fontFamily: "Poppins Regular",
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            left: BorderSide(color: Colors.white, width: 1))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: FaIcon(
                      signalIcon,
                      color: signalIconColor,
                      size: 38,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}