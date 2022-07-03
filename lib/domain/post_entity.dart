class PostEntity {
  final int id;
  final String title;
  final String banner;
  final String? videoUrl;
  final String? audioUrl;
  final String content;
  final String topic;
  final String category;
  final int? comments;
  final int? views;
  final int? likes;
  final bool isBookMark;
  final int? bookmarkId;

  const PostEntity(
      {required this.id,
      required this.title,
      required this.banner,
      required this.videoUrl,
      required this.audioUrl,
      required this.content,
      required this.topic,
      this.comments,
      this.views,
      this.likes,
      required this.category,
      required this.isBookMark,
      this.bookmarkId});

  PostEntity copy(
      {String? title,
      String? banner,
      String? videoUrl,
      String? audioUrl,
      String? content,
      String? topic,
      String? category,
      int? comments,
      int? views,
      int? likes,
      bool? isBookmark,
      int? bookmarkId}) {
    return PostEntity(
        id: id,
        title: title ?? this.title,
        banner: banner ?? this.banner,
        videoUrl: videoUrl ?? this.videoUrl,
        audioUrl: audioUrl ?? this.audioUrl,
        content: content ?? this.content,
        comments: comments ?? this.comments,
        views: views ?? this.views,
        likes: likes ?? this.likes,
        topic: topic ?? this.topic,
        category: category ?? this.category,
        isBookMark: isBookmark ?? isBookMark,
        bookmarkId: bookmarkId ?? this.bookmarkId);
  }
}
