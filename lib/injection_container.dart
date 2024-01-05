import 'package:daily_news/features/daily_news/data/data_source/local/app_database.dart';
import 'package:daily_news/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:daily_news/features/daily_news/data/repository/article_repository_imp.dart';
import 'package:daily_news/features/daily_news/domain/respository/article_repository.dart';
import 'package:daily_news/features/daily_news/domain/usecase/delete_article_usecase.dart';
import 'package:daily_news/features/daily_news/domain/usecase/get_article_usecase.dart';
import 'package:daily_news/features/daily_news/domain/usecase/get_saved_article_usecase.dart';
import 'package:daily_news/features/daily_news/domain/usecase/save_article_usecase.dart';
import 'package:daily_news/features/daily_news/presentation/bloc/local/local_article_bloc.dart';
import 'package:daily_news/features/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final s1 = GetIt.instance;

Future<void> initializeDependency() async {
  // Register every thing here you passed in the constructor like Foo(this._dio)

  // Local DataBase
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  s1.registerSingleton<AppDatabase>(database);

  // Dio
  s1.registerSingleton<Dio>(Dio());

  // Dependencies ----------------
  s1.registerSingleton<NewsApiService>(NewsApiService(s1())); // s1<Dio>

  s1.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(s1(), s1())); // NewsApiService, AppDataBase

  // UseCase ----------------------
  s1.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(s1())); // ArticleRepository

  s1.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(s1()));

  s1.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(s1()));

  s1.registerSingleton<DeleteArticleUseCase>(DeleteArticleUseCase(s1()));

  // Blocs ------------------------
  s1.registerSingleton<RemoteArticleBloc>(
      RemoteArticleBloc(s1())); // GetArticleRepository

  s1.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(s1(), s1(), s1()));
}
