import 'package:flutter/material.dart';
import 'package:flutter_example_01/domain/entity/article.dart';
import 'package:flutter_example_01/presentation/root/app_routes.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.article, arguments: article),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (article.image?.isNotEmpty == true)
            Image.network(
              article.image!,
              height: 300,
            ),
          ListTile(
            title: Text(
              article.title ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              article.body ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
