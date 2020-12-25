import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/services/web_service.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  void topCountryHeadlines(String country) async {
    log('NewsArticleListViewModel start');
    log('topHeadliines start');

    List<NewsArticle> newsArticles =
        await WebService().fetchTopHeadlinesCountry(country);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    log('topHeadliines end');
    log('NewsArticleListViewModel end');
  }

  void topHeadlines() async {
    log('NewsArticleListViewModel start');
    log('topHeadliines start');

    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
  }
}
