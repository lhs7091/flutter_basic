class Constants {
  static const API_KEY = 'b4a3fa86d56b4381b909629b5538f23c';
  static const String TOP_HEADLINES_URL =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=${API_KEY}';
  static String headlinesFor(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=${API_KEY}';
  }

  static const Map<String, String> Countries = {
    'USA': 'us',
    'Korea': 'kr',
    'Japan': 'jp',
  };
}
