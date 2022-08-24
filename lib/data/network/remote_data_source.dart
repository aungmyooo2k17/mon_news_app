import 'package:flutter/material.dart';
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
  Future<String> getAuth();
  Future<List<TopicModel>> getTopics();
  Future<List<CategoryModel>> getCategories();
  Future<List<PostModel>> getPosts();
  Future<PostModel> getPostDetail(int postId);
  Future<List<PostModel>> getPostsByTopicId(int topicId, int page, int perPage);
  Future<List<CommentModel>> getCommentsByPostId(int postId);
  Future<int> postLike(String postId, String uuid);
  Future<int> deleteLike(int likeId);
  Future<int> getLikes(int postId, String uuid);
  Future<int> postComment(String postId, String comment, String uuid);

  Future<List<BookmarkModel>> getBookmarks(String uuid);

  Future<int> postBookmark(String postId, String uuid);
  Future<int> deleteBookmark(int id);

  Future<int> postCommentReport(int commentId, String reportReason);
  Future<int> postDonate(String name, String email, String phoneNumber);
  Future<int> postFeedback(
      String name, String email, String phoneNumber, String message);
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient apiClient;
  RemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<TopicModel>> getTopics() async {
    final response = await apiClient.get('api/topic',
        params: {"sort": "priority", "order": "desc", "rows": 100});

    final topics = TopicsResultModel.fromJson(response).topics;

    return topics ?? [];
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiClient.get('api/category',
        params: {"sort": "priority", "order": "desc", "rows": 100});

    final categories = CategoriesResultModel.fromJson(response).categories;
    return categories ?? [];
  }

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await apiClient
        .get('api/post', params: {"datatable": true, "page": 1, "rows": 100});

    final posts = PostsResultModel.fromJson(response).posts;

    return posts ?? [];
  }

  @override
  Future<List<PostModel>> getPostsByTopicId(
      int topicId, int page, int perPage) async {
    final response = await apiClient.get('api/post', params: {
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
        .get('api/comment', params: {"search": "post_id:equal:$postId"});

    final comments = CommentsResultModel.fromJson(response).comments;
    return comments ?? [];
  }

  @override
  Future<int> postLike(String postId, String uuid) async {
    final response = await apiClient
        .post(path: 'api/like', body: {"post_id": postId, "uuid": uuid});

    if (response != null) {
      return response["id"];
    }

    return 0;
  }

  @override
  Future<int> postComment(String postId, String comment, String uuid) async {
    final response = await apiClient.post(
        path: 'api/comment',
        body: {"post_id": postId, "comment": comment, "uuid": uuid});

    if (response != null) {
      return 1;
    }

    return 0;
  }

  @override
  Future<List<BookmarkModel>> getBookmarks(String uuid) async {
    final response = await apiClient
        .get('api/bookmark', params: {"search": "uuid:equal:$uuid"});

    final bookmarks = BookmarksResultModel.fromJson(response).bookmarks;

    return bookmarks ?? [];
  }

  @override
  Future<int> postBookmark(String postId, String uuid) async {
    final response = await apiClient
        .post(path: 'api/bookmark', body: {"post_id": postId, "uuid": uuid});

    if (response != null) {
      return response["id"];
    }

    return 0;
  }

  @override
  Future<int> deleteBookmark(int id) async {
    final response = await apiClient.delete(
      path: 'api/bookmark/$id',
    );

    if (response != null) {
      return 1;
    }

    return 0;
  }

  @override
  Future<PostModel> getPostDetail(int postId) async {
    final response = await apiClient.get('api/post/$postId');

    final post = PostModel.fromJsonDetail(response);

    return post;
  }

  @override
  Future<int> getLikes(int postId, String uuid) async {
    final response = await apiClient.get('api/like',
        params: {"search": "uuid:equal:$uuid|post_id:requal:$postId"});

    List resp = response as List;
    if (resp.isEmpty) {
      return 0;
    }

    return response[0]["id"];
  }

  @override
  Future<int> deleteLike(int likeId) async {
    final response = await apiClient.delete(
      path: 'api/like/$likeId',
    );

    if (response["code"] != 204) {
      return 1;
    }

    return 0;
  }

  @override
  Future<int> postCommentReport(int commentId, String reportReason) async {
    final response = await apiClient.post(
        path: 'api/report',
        body: {"comment_id": "$commentId", "report": reportReason});

    if (response["code"] != 200) {
      return 1;
    }

    return 0;
  }

  @override
  Future<int> postDonate(String name, String email, String phoneNumber) async {
    final response = await apiClient.post(
        path: 'api/donate',
        body: {"name": name, "email": email, "phone": phoneNumber});

    if (response["code"] != 200) {
      return 1;
    }

    return 0;
  }

  @override
  Future<int> postFeedback(
      String name, String email, String phoneNumber, String message) async {
    final response = await apiClient.post(path: 'api/feedback', body: {
      "name": name,
      "email": email,
      "phone": phoneNumber,
      "message": message
    });

    if (response["code"] != 200) {
      return 1;
    }

    return 0;
  }

  @override
  Future<String> getAuth() async {
    final response = await apiClient.post(path: 'oauth/token', body: {
      "grant_type": "client_credentials",
      "client_id": "3",
      "client_secret": "p9503GTT0QaeypbIrCNba2Gl3UtsTazwuejj2Yw2"
    });

    if (response["code"] != 200) {
      return response["access_token"];
    }

    return "";
  }
}
