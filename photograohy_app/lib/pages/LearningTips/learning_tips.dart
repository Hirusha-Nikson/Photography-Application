import 'package:flutter/material.dart';
import 'package:photograohy_app/theme/dark_mode.dart';
import 'package:photograohy_app/theme/light_mode.dart';

// Define the article data model
class Article {
  final String title;
  final String author;
  final String content;
  final String imageUrl;

  Article({
    required this.title,
    required this.author,
    required this.content,
    required this.imageUrl,
  });
}

// Article widget to display individual articles
class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            article.imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'By ${article.author}',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  article.content,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleListWidget extends StatelessWidget {
  final List<Article> articles;

  const ArticleListWidget({required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleWidget(article: articles[index]);
      },
    );
  }
}

// Main app widget
void main() {
  runApp(LearningTips());
}

class LearningTips extends StatelessWidget {
  final List<Article> articles = [
    Article(
      title: 'MILKY WAY CAPTURE',
      author: 'John Doe',
      content:
          'These days it is possible to capture the night sky with a phone camera, especially more modern ones with a dedicated ‘night mode’, but for this guide we will focus (excuse the pun) on using a standard interchangeable lens DSLR or mirrorless camera. You’ll need:',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyJopY_rDRUixqeWbTayOpsR-WvF5nk3vUchGFxBxY5A&s',
    ),
    Article(
      title: 'Icy Waterfalls',
      author: 'Jane Smith',
      content:
          'One of the very first tricks that aspiring landscape photographers want to learn is how to make flowing water smooth using long exposure photography. The idea of capturing smooth water seems quite simple. Just use a long exposure setting on your mirrorless or DSLR camera and you will be set.',
      imageUrl:
          'https://alphauniverseglobal.media.zestyio.com/Alpha-Universe-Photo-By-Mahesh-Thapa-starvingphotographer--Figure-1.jpg',
    ),
    Article(
      title: 'MonoChrome Vibe',
      author: 'Mich Goh',
      content:
          'Monochrome photography is photography where each position on an image can record and show a different amount of light, but not a different hue. It includes all forms of black-and-white photography, which produce images containing shades of neutral grey ranging from black to white.[1] Other hues besides grey, such as sepia, cyan, blue, or brown can also be used in monochrome photography.[2] In the contemporary world, monochrome photography is mostly used for artistic purposes and certain technical imaging applications, rather than for visually accurate reproduction of scenes.',
      imageUrl: 'https://www.pinterest.com/pin/539235755398178950/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Tips',
      theme: lightMode,
      darkTheme: darkMode,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Learning Tips'),
        ),
        body: ArticleListWidget(articles: articles),
      ),
    );
  }
}
