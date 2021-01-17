import 'package:flutter/material.dart';
import 'package:quiz_app_test/export.dart';
import 'package:quiz_app_test/models/api_adapter.dart';
import 'package:quiz_app_test/screens/quiz_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Quiz> quizs = [];
  bool isLoading = false;

  _fetchQuizs() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get('https://agile-sea-28515.herokuapp.com/quiz/3');
    if (response.statusCode == 200) {
      setState(() {
        quizs = parseQuizes(utf8.decode(response.bodyBytes));
        isLoading = false;
      });
    } else {
      throw Exception('http connection error');
    }
  }
  // List<Quiz> quizs = [
  //   Quiz.fromMap({
  //     'title': 'test1',
  //     'candidates': ['a', 'b', 'c', 'd'],
  //     'answer': 1,
  //   }),
  //   Quiz.fromMap({
  //     'title': 'test2',
  //     'candidates': ['a', 'b', 'c', 'd'],
  //     'answer': 2,
  //   }),
  //   Quiz.fromMap({
  //     'title': 'test3',
  //     'candidates': ['a', 'b', 'c', 'd'],
  //     'answer': 3,
  //   })
  // ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('My Quiz App'),
            backgroundColor: Colors.deepPurple,
            leading: Container(),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/quiz.jpeg',
                  width: width * 0.8,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.024),
              ),
              Text(
                'Flutter Quiz App',
                style: TextStyle(
                  fontSize: width * 0.065,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Text('퀴즈를 풀기전 안내사항입니다.\n확인하신 후 퀴즈풀기를 눌러주세요.'),
              Padding(
                padding: EdgeInsets.all(width * 0.024),
              ),
              _buildStep(width, '1. aaaa'),
              _buildStep(width, '2. bbbb'),
              _buildStep(width, '3. cccc'),
              SizedBox(height: 5.0),
              Container(
                padding: EdgeInsets.only(bottom: width * 0.036),
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RaisedButton(
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(width: width * 0.036),
                              Text('Loading...')
                            ],
                          ),
                        ),
                      );
                      _fetchQuizs().whenComplete(() {
                        return Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              quizs: quizs,
                            ),
                          ),
                        );
                      });
                    },
                    child: Text(
                      '지금 퀴즈 풀기',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        width * 0.048,
        width * 0.024,
        width * 0.048,
        width * 0.024,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          SizedBox(width: width * 0.024, height: width * 0.024),
          Text(title),
        ],
      ),
    );
  }
}
