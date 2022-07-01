class CommentEntity {
  final int id;
  final int postId;
  final String comment;
  final String uuid;

  CommentEntity(
      {required this.id,
      required this.postId,
      required this.comment,
      required this.uuid});
}
