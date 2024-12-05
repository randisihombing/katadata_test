import 'package:flutter/material.dart';
import '../../model/article_model.dart';

class ListItemArticle extends StatelessWidget {
  final Article article;

  const ListItemArticle({super.key, required this.article});


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0
      ),
      child: ListTile(
        title: Text(
            article.title
        ),
        subtitle: Text(
            article.body.length > 50 ?
            '${article.body.substring(0, 50)}...' :
            article.body
        ),
      ),
    );
  }
}
