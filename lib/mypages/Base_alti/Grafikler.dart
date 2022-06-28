import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Grafikler extends StatelessWidget {
  const Grafikler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, double> tatlituzlu1 = Map();
    tatlituzlu1.putIfAbsent("Tuzlu Su", () => 97.5);
    tatlituzlu1.putIfAbsent("Tatlı Su", () => 2.5);
    Map<String, double> tatlituzli2 = Map();
    tatlituzli2.putIfAbsent("Buz Dağları Ve Buzullar", () => 68.7);
    tatlituzli2.putIfAbsent("Yeraltı Suyu", () => 30.1);
    tatlituzli2.putIfAbsent("Yüzey Suyu", () => 0.3);
    Map<String, double> tatlituzli3 = Map();
    tatlituzli3.putIfAbsent("Nehirler", () => 2);
    tatlituzli3.putIfAbsent("Bataklıklar", () => 11);
    tatlituzli3.putIfAbsent("Göller", () => 87);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 13, 240, 5),
          title: Text("Dünya Su Kaynakları Dağılımı"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PieChart(dataMap: tatlituzlu1),
              PieChart(dataMap: tatlituzli2),
              PieChart(dataMap: tatlituzli3),
            ],
          ),
        ));
  }
}
