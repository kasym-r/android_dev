import 'package:android_dev/screens/home_screen/models/comment_model.dart';
import 'package:material_ui/material_ui.dart';

class CommentWidget extends StatelessWidget {
  final CommentModel comment;
  final VoidCallback onLike;

  const CommentWidget({super.key, required this.comment, required this.onLike});

  @override
  Widget build(BuildContext context) => ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(comment.avatarUrl)),
        title: Text(comment.username, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(comment.text),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: onLike,
              child: Icon(
                comment.isLiked ? Icons.favorite : Icons.favorite_border,
                color: comment.isLiked ? Colors.red : null,
                size: 20,
              ),
            ),
            Text('${comment.likeCount}', style: const TextStyle(fontSize: 12)),
          ],
        ),
      );
}
