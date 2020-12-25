import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:news_app/viewmodels/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    log('Main start');
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfffefdfd),
        appBarTheme: AppBarTheme(
          color: Color(0xfffefdfd),
          elevation: 0,
          textTheme: TextTheme(
            headline2: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => NewsArticleListViewModel(),
          )
        ],
        child: NewsScreen(),
      ),
    );
  }
}
