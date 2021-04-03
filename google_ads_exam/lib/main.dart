import 'package:flutter/material.dart';
import 'package:google_ads_exam/screens/banner_screen.dart';
import 'package:google_ads_exam/screens/interstitial_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Ads',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xfff1efe5),
            elevation: 0,
          ),
          primaryIconTheme: IconThemeData(
            color: Colors.black,
          )),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Google Ads',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => BannerScreen()));
              },
              child: Text(
                'Banner Ads',
                style: TextStyle(fontSize: 30),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 70),
                primary: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => InterstitialScreen()));
              },
              child: Text(
                'Interstitial & Rewarded Ads',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 70),
                primary: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
