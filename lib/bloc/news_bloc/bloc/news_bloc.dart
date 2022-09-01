import 'package:bloc/bloc.dart';
import 'package:flutt_news/models/newsResponse.dart';
import 'package:flutt_news/resources/api_repository.dart';
import 'package:flutt_news/services/news_services_api.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetNewList>((event, emit) async {
      try {
        emit(NewsLoading());
        final mList = await _apiRepository.fetchNewsList();
        emit(NewsLoaded(mList));
        if (mList.error != null) {
          emit(NewsError(mList.error));
        }
      } on NetworkError {
        emit(NewsError("Failed to fetch data!"));
      }
    });
  }
}
