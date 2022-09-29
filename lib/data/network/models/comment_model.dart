class CommentModel {
  final int id;
  final int postId;
  final String comment;
  final String uuid;
  final String createdAt;

  CommentModel(
      {required this.id,
      required this.postId,
      required this.comment,
      required this.uuid,
      required this.createdAt});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
        id: json['id'],
        postId: json['post_id'],
        comment: json['comment'],
        uuid: json['uuid'],
        createdAt: json['created_at']);
  }
}
