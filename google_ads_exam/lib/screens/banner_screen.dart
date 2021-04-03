import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerScreen extends StatefulWidget {
  @override
  _BannerScreenState createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  final String iosTestUnitId = "ca-app-pub-3940256099942544/2934735716";
  final String androidTestUnitId = "ca-app-pub-3940256099942544/6300978111";

  BannerAd? banner;

  List items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // banner = BannerAd(
    //   listener: AdListener(),
    //   size: AdSize.banner,
    //   adUnitId: Platform.isIOS ? iosTestUnitId : androidTestUnitId,
    //   request: AdRequest(),
    // )..load();

    items = List.generate(100, (index) => index);

    for (int i = items.length; i >= 1; i -= 4) {
      items.insert(
          i,
          banner = BannerAd(
            listener: AdListener(),
            size: AdSize.banner,
            adUnitId: Platform.isIOS ? iosTestUnitId : androidTestUnitId,
            request: AdRequest(),
          )..load());
    }
  }

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
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) {
                final item = this.items[index];
                if (item is int) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Center(child: Text(index.toString())),
                    ),
                  );
                } else {
                  return Container(
                    height: 50,
                    child: this.banner == null
                        ? Container()
                        : AdWidget(
                            ad: item,
                          ),
                  );
                }
              },
              separatorBuilder: (_, index) {
                return Divider();
              },
              itemCount: this.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
