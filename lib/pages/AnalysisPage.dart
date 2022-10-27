// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:signal_analyst/widgets/AppBarWidget.dart';
import 'package:signal_analyst/widgets/BarChartWidget.dart';
import 'package:signal_analyst/widgets/SelectWidget.dart';
import 'package:signal_analyst/widgets/DetailsListItemWidget.dart';
import 'package:signal_analyst/widgets/CardListItemWidget.dart';

class AnalisysPage extends StatelessWidget {
  const AnalisysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(title: "Signal Analyst")),
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
                      const SelectWidget(),
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
                          height: 120,
                          width: 349,
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return const DetailsListItemWidget();
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
                        width: 365,
                        height: 400,
                        child: ListView.builder(
                            itemCount: 15,
                            itemBuilder: (BuildContext context, int index) {
                              return const CardListItemWidget();
                            }),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
