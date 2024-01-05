import 'dart:io';

import 'package:daily_news/features/daily_news/data/data_source/local/app_database.dart';
import 'package:dio/dio.dart';
import 'package:daily_news/core/constants/constants.dart';
import 'package:daily_news/core/resources/data_state.dart';
import 'package:daily_news/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:daily_news/features/daily_news/data/models/article_model.dart';
import 'package:daily_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:daily_news/features/daily_news/domain/respository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  NewsApiService _newsApiService;
  AppDatabase _appDatabase;
  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusCode,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<void> deleteArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
