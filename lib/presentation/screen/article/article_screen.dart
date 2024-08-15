import 'package:flutter/material.dart';
import 'package:flutter_example_01/domain/entity/article.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title ?? ""),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (article.image?.isNotEmpty == true) //
              Image.network(article.image!),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                article.title ?? "",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(article.body ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}
