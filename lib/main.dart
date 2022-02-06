import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String iOSTestUnitId = 'ca-app-pub-3940256099942544/2934735716';
  final String androidTestUnitId = 'ca-app-pub-3940256099942544/6300978111';

  BannerAd? banner;

  @override
  void initState() {
    super.initState();
    banner = BannerAd(
      listener: AdListener(),
      size: AdSize.banner,
      adUnitId: BannerAd.testAdUnitId,
      request: AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Center(
                      child: Text(
                        index.toString(),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return Divider();
              },
              itemCount: 100,
            ),
          ),
          Container(
            height: 50.0,
            child: this.banner == null
                ? Container()
                : AdWidget(
              ad: this.banner!,
            ),
          ),
        ],
      ),
    );
  }
}