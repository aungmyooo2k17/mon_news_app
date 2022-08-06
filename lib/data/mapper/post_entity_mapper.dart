import 'package:mon_news_app/domain/post_entity.dart';

import '../local/models/thanlwintimes_db.dart';
import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically

class PostEntityMapper {
  List<PostEntity> tos(
      List<PostDtoData> dtos, List<BookmarkDtoData> bookmarkDtos) {
    return dtos.map((e) => to(e, bookmarkDtos)).toList();
  }

  PostEntity to(PostDtoData dto, List<BookmarkDtoData> bookmarkDtos) {
    return PostEntity(
        id: dto.id,
        title: dto.title,
        videoUrl: dto.videoUrl,
        content: dto.content,
        topic: dto.topic,
        banner: dto.banner,
        category: dto.category,
        audioUrl: dto.audioUrl,
        isBookMark: bookmarkDtos
                    .firstWhereOrNull((element) => element.postId == dto.id) !=
                null
            ? true
            : false,
        bookmarkId: bookmarkDtos
            .firstWhereOrNull((element) => element.postId == dto.id)
            ?.bookmarkId);
  }

  PostEntity toDetail(
      PostDtoData dto, List<BookmarkDtoData> bookmarkDtos, int likeResponse) {
    return PostEntity(
        shareLink: dto.shareLink,
        id: dto.id,
        title: dto.title,
        videoUrl: dto.videoUrl,
        content: dto.content,
        topic: dto.topic,
        banner: dto.banner,
        category: dto.category,
        audioUrl: dto.audioUrl,
        isBookMark: bookmarkDtos
                    .firstWhereOrNull((element) => element.postId == dto.id) !=
                null
            ? true
            : false,
        bookmarkId: bookmarkDtos
            .firstWhereOrNull((element) => element.postId == dto.id)
            ?.bookmarkId,
        views: dto.views,
        likes: dto.likes,
        comments: dto.comments,
        isliked: likeResponse == 0 ? false : true,
        likeId: likeResponse);
  }
}
