import 'package:flutter/material.dart';

class VerticalList extends StatefulWidget {
  const VerticalList({Key? key}) : super(key: key);

  @override
  _VerticalListState createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 500.0, horizontal: 30.0),
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
    );
  }
}
