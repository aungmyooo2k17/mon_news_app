import 'package:mon_news_app/data/local/models/thanlwintimes_db.dart';
import 'package:mon_news_app/data/network/models/bookmark_model.dart';

class BookmarkDtoMapper {
  List<BookmarkDtoData> fromResponse(List<BookmarkModel> models) {
    return models.map((e) => from(e)).toList();
  }

  BookmarkDtoData from(BookmarkModel model) {
    return BookmarkDtoData(
        id: model.id,
        postId: model.postId,
        uuid: model.uuid,
        audioUrl: model.postModel.audioUrl ?? "",
        videoUrl: model.postModel.videoUrl ?? "",
        banner: model.postModel.banner!.url,
        category: model.postModel.category!.name,
        content: model.postModel.content ?? "",
        title: model.postModel.title ?? "",
        topic: model.postModel.topic!.name ?? "",
        topicId: model.postModel.topic!.id!,
        bookmarkId: model.id);
  }
}
