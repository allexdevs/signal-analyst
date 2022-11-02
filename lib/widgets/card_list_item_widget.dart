// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardListItemWidget extends StatelessWidget {
  const CardListItemWidget(
      {super.key,
      required this.signalIcon,
      required this.signalIconColor,
      required this.bgColor,
      required this.fgColor,
      required this.time,
      required this.symbol,
      required this.callAmount,
      required this.putAmount,
      required this.callPercent,
      required this.putPercent,
      this.selectChartValues});

  final IconData signalIcon;
  final Color signalIconColor;
  final Color bgColor;
  final Color fgColor;
  final String time;
  final String symbol;
  final int callAmount;
  final int putAmount;
  final double callPercent;
  final double putPercent;
  final dynamic selectChartValues;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: selectChartValues,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                    "Time: $time",
                    style: TextStyle(
                        color: fgColor,
                        fontFamily: "Poppins Regular",
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Symbol: $symbol",
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
                              child: Text("Amount: ${callAmount.toString()}",
                                  style: TextStyle(
                                      color: fgColor,
                                      fontFamily: "Poppins Regular",
                                      fontWeight: FontWeight.w600)),
                            ),
                            Text("%: ${callPercent.toStringAsFixed(2)}",
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
                                child: Text("Amount: ${putAmount.toString()}",
                                    style: TextStyle(
                                        color: fgColor,
                                        fontFamily: "Poppins Regular",
                                        fontWeight: FontWeight.w600)),
                              ),
                              Text("%: ${putPercent.toStringAsFixed(2)}",
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
      ),
    );
  }
}
