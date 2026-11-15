import 'package:android_dev/screens/home_screen/models/story_model.dart';
import 'package:material_ui/material_ui.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel story;
  final VoidCallback onTap;

  const StoryWidget({super.key, required this.story, required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            children: [
              // Ring around the avatar: pink, gray once viewed
              CircleAvatar(
                radius: 34,
                backgroundColor: story.isViewed ? Colors.grey : Colors.pink,
                child: CircleAvatar(
                  radius: 31,
                  backgroundImage: NetworkImage(story.imageUrl),
                ),
              ),
              const SizedBox(height: 4),
              Text(story.username, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      );
}
