class BookmarkEntity {
  final int id;
  final int postId;
  final String uuid;
  final String audioUrl;
  final String videoUrl;
  final String banner;
  final String category;
  final String content;
  final String title;
  final String topic;
  final int topicId;
  final String publishedAt;

  BookmarkEntity(
      {required this.id,
      required this.postId,
      required this.uuid,
      required this.audioUrl,
      required this.videoUrl,
      required this.banner,
      required this.category,
      required this.content,
      required this.title,
      required this.topic,
      required this.topicId,
      required this.publishedAt});
}
