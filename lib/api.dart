import 'dart:convert';
import 'model.dart';
import 'package:http/http.dart';

//Now let's make the HTTP request services
// this class will alows us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  //let's add an Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  //for this example I'm going to use a single endpoint

  //NOTE: make sure to use your OWN apikey, you can make a free acount and
  // choose a developer option it's FREE
  final endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=c939eba9a15b4124a7dbaca10c0b0d29";

  //Now let's create the http request function
  // but first let's import the http package

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}