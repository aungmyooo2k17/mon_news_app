import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_news_app/data/mapper/bookmark_dto_mapper.dart';
import 'package:mon_news_app/data/mapper/bookmark_entity_mapper.dart';
import 'package:mon_news_app/data/mapper/category_dto_mapper.dart';
import 'package:mon_news_app/data/network/models/bookmark_model.dart';
import 'package:mon_news_app/domain/bookmark_entity.dart';
import 'package:mon_news_app/domain/comment_entity.dart';

import '../domain/category_entity.dart';
import '../domain/post_entity.dart';
import '../domain/topic_entity.dart';
import 'local/local_datasource.dart';
import 'mapper/category_entity_mapper.dart';
import 'mapper/comment_dto_mapper.dart';
import 'mapper/comment_entity_mapper.dart';
import 'mapper/post_dto_mapper.dart';
import 'mapper/post_entity_mapper.dart';
import 'mapper/topic_dto_mapper.dart';
import 'mapper/topic_entity_mapper.dart';
import 'network/remote_data_source.dart';

abstract class AppRepo {
  Future<List<TopicEntity>> getTopics();
  Future<List<CategoryEntity>> getCategories();
  Future<List<PostEntity>> getPosts();
  Future<List<PostEntity>> getPostsByTopicId(
      int topicId, int page, int perPage);

  Future<int> insertBookmark(String postId, String uuid);
  Future<List<BookmarkEntity>> getBookmarksById(String id);
  Future<int> deleteBookmark(int id);

  Future<List<CommentEntity>> getCommentByPostId(int id);
  Future<int> postLike(String postId, String uuid);
  Future<int> postComment(String postId, String comment, String uuid);
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

  final CommentDtoMapper commentDtoMapper = CommentDtoMapper();
  final CommentEntityMapper commentEntityMapper = CommentEntityMapper();

  final BookmarkEntityMapper bookmarkEntityMapper = BookmarkEntityMapper();
  final BookmarkDtoMapper bookmarkDtoMapper = BookmarkDtoMapper();

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
  Future<List<PostEntity>> getPostsByTopicId(
      int topicId, int page, int perPage) async {
    final response =
        await remoteDataSource.getPostsByTopicId(topicId, page, perPage);
    await localDatasource.insertAllPosts(postDtoMapper.fromResponse(response));

    final dbResult = await localDatasource.getAllPostsByTopicId(
        topicId, perPage, (page - 1) * perPage);
    return postEntityMapper.tos(dbResult);
  }

  @override
  Future<int> insertBookmark(String postId, String uuid) async {
    final response = await remoteDataSource.postBookmark(postId, uuid);
    return response;
  }

  // @override
  // Future<List<BookmarkEntity>> getBookmarks() async {
  //   final response = await remoteDataSource.getBookmarks();
  //   await localDatasource
  //       .insertAllBookmarks(bookmarkDtoMapper.fromResponse(response));

  //   final dbResult = await localDatasource.getAllBookmark();
  //   return bookmarkEntityMapper.tos(dbResult);
  // }

  @override
  Future<int> deleteBookmark(int id) async {
    final response = await remoteDataSource.deleteBookmark(id);
    return response;
  }

  @override
  Future<List<BookmarkEntity>> getBookmarksById(String id) async {
    final response = await remoteDataSource.getBookmarks(id);
    await localDatasource
        .insertAllBookmarks(bookmarkDtoMapper.fromResponse(response));

    final dbResult = await localDatasource.getAllBookmarkByUuid(id);
    return bookmarkEntityMapper.tos(dbResult);
  }

  @override
  Future<List<CommentEntity>> getCommentByPostId(int id) async {
    final response = await remoteDataSource.getCommentsByPostId(id);
    await localDatasource
        .insertComment(commentDtoMapper.fromResponse(response));

    final dbResult = await localDatasource.getCommentByPostId(id);
    return commentEntityMapper.tos(dbResult);
  }

  @override
  Future<int> postLike(String postId, String uuid) async {
    final response = await remoteDataSource.postLike(postId, uuid);

    return response;
  }

  @override
  Future<int> postComment(String postId, String comment, String uuid) async {
    final response = await remoteDataSource.postComment(postId, comment, uuid);

    return response;
  }
}
