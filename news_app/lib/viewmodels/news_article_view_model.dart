import 'package:intl/intl.dart';
import 'package:news_app/models/news_article.dart';

class NewsArticleViewModel {
  NewsArticle _newsArticle;

  NewsArticleViewModel({NewsArticle article}) : _newsArticle = article;

  String get title => _newsArticle.title;
  String get description => _newsArticle.description;
  String get imageUrl => _newsArticle.urlToImage;
  String get url => _newsArticle.url;
  String get author => _newsArticle.author;
  String get publishedAt {
    final dateTime = DateFormat('yyyy-mm-ddTHH:mm:ssZ')
        .parse(_newsArticle.publishedAt, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
  }
}
