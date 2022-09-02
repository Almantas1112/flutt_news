// ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace, library_private_types_in_public_api

import 'package:flutt_news/bloc/news_bloc/bloc/news_bloc.dart';
import 'package:flutt_news/models/newsResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  final NewsBloc _newsBloc = NewsBloc();

  @override
  void initState() {
    _newsBloc.add(GetNewList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 110, horizontal: 30),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<NewsBloc, NewsState>(
          listener: (context, state) {
            if (state is NewsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsInitial) {
                return _loadingApi(context);
              } else if (state is NewsLoading) {
                return _loadingApi(context);
              } else if (state is NewsLoaded) {
                return _buildCard(context, state.newsResponse);
              } else if (state is NewsError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _loadingApi(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 120),
        child: CircularProgressIndicator(color: Colors.blue),
      ),
    );
  }

  Widget _buildCard(BuildContext context, NewsResponse model) {
    return Container(
      height: 295.0,
      width: 350.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 150,
            child: Row(
              children: <Widget>[
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            '${model.articles![index].urlToImage}'),
                        fit: BoxFit.cover),
                  ),
                  child: Card(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint(
                            'Card tapped: ${model.articles![index].title}');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 120),
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          width: 300,
                          height: 160,
                          child: Text(
                            '${model.articles![index].title}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
