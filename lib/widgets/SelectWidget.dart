// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signal_analyst/enums/symbols_enum.dart';
import 'package:signal_analyst/enums/timeframes_enum.dart';

class SelectWidget extends StatefulWidget {
  const SelectWidget(
      {super.key,
      this.symbolController,
      this.profitController,
      this.timeframeController});

  final dynamic symbolController;
  final dynamic profitController;
  final dynamic timeframeController;

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  List<String> symbols = [
    SymbolsEnum.eurJpy.value,
    SymbolsEnum.eurGbp.value,
    SymbolsEnum.eurUsd.value,
    SymbolsEnum.eurCad.value,
    SymbolsEnum.eurChf.value,
    SymbolsEnum.eurNzd.value,
    SymbolsEnum.gbpUsd.value,
    SymbolsEnum.gbpJpy.value,
    SymbolsEnum.gbpNzd.value,
    SymbolsEnum.audJpy.value,
    SymbolsEnum.audUsd.value,
    SymbolsEnum.audNzd.value,
    SymbolsEnum.audCad.value,
    SymbolsEnum.usdNok.value,
    SymbolsEnum.usdJpy.value,
    SymbolsEnum.usdCad.value,
    SymbolsEnum.usdChf.value,
  ];

  List<String> timeframes = [
    TimeframesEnum.min1.value,
    TimeframesEnum.min5.value,
  ];

  void selectStartTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) => print(value))
        .catchError((onError) => print(onError));
  }

  void selectEndTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) => print(value))
        .catchError((onError) => print(onError));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 349,
      height: 160,
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
                        items: symbols
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
                        onChanged: (String? value) {
                          print(value);
                        },
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
                        underline: Container(
                          height: 0,
                        ),
                        hint: const Text("symbol",
                            style: TextStyle(
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
                      items: timeframes
                          .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: value == '1min'
                                      ? const Text(
                                          "1 minuto",
                                          style: TextStyle(
                                              fontFamily: "Poppins Regular",
                                              fontSize: 12,
                                              color: Color(0xFF3B5A68),
                                              fontWeight: FontWeight.bold),
                                        )
                                      : const Text(
                                          "5 minutos",
                                          style: TextStyle(
                                              fontFamily: "Poppins Regular",
                                              fontSize: 12,
                                              color: Color(0xFF3B5A68),
                                              fontWeight: FontWeight.bold),
                                        )))
                          .toList(),
                      underline: Container(height: 0.0),
                      isExpanded: true,
                      hint: const Text("timeframe",
                          style: TextStyle(
                              fontFamily: "Poppins Regular",
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF999999))),
                      onChanged: (String? value) {
                        print(value);
                      },
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
                    onPressed: selectStartTime,
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
                    child: const Text("00:00:00",
                        style: TextStyle(
                            fontFamily: "Poppins Regular",
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF999999))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: SizedBox(
                    width: 149.5,
                    child: SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        onPressed: selectEndTime,
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.resolveWith(
                                (states) => const Color(0xFFDEDEDE)),
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            elevation: MaterialStateProperty.resolveWith(
                                (states) => 0.0),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.white)),
                        child: const Text("00:00:00",
                            style: TextStyle(
                                fontFamily: "Poppins Regular",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF999999))),
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
                controller: widget.timeframeController,
                style: const TextStyle(
                    color: Color(0xFF999999), fontWeight: FontWeight.w600),
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
