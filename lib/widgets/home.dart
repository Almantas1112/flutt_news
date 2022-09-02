// ignore_for_file: depend_on_referenced_packages

import 'package:flutt_news/widgets/home_widgets/extra_widgets/horizontal_list.dart';
import 'package:flutt_news/widgets/home_widgets/extra_widgets/search_bar.dart';
import 'package:flutt_news/widgets/home_widgets/extra_widgets/vertical_list.dart';
import 'package:flutt_news/widgets/home_widgets/no_internet_widgets/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/network/network_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NetworkBloc, NetworkState>(
        builder: (context, state) {
          if (state is NetworkFailure) {
            return const NoInternet();
          } else if (state is NetworkSuccess) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: const [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(50.0),
                          child: Text(
                            'News',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 130.0, horizontal: 30.0),
                        child: Text(
                          'Blog Posts',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  const HorizontalList(),
                  Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 360.0, horizontal: 30.0),
                        child: Text(
                          'Search for articles',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  const SearchBar(),
                  const VerticalList(),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
