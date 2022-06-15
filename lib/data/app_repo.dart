import 'package:injectable/injectable.dart';
import 'package:mon_news_app/data/mapper/category_dto_mapper.dart';

import '../domain/category_entity.dart';
import '../domain/post_entity.dart';
import '../domain/topic_entity.dart';
import 'local/local_datasource.dart';
import 'mapper/category_entity_mapper.dart';
import 'mapper/post_dto_mapper.dart';
import 'mapper/post_entity_mapper.dart';
import 'mapper/topic_dto_mapper.dart';
import 'mapper/topic_entity_mapper.dart';
import 'network/remote_data_source.dart';

abstract class AppRepo {
  Future<List<TopicEntity>> getTopics();
  Future<List<CategoryEntity>> getCategories();
  Future<List<PostEntity>> getPosts();
  Future<List<PostEntity>> getPostsByTopicId(int topicId);
}

@LazySingleton(as: AppRepo)
class AppRepoImpl implements AppRepo {
  final RemoteDataSource remoteDataSource;
  final LocalDatasource localDatasource;

  final TopicDtoMapper movieDtoMapper = TopicDtoMapper();
  final TopicEntityMapper movieEntityMapper = TopicEntityMapper();

  final CategoryDtoMapper categoryDtoMapper = CategoryDtoMapper();
  final CategoryEntityMapper categoryEntityMapper = CategoryEntityMapper();

  final PostDtoMapper postDtoMapper = PostDtoMapper();
  final PostEntityMapper postEntityMapper = PostEntityMapper();

  AppRepoImpl({required this.localDatasource, required this.remoteDataSource});

  @override
  Future<List<TopicEntity>> getTopics() async {
    final response = await remoteDataSource.getTopics();
    await localDatasource
        .insertAllTopics(movieDtoMapper.fromResponse(response));

    final dbResult = await localDatasource.getAllTopics();
    return movieEntityMapper.tos(dbResult);
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final response = await remoteDataSource.getCategories();
    await localDatasource
        .insertAllCategories(categoryDtoMapper.fromResponse(response));

    final dbResult = await localDatasource.getAllCategories();
    return categoryEntityMapper.tos(dbResult);
  }

  @override
  Future<List<PostEntity>> getPosts() async {
    final response = await remoteDataSource.getPosts();
    await localDatasource.insertAllPosts(postDtoMapper.fromResponse(response));

    final dbResult = await localDatasource.getAllPosts();
    return postEntityMapper.tos(dbResult);
  }

  @override
  Future<List<PostEntity>> getPostsByTopicId(int topicId) async {
    final response = await remoteDataSource.getPostsByTopicId(topicId);
    await localDatasource.insertAllPosts(postDtoMapper.fromResponse(response));

    final dbResult = await localDatasource.getAllPostsByTopicId(topicId);
    return postEntityMapper.tos(dbResult);
  }
}
