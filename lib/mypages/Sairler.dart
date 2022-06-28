import 'package:final_flutterr/mypages/home.dart';
import 'package:final_flutterr/mypages/login.dart';
import 'package:flutter/material.dart';

class Sairler extends StatelessWidget {
  const Sairler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (conetext) => HomeScreen()));
                },
                icon: Icon(Icons.arrow_back_rounded))
          ],
          flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
            "assets/images/kalem.png",
            fit: BoxFit.cover,
          )),
          title: Text("Yazarlar", textAlign: TextAlign.center),
          expandedHeight: 200,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          cardolustur("MehmetAkifErsoy", context, '/MehmetAkifErsoy'),
          cardolustur("SaitFaikAbasıyanık", context, '/SaitFaik'),
          cardolustur("NazımHikmet", context, '/NazimHikmet'),
          cardolustur("AhmetMuhipDıranas", context, '/AhmetMuhipDiranas'),
          cardolustur("NecipFazılKısakürek", context, '/NecipFazilKisakürek'),
          cardolustur("FarukNafizÇamlıbel", context, '/FarukNafizCamlibel'),
          cardolustur("EdipCansever", context, '/EdipCansever'),
        ]))
      ],
    ));
  }
}

Card cardolustur(String mytitle, BuildContext mycontext, String myroutename) {
  return Card(
    color: Color.fromARGB(82, 224, 203, 49),
    child: ListTile(
      onTap: () {
        Navigator.pushNamed(mycontext, myroutename);
      },
      leading: Icon(
        Icons.dashboard,
        color: Colors.yellow,
      ),
      title: Text(mytitle),
      subtitle: Text("Detaylar İçin Tıklayınız"),
    ),
  );
}
