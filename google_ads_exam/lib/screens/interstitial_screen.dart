import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialScreen extends StatefulWidget {
  @override
  _InterstitialScreenState createState() => _InterstitialScreenState();
}

class _InterstitialScreenState extends State<InterstitialScreen> {
  late InterstitialAd interstitialAd;
  late final RewardedAd rewardedAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    interstitialAd = InterstitialAd(
      listener: AdListener(onAdClosed: (ad) {
        print('Interstitaial Ad가 종료되었습니다.');
      }),
      adUnitId: InterstitialAd.testAdUnitId,
      request: AdRequest(),
    )..load();

    rewardedAd = RewardedAd(
      listener: AdListener(onAdClosed: (ad) {
        print('Rewarded Ad가 종료되었습니다.');
      }, onRewardedAdUserEarnedReward: (ad, item) {
        print('Rewarded Ad에서 보상을 획득했습니다.');
      }),
      adUnitId: RewardedAd.testAdUnitId,
      request: AdRequest(),
    )..load();
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
          Center(
            child: ElevatedButton(
              onPressed: () {
                interstitialAd.show();
              },
              child: Text('Interstitial Ad'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                rewardedAd.show();
              },
              child: Text('rewarded Ad'),
            ),
          ),
        ],
      ),
    );
  }
}
