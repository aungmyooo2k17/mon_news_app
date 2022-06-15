import 'package:injectable/injectable.dart';
import 'package:mon_news_app/data/local/posts_dao.dart';

import 'models/thanlwintimes_db.dart';
import 'topics_dao.dart';
import 'categories_dao.dart';

abstract class LocalDatasource {
  Future<void> insertAllTopics(List<TopicDtoData> topics);
  Future<List<TopicDtoData>> getAllTopics();

  Future<void> insertAllCategories(List<CategoryDtoData> topics);
  Future<List<CategoryDtoData>> getAllCategories();

  Future<void> insertAllPosts(List<PostDtoData> topics);
  Future<List<PostDtoData>> getAllPosts();
  Future<List<PostDtoData>> getAllPostsByTopicId(int topicId);
}

@LazySingleton(as: LocalDatasource)
class LocalDatasourceImpl implements LocalDatasource {
  final TopicsDao topicsDao;
  final CategoriesDao categoriesDao;
  final PostsDao postsDao;

  LocalDatasourceImpl(
      {required this.topicsDao,
      required this.categoriesDao,
      required this.postsDao});

  @override
  Future<void> insertAllTopics(List<TopicDtoData> topics) async {
    await topicsDao.insertAllTopics(topics);
  }

  @override
  Future<List<TopicDtoData>> getAllTopics() async {
    return await topicsDao.fetchAllTopics();
  }

  @override
  Future<List<CategoryDtoData>> getAllCategories() async {
    return await categoriesDao.fetchAllCategories();
  }

  @override
  Future<void> insertAllCategories(List<CategoryDtoData> categories) async {
    await categoriesDao.insertAllCategories(categories);
  }

  @override
  Future<List<PostDtoData>> getAllPosts() async {
    return await postsDao.fetchAllPosts();
  }

  @override
  Future<void> insertAllPosts(List<PostDtoData> topics) async {
    await postsDao.insertAllPosts(topics);
  }

  @override
  Future<List<PostDtoData>> getAllPostsByTopicId(int topicId) async {
    return await postsDao.fetchAllPostsByTopicId(topicId);
  }
}
