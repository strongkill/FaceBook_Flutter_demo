import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:storye2/models/models.dart';
import 'package:storye2/widgets/profile_avatar.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 6.0),
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(imageUrl: post.imageUrl),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(post: post),
            )
          ],
        ));
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8.0),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.user.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Column(
              children: [
                Text(post.user.name),
                Row(
                  children: [
                    Text(
                      '${post.timeAgo} : ',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.0,
                      ),
                    ),
                    Icon(
                      Icons.public,
                      color: Colors.grey[600],
                      size: 12.0,
                    )
                  ],
                )
              ],
            ),
          ],
        )),
        IconButton(
          onPressed: () => {debugPrint('More')},
          icon: const Icon(Icons.more_horiz),
        )
      ],
    );
  }
}


class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    super.key,
    required this.post
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [],
        )
      ],
    );
  }

}