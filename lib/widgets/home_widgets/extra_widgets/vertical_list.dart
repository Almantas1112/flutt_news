// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace

import 'package:flutt_news/bloc/search_bloc/search_for_news_bloc.dart';
import 'package:flutt_news/models/searchResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerticalList extends StatefulWidget {
  const VerticalList({Key? key}) : super(key: key);

  @override
  _VerticalListState createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchForNewsBloc, SearchForNewsState>(
      listener: (context, state) {
        if (state is SearchError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message!),
          ));
        }
      },
      child: BlocBuilder<SearchForNewsBloc, SearchForNewsState>(
        builder: (context, state) {
          if (state is SearchNewsInitial) {
            return Container(
              height: 500,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                    height: 200,
                    color: Colors.purple[600],
                    child: const Center(
                        child: Text(
                      'Item 1',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ),
                ],
              ),
            );
          } else if (state is SearchNewsLoading) {
            return _findingResults(context);
          } else if (state is SearchNewsLoaded) {
            return _foundBar(context, state.searchResponse);
          } else if (state is SearchError) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

Widget _findingResults(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 150),
      child: CircularProgressIndicator(
        color: Colors.blue,
      ),
    ),
  );
}

Widget _foundBar(BuildContext context, SearchResponse model) {
  return Container(
    height: 500,
    width: 350.0,
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 6,
      //TODO: LIMITER
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          child: Column(
            children: <Widget>[
              Container(
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: model.articles![index].urlToImage != null
                          ? NetworkImage('${model.articles![index].urlToImage}')
                          : const AssetImage('images/default.png')
                              as ImageProvider,
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
                      //TODO: Push to see full article
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 140),
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                        width: 300,
                        height: 160,
                        child: Text(
                          '${model.articles![index].title}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
