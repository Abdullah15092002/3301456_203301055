import 'dart:convert';

import 'package:final_flutterr/model/haber_api.dart';
import 'package:final_flutterr/model/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static NewsService service = NewsService();
//factory metodu içinde bulunduğu sınıftan kalıtım alan diğer sınıflara
//yönlendirme yapıp türettiğiniz nesneyi o sınıflardan oluşturmanıza yarar.

  factory NewsService() {
    return service;
  }

  static Future<List<Articles>?> habergetir() async {
    String haberurl =
        'https://newsapi.org/v2/everything?q=Apple&from=2022-06-24&sortBy=popularity&apiKey=fb26140edacb46f2b0be5dd175bc00d5';
    //istek yapıyoruz
    final yanit = await http.get(Uri.parse(haberurl));
    if (yanit.body.isNotEmpty) {
      // yanıtı json çeviriyoruz
      final jsonyanit = json.decode(yanit.body);
      News news = News.fromJson(jsonyanit);
      return news.articles;
    }
    return null;
  }
}
