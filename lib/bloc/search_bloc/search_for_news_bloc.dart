// ignore_for_file: no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutt_news/models/searchResponse.dart';
import 'package:flutt_news/resources/api_repository.dart';
import 'package:flutter/material.dart';

part 'search_for_news_event.dart';
part 'search_for_news_state.dart';

class SearchForNewsBloc extends Bloc<SearchForNewsEvent, SearchForNewsState> {
  SearchForNewsBloc() : super(SearchNewsInitial()) {
    final ApiSearchRepository _apiSearchRepo = ApiSearchRepository();

    on<InputSearchList>((event, emit) async {
      try {
        emit(SearchNewsLoading());
        final sList = await _apiSearchRepo.fetchSearchQuery();
        emit(SearchNewsLoaded(sList));
        if (sList.error != null) {
          emit(SearchError(sList.error));
        }
      } on SearchError {
        emit(const SearchError("Failed to fetch Data!"));
      }
    });
  }
}
