import 'package:flutt_news/bloc/news_bloc/bloc/news_bloc.dart';
import 'package:flutt_news/models/newsResponse.dart';
import 'package:flutt_news/services/news_services_api.dart';
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
                return const CircularProgressIndicator(
                  color: Colors.blue,
                );
              } else if (state is NewsLoading) {
                return const CircularProgressIndicator(
                  color: Colors.blue,
                );
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
                  // child: Text('${model.articles![index].author}'),
                  child: Image.network(
                    '${model.articles![index].urlToImage}',
                    fit: BoxFit.fitHeight,
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

  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 180.0),
  //     child: Container(
  //       height: 150,
  //       child: ListView(
  //         scrollDirection: Axis.horizontal,
  //         children: <Widget>[
  //           const SizedBox(
  //             width: 25,
  //           ),
  //           Container(
  //             width: 200,
  //             color: Colors.purple[600],
  //             child: const Center(
  //                 child: Text(
  //               'Item 1',
  //               style: TextStyle(fontSize: 18, color: Colors.white),
  //             )),
  //           ),
  //           const SizedBox(
  //             width: 25,
  //           ),
  //           Container(
  //             width: 200,
  //             color: Colors.purple[500],
  //             child: const Center(
  //                 child: Text(
  //               'Item 2',
  //               style: TextStyle(fontSize: 18, color: Colors.white),
  //             )),
  //           ),
  //           const SizedBox(
  //             width: 25,
  //           ),
  //           Container(
  //             width: 200,
  //             color: Colors.purple[400],
  //             child: const Center(
  //                 child: Text(
  //               'Item 3',
  //               style: TextStyle(fontSize: 18, color: Colors.white),
  //             )),
  //           ),
  //           const SizedBox(
  //             width: 25,
  //           ),
  //           Container(
  //             width: 200,
  //             color: Colors.purple[300],
  //             child: const Center(
  //                 child: Text(
  //               'Item 4',
  //               style: TextStyle(fontSize: 18, color: Colors.white),
  //             )),
  //           ),
  //           const SizedBox(
  //             width: 25,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
