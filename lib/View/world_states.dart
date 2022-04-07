import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorlsStatesScreen extends StatefulWidget {
  WorlsStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorlsStatesScreen> createState() => _WorlsStatesScreenState();
}

class _WorlsStatesScreenState extends State<WorlsStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            PieChart(
              dataMap: const {"Total": 20, "Recovered": 15, "Deaths": 5},
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              legendOptions:
                  const LegendOptions(legendPosition: LegendPosition.left),
              animationDuration: const Duration(milliseconds: 1200),
              chartType: ChartType.ring,
              colorList: colorList,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .06),
              child: Card(
                child: Column(
                  children: [
                    ReusableRow(title: 'Total', value: '200'),
                    ReusableRow(title: 'Total', value: '200'),
                    ReusableRow(title: 'Total', value: '200'),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              decoration:  BoxDecoration(
                color: const Color(0xff1aa260),
                borderRadius:  BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text('Track Countires'),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;

  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 10 ,bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          const SizedBox(height: 5,),
          Divider()
        ],
      ),
    );
  }
}
