import 'package:equatable/equatable.dart';

class RemoteArticleEvent extends Equatable {
  const RemoteArticleEvent();

  @override
  List<Object> get props => [];
}

class GetArticles extends RemoteArticleEvent {
  const GetArticles();
}
