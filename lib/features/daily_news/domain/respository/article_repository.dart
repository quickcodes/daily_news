import 'package:daily_news/core/resources/data_state.dart';
import 'package:daily_news/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  // Remorte
  Future<DataState<List<ArticleEntity>>> getNewsArticle();

  // Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> deleteArticle(ArticleEntity article);
}
