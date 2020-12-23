import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_infinite_scroll/ajax_provider.dart';
import 'package:provider_infinite_scroll/provider_infinite_scroll_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AjaxProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProviderInfiniteScrollScreen(),
    );
  }
}
