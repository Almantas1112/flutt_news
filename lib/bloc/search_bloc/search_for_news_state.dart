part of 'search_for_news_bloc.dart';

@immutable
abstract class SearchForNewsState extends Equatable {
  const SearchForNewsState();

  @override
  List<Object?> get props => [];
}

class SearchNewsInitial extends SearchForNewsState {}

class SearchNewsLoading extends SearchForNewsState {}

class SearchNewsLoaded extends SearchForNewsState {
  final SearchResponse searchResponse;
  const SearchNewsLoaded(this.searchResponse);
}

class SearchError extends SearchForNewsState {
  final String? message;
  const SearchError(this.message);
}
