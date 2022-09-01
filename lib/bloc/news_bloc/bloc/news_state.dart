part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsResponse newsResponse;
  const NewsLoaded(this.newsResponse);
}

class NewsError extends NewsState {
  final String? message;
  const NewsError(this.message);
}
