import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_exam/retrofit/RestClient.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RestClient client;

  @override
  void initState() {
    super.initState();

    Dio dio = Dio();

    client = RestClient(dio);
    Future.microtask(() async {
      final resp = await client.getTopNews();
      print(resp);
    });
  }

  renderNewsCard({@required News news}) {
    return Card(
      child: Column(
        children: [
          Text(news.id.toString()),
          Text(news.title),
          Text(news.url),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: client.getTopNews(),
        initialData: [],
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final ids = snapshot.data;

          return ListView.builder(
            itemCount: ids.length,
            itemBuilder: (_, index) {
              return FutureBuilder(
                future: client.getNewsDetail(id: ids[index]),
                builder: (_, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return renderNewsCard(news: snapshot.data);
                },
              );
            },
          );
        },
      ),
    );
  }
}
