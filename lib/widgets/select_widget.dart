// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectWidget extends StatefulWidget {
  const SelectWidget(
      {super.key,
      this.profitController,
      required this.time,
      required this.symbol,
      required this.timeframe,
      required this.symbols,
      required this.timeframes,
      required this.profit,
      this.selectTime,
      this.selectSymbol,
      this.selectTimeframe,
      this.selectProfit});

  final dynamic profitController;
  final String time;
  final String symbol;
  final String timeframe;
  final String profit;
  final List<String> symbols;
  final List<String> timeframes;
  final dynamic selectTime;
  final dynamic selectSymbol;
  final dynamic selectTimeframe;
  final dynamic selectProfit;

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 349,
      height: 120,
      decoration: const BoxDecoration(
          color: Color(0xFFEFEFEF),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: 149.50,
                    height: 30,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: DropdownButton<String>(
                        items: widget.symbols
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            fontFamily: "Poppins Regular",
                                            fontSize: 12,
                                            color: Color(0xFF3B5A68),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))
                            .toList(),
                        onChanged: widget.selectSymbol,
                        icon: const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: FaIcon(
                            FontAwesomeIcons.chevronDown,
                            color: Color(0xFF999999),
                            size: 12,
                          ),
                        ),
                        elevation: 4,
                        isExpanded: true,
                        value: widget.symbol,
                        underline: Container(
                          height: 0,
                        ),
                        hint: Text(widget.symbol,
                            style: const TextStyle(
                                fontFamily: "Poppins Regular",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF999999))),
                        dropdownColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: 149.50,
                    height: 30,
                    padding: const EdgeInsets.only(left: 10.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: DropdownButton(
                      items: widget.timeframes
                          .map<DropdownMenuItem<String>>((String value) =>
                              DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(
                                          fontFamily: "Poppins Regular",
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF3B5A68)))))
                          .toList(),
                      underline: Container(height: 0.0),
                      isExpanded: true,
                      value: widget.timeframe,
                      hint: Text(widget.timeframe,
                          style: const TextStyle(
                              fontFamily: "Poppins Regular",
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF999999))),
                      onChanged: widget.selectTimeframe,
                      icon: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: FaIcon(
                          FontAwesomeIcons.chevronDown,
                          color: Color(0xFF999999),
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: SizedBox(
                  width: 149.50,
                  child: ElevatedButton(
                    onPressed: widget.selectTime,
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                            (states) => const Color(0xFFDEDEDE)),
                        shape: MaterialStateProperty.resolveWith((states) =>
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 0.0),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white)),
                    child: Text(widget.time,
                        style: const TextStyle(
                            fontFamily: "Poppins Regular",
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3B5A68))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: 149.5,
                  height: 30,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    onChanged: widget.selectProfit,
                    controller: widget.profitController,
                    style: const TextStyle(
                        color: Color(0xFF3B5A68), fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        label: Text(
                          "${widget.profit} %",
                          style: const TextStyle(
                              color: Color(0xFF3B5A68),
                              fontFamily: "Poppins Regular",
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        fillColor: const Color(0xFFFFFFFF),
                        filled: true,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 8.0),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
