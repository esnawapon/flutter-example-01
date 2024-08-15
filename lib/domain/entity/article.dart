import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article({
    this.id,
    this.title,
    this.body,
    this.image,
  });

  final String? id;
  final String? title;
  final String? body;
  final String? image;

  @override
  List<Object?> get props => [
        id,
        title,
        body,
        image,
      ];
}
