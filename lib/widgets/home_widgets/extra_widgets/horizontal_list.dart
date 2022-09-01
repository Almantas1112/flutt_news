import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
