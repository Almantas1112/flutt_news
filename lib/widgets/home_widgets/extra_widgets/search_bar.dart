// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchTextController = TextEditingController();

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 390.0, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextField(
              controller: searchTextController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter article keyword',
                suffixIcon: IconButton(
                    onPressed: () => debugPrint(searchTextController.text),
                    icon: const Icon(Icons.search)),
                //TODO: BUTTON PRESS FUNCTION IMPLEMENT
              ),
            ),
          ),
        ],
      ),
    );
  }
}
