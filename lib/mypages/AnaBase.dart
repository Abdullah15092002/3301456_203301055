import 'package:final_flutterr/mypages/Base_alti/Animasyonlar.dart';
import 'package:final_flutterr/mypages/Base_alti/Grafikler.dart';
import 'package:final_flutterr/mypages/home.dart';
import 'package:flutter/material.dart';

class AnaBase extends StatelessWidget {
  const AnaBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  icon: Icon(Icons.arrow_back_rounded))
            ],
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
              "assets/images/lo.png",
              fit: BoxFit.cover,
            )),
            title: Text("Kullanımlar", textAlign: TextAlign.center),
            expandedHeight: 200,
          ),
          SliverGrid(
              delegate: SliverChildListDelegate([
                containerolustur(
                  Color.fromRGBO(46, 96, 56, 1),
                  "Grafikler",
                  context,
                ),
                containerolustur1(
                  Color.fromRGBO(46, 96, 56, 1),
                  "Animasyonlar",
                  context,
                ),
              ]),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
        ],
      ),
    );
  }
}

Widget containerolustur(
  Color color,
  String text,
  BuildContext mycontext,
) {
  return Container(
      margin: EdgeInsets.all(9),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: color),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        shape: BoxShape.rectangle,
        color: Colors.amber.shade600,
      ),
      width: 100,
      height: 100,
      child: TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith(
                (states) => Color.fromRGBO(46, 96, 56, 1)),
            textStyle: MaterialStateProperty.resolveWith((states) => TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ))),
        child: Text(text),
        onPressed: () {
          Navigator.push(mycontext,
              MaterialPageRoute(builder: (mycontext) => Grafikler()));
        },
      ));
}

Widget containerolustur1(
  Color color,
  String text,
  BuildContext mycontext,
) {
  return Container(
      margin: EdgeInsets.all(9),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: color),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        shape: BoxShape.rectangle,
        color: Colors.amber.shade600,
      ),
      width: 100,
      height: 100,
      child: TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith(
                (states) => Color.fromRGBO(46, 96, 56, 1)),
            textStyle: MaterialStateProperty.resolveWith((states) => TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ))),
        child: Text(text),
        onPressed: () {
          Navigator.push(mycontext,
              MaterialPageRoute(builder: (mycontext) => Animasyonlar()));
        },
      ));
}

ButtonStyle buttonstyle() {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.pressed)) {
      return Colors.amber;
    }
    return Colors.amber;
  }));
}
