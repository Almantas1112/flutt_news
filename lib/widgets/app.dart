// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flute news!',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: const [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(50.0),
                      child: Text(
                        'NEWS',
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
                    padding:
                        EdgeInsets.symmetric(vertical: 130.0, horizontal: 30.0),
                    child: Text(
                      'Blog posts',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 180.0),
                child: Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 200,
                        color: Colors.purple[600],
                        child: const Center(
                            child: Text(
                          'Item 1',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 200,
                        color: Colors.purple[500],
                        child: const Center(
                            child: Text(
                          'Item 2',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 200,
                        color: Colors.purple[400],
                        child: const Center(
                            child: Text(
                          'Item 3',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 200,
                        color: Colors.purple[300],
                        child: const Center(
                            child: Text(
                          'Item 4',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: const [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 360.0, horizontal: 30.0),
                    child: Text(
                      'Search for articles',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 390.0, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter article keyword',
                          suffixIcon: Icon(Icons.search),
                          //TODO: BUTTON PRESS FUNCTION IMPLEMENT
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 500.0, horizontal: 30.0),
                child: Container(
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
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 200,
                        color: Colors.purple[500],
                        child: const Center(
                            child: Text(
                          'Item 2',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 200,
                        color: Colors.purple[400],
                        child: const Center(
                            child: Text(
                          'Item 3',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 200,
                        color: Colors.purple[300],
                        child: const Center(
                            child: Text(
                          'Item 4',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        height: 140,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
