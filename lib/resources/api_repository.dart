import 'package:flutt_news/models/newsResponse.dart';
import 'package:flutt_news/models/searchResponse.dart';
import 'package:flutt_news/services/news_services_api.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<NewsResponse> fetchNewsList() {
    return _provider.fetchNewsList();
  }
}

class ApiSearchRepository {
  final _provider = ApiSearchProvider();

  Future<SearchResponse> fetchSearchQuery() {
    return _provider.fetchSearchQuery();
  }
}

class SearchError extends Error {}

class NetworkError extends Error {}
