// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signal_analyst/enums/symbols_enum.dart';
import 'package:signal_analyst/enums/timeframes_enum.dart';
import 'package:signal_analyst/repositories/analysis_repository.dart';
import 'package:signal_analyst/widgets/app_bar_widget.dart';
import 'package:signal_analyst/widgets/bar_chart_widget.dart';
import 'package:signal_analyst/widgets/select_widget.dart';
import 'package:signal_analyst/widgets/details_list_item_widget.dart';
import 'package:signal_analyst/widgets/card_list_item_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnalisysPage extends StatefulWidget {
  const AnalisysPage({super.key});

  @override
  State<AnalisysPage> createState() => _AnalisysPageState();
}

class _AnalisysPageState extends State<AnalisysPage> {
  final TextEditingController profitCtrl = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    final analysis = Provider.of<AnalysisRepository>(context);

    void selectStartTime() {
      showTimePicker(context: context, initialTime: TimeOfDay.now())
          .then((value) {
        analysis.changeStartTime("${value!.hour}:00:00");
      }).catchError((onError) {
        print(onError);
      });
    }

    void selectProfit(String? value) {
      value!.isNotEmpty
          ? analysis.changeProfitPercent(value)
          : profitCtrl.clear();
    }

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Analysis",
            link1: '/',
            link2: '/signal-list',
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Select Parameters",
                    style: TextStyle(
                        fontFamily: "Poppins Regular",
                        color: Color(0xFFBEBBA2),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 8.0,
                      left: MediaQuery.of(context).size.width * 0.32),
                  child: const Text(
                    "History",
                    style: TextStyle(
                        fontFamily: "Poppins Regular",
                        color: Color(0xFFBEBBA2),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SelectWidget(
                      symbols: symbols,
                      timeframes: timeframes,
                      symbol: analysis.symbol,
                      timeframe: analysis.timeframe,
                      time: analysis.time,
                      profit: analysis.profitPercent.toStringAsFixed(2),
                      selectSymbol: analysis.changeSymbol,
                      selectTimeframe: analysis.changeTimeframe,
                      selectTime: selectStartTime,
                      profitController: profitCtrl,
                      selectProfit: selectProfit,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Details",
                        style: TextStyle(
                            fontFamily: "Poppins Regular",
                            color: Color(0xFFBEBBA2),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const BarChartWidget(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        height: 210,
                        width: 349,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            if (index % 2 == 0) {
                              return const DetailsListItemWidget(
                                letfIcon: FontAwesomeIcons.circleArrowUp,
                                bgColor: Color(0xFFBEBBA2),
                                fgColor: Colors.white,
                                iconColor: Color(0xFF1DBE0F),
                              );
                            } else {
                              return const DetailsListItemWidget(
                                letfIcon: FontAwesomeIcons.circleArrowDown,
                                bgColor: Color(0xFFEFEFEF),
                                fgColor: Color(0xFFBEBBA2),
                                iconColor: Color(0xFFC34848),
                              );
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 395,
                      height: 542,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 50),
                          itemCount: analysis.totalResults.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = analysis.totalResults[index];
                            if (index % 2 == 0) {
                              return CardListItemWidget(
                                  signalIcon: item.signalIcon,
                                  signalIconColor: item.signalIconColor,
                                  time: item.time,
                                  symbol: item.symbol,
                                  callAmount: item.callAmount,
                                  putAmount: item.putAmount,
                                  callPercent: item.callPercent,
                                  putPercent: item.putPercent,
                                  bgColor: const Color(0xFFBEBBA2),
                                  fgColor: Colors.white);
                            } else {
                              return CardListItemWidget(
                                  signalIcon: item.signalIcon,
                                  signalIconColor: item.signalIconColor,
                                  time: item.time,
                                  symbol: item.symbol,
                                  callAmount: item.callAmount,
                                  putAmount: item.putAmount,
                                  callPercent: item.callPercent,
                                  putPercent: item.putPercent,
                                  bgColor: const Color(0xFFEFEFEF),
                                  fgColor: const Color(0xFFBEBBA2));
                            }
                          }),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text("Play",
              style: TextStyle(fontFamily: "Poppins Regular")),
          onPressed: () {
            analysis.pullInfo();
          },
          backgroundColor: const Color(0xFF3B5A68),
          icon: const FaIcon(FontAwesomeIcons.circlePlay)),
    );
  }
}
