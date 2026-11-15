import 'package:android_dev/screens/content/post_widget.dart';
import 'package:android_dev/screens/home_screen/state/feed_controller.dart';
import 'package:android_dev/screens/home_screen/widgets/story_widget.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(feedControllerProvider);
    final stories = ref.watch(storiesControllerProvider);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text('Instagram')),
      body: Column(
        children: [
          // Stories under the appbar
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: stories.length,
              itemBuilder: (context, index) => StoryWidget(
                story: stories[index],
                onTap: () => ref.read(storiesControllerProvider.notifier).markViewed(stories[index].id),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(4),
                child: PostWidget(
                  post: posts[index],
                  onLike: () => ref.read(feedControllerProvider.notifier).toggleLike(posts[index].id),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
