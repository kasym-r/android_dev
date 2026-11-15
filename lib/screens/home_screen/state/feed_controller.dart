import 'package:android_dev/data/posts_data.dart';
import 'package:android_dev/screens/home_screen/models/post_model.dart';
import 'package:android_dev/screens/home_screen/models/story_model.dart';
import 'package:android_dev/screens/home_screen/services/post_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postServicesProvider = Provider<PostServices>((ref) {
  final services = PostServices();
  services.batchAddPosts(postsData);
  return services;
});

class FeedController extends Notifier<List<PostModel>> {
  @override
  List<PostModel> build() => ref.watch(postServicesProvider).posts;

  void toggleLike(String id) {
    state = [
      for (final post in state)
        if (post.id == id)
          post.copyWith(
            isLiked: !post.isLiked,
            likeCount: post.likeCount + (post.isLiked ? -1 : 1),
          )
        else
          post,
    ];
  }

  void toggleCommentLike(String postId, int commentIndex) {
    state = [
      for (final post in state)
        if (post.id == postId)
          post.copyWith(comments: [
            for (var i = 0; i < post.comments.length; i++)
              if (i == commentIndex)
                post.comments[i].copyWith(
                  isLiked: !post.comments[i].isLiked,
                  likeCount: post.comments[i].likeCount + (post.comments[i].isLiked ? -1 : 1),
                )
              else
                post.comments[i],
          ])
        else
          post,
    ];
  }
}

final feedControllerProvider =
    NotifierProvider<FeedController, List<PostModel>>(FeedController.new);

class StoriesController extends Notifier<List<StoryModel>> {
  @override
  List<StoryModel> build() => ref.watch(postServicesProvider).stories;

  void markViewed(String id) {
    state = [
      for (final story in state)
        if (story.id == id) story.copyWith(isViewed: true) else story,
    ];
  }
}

final storiesControllerProvider =
    NotifierProvider<StoriesController, List<StoryModel>>(StoriesController.new);
