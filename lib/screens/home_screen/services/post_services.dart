import 'package:android_dev/screens/home_screen/models/post_model.dart';
import 'package:android_dev/screens/home_screen/models/story_model.dart';

class PostServices {
  final List<PostModel> posts = [];

  final List<StoryModel> stories = const [
    StoryModel(id: 's1', username: 'alex', imageUrl: 'https://i.pravatar.cc/100?u=alex'),
    StoryModel(id: 's2', username: 'sara', imageUrl: 'https://i.pravatar.cc/100?u=sara'),
    StoryModel(id: 's3', username: 'kate', imageUrl: 'https://i.pravatar.cc/100?u=kate'),
    StoryModel(id: 's4', username: 'dan', imageUrl: 'https://i.pravatar.cc/100?u=dan'),
    StoryModel(id: 's5', username: 'olga', imageUrl: 'https://i.pravatar.cc/100?u=olga'),
    StoryModel(id: 's6', username: 'nick', imageUrl: 'https://i.pravatar.cc/100?u=nick'),
    StoryModel(id: 's7', username: 'ivan', imageUrl: 'https://i.pravatar.cc/100?u=ivan'),
    StoryModel(id: 's8', username: 'anna', imageUrl: 'https://i.pravatar.cc/100?u=anna'),
  ];

  PostServices();

  void addPost(PostModel post) {
    posts.add(post);
  }

  void batchAddPosts(List<PostModel> newPosts) {
    posts.addAll(newPosts);
  }
}
