import 'package:final_flutterr/model/news.dart';
import 'package:final_flutterr/mypages/AnaBase.dart';
import 'package:final_flutterr/mypages/Base.dart';
import 'package:final_flutterr/mypages/login.dart';
import 'package:final_flutterr/service/firebase_service.dart';
import 'package:final_flutterr/teknoloji/FirebaseCrud.dart';
import 'package:final_flutterr/teknoloji/Haber_Apicekme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.amberAccent.shade100,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.amber.shade300,
            title: Text("Uygulamalar"),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.width_wide_sharp,
                      size: 40,
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.amber.shade300)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Base()));
                      },
                      child: Text("Şairler Uygulaması")),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.warehouse_rounded,
                      size: 40,
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.amber.shade300)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TeknolojiCrud()));
                      },
                      child: Text("Stok Kontrol Uygulaması")),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.newspaper,
                      size: 40,
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.amber.shade300)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Haber()));
                      },
                      child: Text("Haberler")),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.emoji_emotions_sharp,
                      size: 40,
                    ),
                  ),
                  //VE DİĞERLERİ
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.amber.shade300)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AnaBase()));
                      },
                      child: Text("Kullanımlar")),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.security_update,
                      size: 40,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.amber.shade300)),
                    onPressed: () async {
                      await FirebaseService().signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text("Google Hesabından Çıkış Yap"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
