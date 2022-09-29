class CommentEntity {
  final int id;
  final int postId;
  final String comment;
  final String uuid;
  final String? createdAt;

  CommentEntity(
      {required this.id,
      required this.postId,
      required this.comment,
      required this.uuid,
      this.createdAt});
}
