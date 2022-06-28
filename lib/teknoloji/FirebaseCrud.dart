import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeknolojiCrud extends StatefulWidget {
  const TeknolojiCrud({Key? key}) : super(key: key);

  @override
  State<TeknolojiCrud> createState() => _TeknolojiCrudState();
}

class _TeknolojiCrudState extends State<TeknolojiCrud> {
  FirebaseFirestore mydatabase = FirebaseFirestore.instance;
  TextEditingController markacontroller = TextEditingController();
  TextEditingController modelcontroller = TextEditingController();
  TextEditingController idcontroller = TextEditingController();
  TextEditingController fiyatcontroller = TextEditingController();
  TextEditingController guncellecontroller = TextEditingController();
  TextEditingController guncelleidcontroller = TextEditingController();
  TextEditingController guncellemarkacontroller = TextEditingController();
  TextEditingController guncellemodelcontroller = TextEditingController();
  TextEditingController guncellefiyatcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference urunlerref = mydatabase.collection('Ürünler');
    var urun1ref = urunlerref.doc("Ürün1");

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade400,
          title: Text("Stok Kontrol"),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.create),
            ),
            Tab(icon: Icon(Icons.read_more)),
            Tab(icon: Icon(Icons.update)),
            Tab(icon: Icon(Icons.delete)),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          //CREATE
          Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: idcontroller,
                    decoration: InputDecoration(hintText: "Id girin"),
                  ),
                  TextFormField(
                    controller: markacontroller,
                    decoration: InputDecoration(hintText: "Marka Girin"),
                  ),
                  TextFormField(
                    controller: modelcontroller,
                    decoration: InputDecoration(hintText: "Model Girin"),
                  ),
                  TextFormField(
                    controller: fiyatcontroller,
                    decoration: InputDecoration(hintText: "Fiyat Girin"),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onDoubleTap: () async {
                      //text alanındaki verilerden map oluşturmalıyız
                      Map<String, dynamic> elektronikdata = {
                        'ID': idcontroller.text,
                        'Marka': markacontroller.text,
                        'Model': modelcontroller.text,
                        'Fiyat': fiyatcontroller.text
                      };
                      print(idcontroller.text);
                      print(markacontroller.text);
                      print(modelcontroller.text);
                      print(fiyatcontroller.text);

                      //veriyi yazmak istediğimiz referansa ulaşacagız ve
                      //ilgili metodu çağıracağız
                      await urunlerref
                          .doc(idcontroller.text)
                          .set(elektronikdata);
                    },
                    child: Text(
                      "Ürünü Ekle(2 kere bas)",
                      style: TextStyle(
                          color: Colors.orange.shade300,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
                ],
              ),
            ),
          ),

          //READ
          Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: urunlerref.snapshots(),
                builder: (context, AsyncSnapshot asyncsnapshot) {
                  if (asyncsnapshot.hasError) {
                    return Text("HATA");
                  } else {
                    if (asyncsnapshot.hasData) {
                      List<DocumentSnapshot> listofdocumentsnap =
                          asyncsnapshot.data.docs;
                      return Flexible(
                        child: ListView.builder(
                          itemCount: listofdocumentsnap.length,
                          itemBuilder: (context, index) {
                            if (!asyncsnapshot.hasData) {
                              return Text("Loading");
                            } else {
                              return Card(
                                  child: ListTile(
                                title:
                                    Text('${listofdocumentsnap[index].data()}'),
                              ));
                            }
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                },
              ),
            ],
          ),

          //UPDATE
          Padding(
            padding: EdgeInsets.all(30),
            child: Form(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: guncellecontroller,
                    decoration: InputDecoration(
                        hintText:
                            "Güncellemek istediğiniz kayıtlı ID NO girin"),
                  ),
                  TextFormField(
                    controller: guncelleidcontroller,
                    decoration: InputDecoration(hintText: "ID girin"),
                  ),
                  TextFormField(
                    controller: guncellemarkacontroller,
                    decoration: InputDecoration(hintText: "Markasını girin"),
                  ),
                  TextFormField(
                    controller: guncellemodelcontroller,
                    decoration: InputDecoration(hintText: "Model Girin"),
                  ),
                  TextFormField(
                    controller: guncellefiyatcontroller,
                    decoration: InputDecoration(hintText: "Fiyat Girin"),
                  ),
                  GestureDetector(
                    child: Text(
                      "Ürünü Güncelle(uzun bas)",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    onLongPress: () async {
                      Map<String, dynamic> guncelelektronikdata = {
                        'ID': guncelleidcontroller.text,
                        'Marka': guncellemarkacontroller.text,
                        'Model': guncellemodelcontroller.text,
                        'Fiyat': guncellefiyatcontroller.text
                      };
                      await urunlerref
                          .doc(guncellecontroller.text)
                          .update(guncelelektronikdata);
                    },
                  )
                ],
              ),
            )),
          ),

          //DELETE
          Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: urunlerref.snapshots(),
                builder: (context, AsyncSnapshot asyncsnapshot) {
                  if (asyncsnapshot.hasError) {
                    return Text("HATA");
                  } else {
                    if (asyncsnapshot.hasData) {
                      List<DocumentSnapshot> listofdocumentsnap =
                          asyncsnapshot.data.docs;
                      return Flexible(
                        child: ListView.builder(
                          itemCount: listofdocumentsnap.length,
                          itemBuilder: (context, index) {
                            if (!asyncsnapshot.hasData) {
                              return Text("Loading");
                            } else {
                              return Card(
                                  child: ListTile(
                                title:
                                    Text('${listofdocumentsnap[index].data()}'),
                                trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () async {
                                      await listofdocumentsnap[index]
                                          .reference
                                          .delete();
                                    }),
                              ));
                            }
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }

  urunEkle() {}
}
//koleksiyonlara -->CollectionReferance ile
//dökümanlara -->DocumentReferance ile ulaşıyoruz
