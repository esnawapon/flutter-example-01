import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example_01/presentation/screen/home/article_tile.dart';
import 'package:flutter_example_01/presentation/screen/home/home_app_bar.dart';
import 'package:flutter_example_01/presentation/screen/home/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getArticles(),
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.articles.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, i) {
                return ArticleTile(article: state.articles[i]);
              },
            );
          },
        ),
      ),
    );
  }
}
