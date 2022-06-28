import 'package:flutter/material.dart';

class AhmetMuhip extends StatelessWidget {
  const AhmetMuhip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade400,
          title: Text(
            "AhmetMuhipDıranas",
          ),
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal.shade400)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.turn_left,
                  color: Colors.white,
                ))
          ],
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/ahmetmuhipp.png"),
              cardolustur("Sembolizmin etkisinde kalmıştır"),
              cardolustur(
                  "Şiirde biçim,ses ve söyleyişe önem veren sanatçı;ölçü ve uyağı da şiirin önemli unsurlarından saymıştır"),
              cardolustur(
                  "Hece ölçüsünü kullanan şair, heceyi yumuşatarak serbest şiir için ortam hazırlamıştır."),
              cardolustur("Halk şiiri geleneğinden ustalıkla yararlanmıştır."),
              cardolustur(
                  "Özgün imgeleri rahat bir söyleyişle dile getirmiştir."),
              cardolustur(
                  "Umutsuz ve hüzünlü duygular şiirlerinde önemli yer tutar."),
              Card(
                color: Colors.teal.shade400,
                child: ListTile(
                  title: Text(
                    "Meşhur Eserleri",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text("Görmek İçin Tıklayınız",
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushNamed(context, "/Ahmetmuhipsiirleri");
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Card cardolustur(String ozellik) {
    return Card(
      color: Colors.orange.shade300,
      child: ListTile(
        leading: Icon(
          Icons.api_rounded,
          color: Colors.yellow,
        ),
        title: Text(ozellik, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class Ahmetmuhipsiirleri extends StatelessWidget {
  const Ahmetmuhipsiirleri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.teal.shade400)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.turn_left))
            ],
            title: Text("AhmetMuhipDıranasEserleri"),
            backgroundColor: Colors.teal.shade400),
        body: ListView(
          semanticChildCount: 3,
          children: [
            containerolustur("Halkevleri Amatör Resim ve Fotoğraf Sergileri"),
            containerolustur("Gölgeler"),
            containerolustur("Finten"),
            containerolustur("Şiirler"),
            containerolustur("Kırık Saz"),
            containerolustur("Yazılar"),
          ],
        ));
  }
}

Container containerolustur(
  String siirismi,
) {
  return Container(
    margin: EdgeInsets.all(4),
    height: 60,
    alignment: Alignment.center,
    color: Colors.orange.shade300,
    child: Text(
      siirismi,
      style: TextStyle(
          fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}
