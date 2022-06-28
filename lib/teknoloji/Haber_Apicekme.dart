import 'package:final_flutterr/model/haber_api.dart';
import 'package:final_flutterr/service/news_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Haber extends StatefulWidget {
  const Haber({Key? key}) : super(key: key);

  @override
  State<Haber> createState() => _HaberState();
}

class _HaberState extends State<Haber> {
  List<Articles> articles = [];
  @override
  void initState() {
    NewsService.habergetir().then((value) {
      setState(() {
        articles = value!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Haberler"),
          centerTitle: true,
        ),
        body: Center(
            child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.network(articles[index].urlToImage!),
                        ListTile(
                          leading: Icon(Icons.arrow_drop_down),
                          title: Text(articles[index].title!),
                          subtitle: Text("Yazar"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(articles[index].description!),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  launchUrl(Uri.parse(articles[index].url!));
                                },
                                child: Text("Habere Git"))
                          ],
                        ),
                        SizedBox(
                          width: 30,
                          child: Text("----------------------------"),
                        )
                      ],
                    ),
                  );
                }))));
  }
}
