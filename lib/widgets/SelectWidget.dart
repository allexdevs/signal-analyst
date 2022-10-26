// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SelectWidget extends StatelessWidget {
  const SelectWidget(
      {super.key,
      this.symbolController,
      this.profitController,
      this.timeframeController});

  final dynamic symbolController;
  final dynamic profitController;
  final dynamic timeframeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 349,
      height: 105,
      decoration: const BoxDecoration(
          color: Color(0xFFEFEFEF),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: SizedBox(
                    width: 149.5,
                    child: SizedBox(
                      height: 30,
                      child: TextFormField(
                        controller: symbolController,
                        style: const TextStyle(
                            color: Color(0xFF999999),
                            fontWeight: FontWeight.w600),
                        decoration: const InputDecoration(
                            hintText: "symbol",
                            hintStyle: TextStyle(
                                color: Color(0xFF999999),
                                fontFamily: "Poppins Regular",
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: SizedBox(
                    width: 149.5,
                    child: SizedBox(
                      height: 30,
                      child: TextFormField(
                        controller: profitController,
                        style: const TextStyle(
                            color: Color(0xFF999999),
                            fontWeight: FontWeight.w600),
                        decoration: const InputDecoration(
                            hintText: "% profit",
                            hintStyle: TextStyle(
                                color: Color(0xFF999999),
                                fontFamily: "Poppins Regular",
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
            child: SizedBox(
              height: 30,
              child: TextFormField(
                controller: timeframeController,
                style: const TextStyle(
                    color: Color(0xFF999999), fontWeight: FontWeight.w600),
                decoration: const InputDecoration(
                    hintText: "timeframe",
                    hintStyle: TextStyle(
                        color: Color(0xFF999999),
                        fontFamily: "Poppins Regular",
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    fillColor: Color(0xFFFFFFFF),
                    filled: true,
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
