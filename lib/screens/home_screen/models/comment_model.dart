class CommentModel {
  final String username;
  final String avatarUrl;
  final String text;
  final int likeCount;
  final bool isLiked;

  const CommentModel({
    required this.username,
    required this.avatarUrl,
    required this.text,
    this.likeCount = 0,
    this.isLiked = false,
  });

  CommentModel copyWith({int? likeCount, bool? isLiked}) => CommentModel(
        username: username,
        avatarUrl: avatarUrl,
        text: text,
        likeCount: likeCount ?? this.likeCount,
        isLiked: isLiked ?? this.isLiked,
      );
}
