import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/screens/news_article_detail_screen.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';
import 'package:news_app/widgets/circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  const NewsGrid({Key key, this.articles}) : super(key: key);

  void _showNewsArticleDetails(context, article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsArticleDetailScreen(
        article: article,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    log("NewsGrid start");
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (_, index) {
        var article = articles[index];
        return GestureDetector(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          child: GridTile(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: CircleImage(
                imageUrl: article.imageUrl,
              ),
            ),
            footer: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
      itemCount: this.articles.length,
    );
  }
}
