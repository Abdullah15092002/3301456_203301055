import 'package:flutter/material.dart';

class EdipCansever extends StatelessWidget {
  const EdipCansever({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade400,
          title: Text(
            "EdipCansever",
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
              Image.asset("assets/images/edipcanseverr.png"),
              cardolustur(
                  "Şiirlerinde insanın iç dünyasını ele almış, oldukça uzun şiirler yazmıştır."),
              cardolustur(
                  "Varoluşçuluk akımının etkisinde kalan sanatçı; kişinin dünya karşısındaki yerini araştıran, düşünce yönü ağır basan şiirler yazmıştır."),
              cardolustur(
                  "Yaşadığı döneme, çağa yabancılaşan insanın bunalımlarını işlemiştir."),
              cardolustur(
                  "Divan şiirinden de etkilenen şair, resmin anlatma olanaklarından yararlanır. "),
              cardolustur("Siyasi olaylardan, yönelimlerden uzak kalmıştır."),
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
                    Navigator.pushNamed(context, "/Edipcanseversiirleri");
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

class EdipCanseversiirleri extends StatelessWidget {
  const EdipCanseversiirleri({Key? key}) : super(key: key);

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
            title: Text("EdipCanseverEserleri"),
            backgroundColor: Colors.teal.shade400),
        body: ListView(
          semanticChildCount: 3,
          children: [
            containerolustur("İkindi Üstü"),
            containerolustur("Dirlik Düzenlik "),
            containerolustur("Yerçekimli Karanfil"),
            containerolustur("Umutsuzlar Parkı "),
            containerolustur("Petrol"),
            containerolustur("Nerde Antigone"),
            containerolustur("Tragedyalar"),
            containerolustur("Çağrılmayan Yakup "),
            containerolustur("Kirli Ağustos"),
            containerolustur("Sevda ile Sevgi"),
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
