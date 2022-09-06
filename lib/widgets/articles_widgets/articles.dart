import 'package:flutt_news/app.dart';
import 'package:flutter/material.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen(
      {Key? key,
      required this.image,
      required this.title,
      required this.content,
      required this.author,
      required this.publishedAt})
      : super(key: key);

  final String? image;
  final String? title;
  final String? content;
  final String? author;
  final String? publishedAt;
  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: widget.image != null
                        ? NetworkImage('${widget.image}')
                        : const AssetImage('images/default.png')
                            as ImageProvider,
                    fit: BoxFit.cover),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: 400,
                  child: Text(
                    widget.title != null ? '${widget.title}' : 'No Title',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Article',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: 400,
                child: Text(
                  widget.content != null ? '${widget.content}' : 'No Content',
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'More Details',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: 400,
                child: Text(
                  widget.author != null ? '${widget.author}' : 'Uknown Author',
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: 400,
                child: Text(
                  widget.publishedAt != null
                      ? 'Published at: ${widget.publishedAt}'
                      : 'Uknown publishing time!',
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.only(top: 200, right: 20),
              child: FloatingActionButton(
                child: const Icon(Icons.arrow_back),
                onPressed: () {
                  // print('Pressd!');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const App(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
