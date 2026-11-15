class StoryModel {
  final String id;
  final String username;
  final String imageUrl;
  final bool isViewed;

  const StoryModel({
    required this.id,
    required this.username,
    required this.imageUrl,
    this.isViewed = false,
  });

  StoryModel copyWith({bool? isViewed}) => StoryModel(
        id: id,
        username: username,
        imageUrl: imageUrl,
        isViewed: isViewed ?? this.isViewed,
      );
}
