import 'package:injectable/injectable.dart';
import 'package:mon_news_app/data/network/api_service.dart';
import 'package:mon_news_app/data/network/models/post_model.dart';
import 'package:mon_news_app/data/network/models/posts_result_model.dart';
import 'package:mon_news_app/data/network/models/topic_model.dart';
import 'package:mon_news_app/data/network/models/topics_result_model.dart';

import 'models/categories_result_model.dart';
import 'models/category_model.dart';

abstract class RemoteDataSource {
  Future<List<TopicModel>> getTopics();
  Future<List<CategoryModel>> getCategories();
  Future<List<PostModel>> getPosts();
  Future<List<PostModel>> getPostsByTopicId(int topicId);
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient apiClient;
  RemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<TopicModel>> getTopics() async {
    final response = await apiClient.get('topic',
        params: {"sort": "priority", "order": "desc", "rows": 100});

    final topics = TopicsResultModel.fromJson(response).topics;

    return topics ?? [];
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiClient.get('category',
        params: {"sort": "priority", "order": "desc", "rows": 100});

    final categories = CategoriesResultModel.fromJson(response).categories;
    return categories ?? [];
  }

  @override
  Future<List<PostModel>> getPosts() async {
    final response =
        await apiClient.get('post', params: {"page": 1, "rows": 100});

    final posts = PostsResultModel.fromJson(response).posts;

    return posts ?? [];
  }

  @override
  Future<List<PostModel>> getPostsByTopicId(int topicId) async {
    final response = await apiClient
        .get('post', params: {"search": "topic_id:equal:$topicId"});
    print(response);
    print("***********");
    final posts = PostsResultModel.fromJson(response).posts;
    print("___________");
    return posts ?? [];
  }
}
