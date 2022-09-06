// ignore_for_file: library_private_types_in_public_api

import 'package:flutt_news/widgets/home_widgets/extra_widgets/vertical_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/search_bloc/search_for_news_bloc.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);
  static final searchTextController = TextEditingController();

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchForNewsBloc(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 390.0, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextField(
                controller: SearchBar.searchTextController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter article keyword',
                  suffixIcon:
                      BlocBuilder<SearchForNewsBloc, SearchForNewsState>(
                    builder: (context, state) {
                      return IconButton(
                          onPressed: () {
                            SearchBar.searchTextController.text == ""
                                ? debugPrint("Nothing inside")
                                : context
                                    .read<SearchForNewsBloc>()
                                    .add(InputSearchList());
                          },
                          icon: const Icon(Icons.search));
                    },
                  ),
                ),
              ),
            ),
            const VerticalList(),
          ],
        ),
      ),
    );
  }
}
