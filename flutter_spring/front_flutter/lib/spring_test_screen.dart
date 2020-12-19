import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io' show Platform;

class SpringTest extends StatefulWidget {
  @override
  _SpringTestState createState() => _SpringTestState();
}

class _SpringTestState extends State<SpringTest> {
  TextEditingController email = TextEditingController();
  TextEditingController passwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: [
            TextFormField(
              controller: email,
            ),
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              controller: passwd,
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {
                checkSpring();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'login',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkSpring() async {
    print('login');
    print(email.text);
    String url = "";
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        url = 'https://c4a0538b50d3.ngrok.io/flutter/post';
      } else {
        url =
            'https://cors-anywhere.herokuapp.com/https://c4a0538b50d3.ngrok.io/flutter/post';
      }
    } catch (e) {
      url =
          'https://cors-anywhere.herokuapp.com/https://c4a0538b50d3.ngrok.io/flutter/post';
    }

    Map<String, String> headers = {"Content-type": "application/json"};
    Map<String, String> map = {"email": email.text, "passwd": passwd.text};
    JsonEncoder jsonEncoder = new JsonEncoder();
    var json = jsonEncoder.convert(map);

    // make POST request
    Response response = await http.post(url, headers: headers, body: json);

    if (response.statusCode == 200) {
      print('OK...... complete');
      print(response.body);
    }
  }
}
