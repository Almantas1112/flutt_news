part of 'search_for_news_bloc.dart';

abstract class SearchForNewsEvent extends Equatable {
  const SearchForNewsEvent();

  @override
  List<Object> get props => [];
}

class InputSearchList extends SearchForNewsEvent {}
