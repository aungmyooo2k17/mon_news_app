class PostEntity {
  final int id;
  final String title;
  final String banner;
  final String? videoUrl;
  final String? audioUrl;
  final String content;
  final String topic;
  final String category;

  PostEntity(
      {required this.id,
      required this.title,
      required this.banner,
      required this.videoUrl,
      required this.audioUrl,
      required this.content,
      required this.topic,
      required this.category});
}
