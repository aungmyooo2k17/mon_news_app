import 'package:injectable/injectable.dart';
import 'package:mon_news_app/data/network/api_service.dart';
import 'package:mon_news_app/data/network/models/bookmark_model.dart';
import 'package:mon_news_app/data/network/models/bookmarks_result_model.dart';
import 'package:mon_news_app/data/network/models/comment_model.dart';
import 'package:mon_news_app/data/network/models/comment_result_model.dart';
import 'package:mon_news_app/data/network/models/post_model.dart';
import 'package:mon_news_app/data/network/models/posts_result_model.dart';
import 'package:mon_news_app/data/network/models/topic_model.dart';
import 'package:mon_news_app/data/network/models/topics_result_model.dart';
import 'package:mon_news_app/domain/bookmark_entity.dart';

import 'models/categories_result_model.dart';
import 'models/category_model.dart';

abstract class RemoteDataSource {
  Future<List<TopicModel>> getTopics();
  Future<List<CategoryModel>> getCategories();
  Future<List<PostModel>> getPosts();
  Future<PostModel> getPostDetail(int postId);
  Future<List<PostModel>> getPostsByTopicId(int topicId, int page, int perPage);
  Future<List<CommentModel>> getCommentsByPostId(int postId);
  Future<int> postLike(String postId, String uuid);
  Future<int> postComment(String postId, String comment, String uuid);

  Future<List<BookmarkModel>> getBookmarks(String uuid);

  Future<int> postBookmark(String postId, String uuid);
  Future<int> deleteBookmark(int id);
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
    final response = await apiClient
        .get('post', params: {"datatable": true, "page": 1, "rows": 100});

    final posts = PostsResultModel.fromJson(response).posts;

    return posts ?? [];
  }

  @override
  Future<List<PostModel>> getPostsByTopicId(
      int topicId, int page, int perPage) async {
    final response = await apiClient.get('post', params: {
      "datatable": true,
      "page": page,
      "rows": perPage,
      "search": "topic_id:equal:$topicId"
    });

    final posts = PostsResultModel.fromJson(response).posts;

    return posts ?? [];
  }

  @override
  Future<List<CommentModel>> getCommentsByPostId(int postId) async {
    final response = await apiClient
        .get('comment', params: {"search": "post_id:equal:$postId"});

    final comments = CommentsResultModel.fromJson(response).comments;
    return comments ?? [];
  }

  @override
  Future<int> postLike(String postId, String uuid) async {
    final response = await apiClient
        .post(path: 'like', body: {"post_id": postId, "uuid": uuid});

    if (response != null) {
      return 1;
    }

    return 0;
  }

  @override
  Future<int> postComment(String postId, String comment, String uuid) async {
    final response = await apiClient.post(
        path: 'comment',
        body: {"post_id": postId, "comment": comment, "uuid": uuid});

    if (response != null) {
      return 1;
    }

    return 0;
  }

  @override
  Future<List<BookmarkModel>> getBookmarks(String uuid) async {
    final response = await apiClient.get('bookmark',
        params: {"search": "uuid:equal:$uuid", "page": 1, "rows": 100});

    final bookmarks = BookmarksResultModel.fromJson(response).bookmarks;

    return bookmarks ?? [];
  }

  @override
  Future<int> postBookmark(String postId, String uuid) async {
    final response = await apiClient
        .post(path: 'bookmark', body: {"post_id": postId, "uuid": uuid});

    if (response != null) {
      return response["id"];
    }

    return 0;
  }

  @override
  Future<int> deleteBookmark(int id) async {
    final response = await apiClient.delete(
      path: 'bookmark/$id',
    );

    if (response != null) {
      return 1;
    }

    return 0;
  }

  @override
  Future<PostModel> getPostDetail(int postId) async {
    final response = await apiClient.get('post/$postId');

    final post = PostModel.fromJsonDetail(response);

    return post;
  }
}
