// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:flutt_news/models/searchResponse.dart';
import 'package:flutt_news/widgets/home_widgets/extra_widgets/search_bar.dart';
import 'package:flutter/material.dart';

import '../models/newsResponse.dart';

class ApiProvider {
  final Dio _dio = Dio();
  static const String _apiKey = 'eeccb51b5d204e92acdc78eda91b1b05';
  final String _url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$_apiKey';

  Future<NewsResponse> fetchNewsList() async {
    try {
      Response response = await _dio.get(_url);
      return NewsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      return NewsResponse.withError("Data not found / Connection issue");
    }
  }
}

class ApiSearchProvider {
  final Dio _dio = Dio();
  static const String _apiKey = 'eeccb51b5d204e92acdc78eda91b1b05';
  static String _url =
      'https://newsapi.org/v2/top-headlines?q=${SearchBar.searchTextController.text}&apiKey=$_apiKey';

  Future<SearchResponse> fetchSearchQuery() async {
    try {
      Response response = await _dio.get(_url);
      return SearchResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      return SearchResponse.withError("Data not found / Connection issue");
    }
  }
}
