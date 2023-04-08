import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:Facebook_Flutter_demo/config/palette.dart';
import 'package:Facebook_Flutter_demo/models/models.dart';
import 'package:Facebook_Flutter_demo/widgets/widgets.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
        margin: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: isDesktop ? 5.0 : 0.0,
        ),
        elevation: isDesktop ? 1.0 : 0.0,
        shape: isDesktop
            ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
            : null,
        child: Container(
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
            )));
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

  const _PostStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                size: 12.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              '${post.comments} Comments',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              '${post.shares} Shares',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: const Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey,
                size: 20.0,
              ),
              lable: 'Like',
              onTap: () => debugPrint('Like'),
            ),
            _PostButton(
              icon: const Icon(
                MdiIcons.commentOutline,
                color: Colors.grey,
                size: 20.0,
              ),
              lable: 'Comment',
              onTap: () => debugPrint('Comment'),
            ),
            _PostButton(
              icon: const Icon(
                MdiIcons.shareOutline,
                color: Colors.grey,
                size: 25.0,
              ),
              lable: 'Share',
              onTap: () => debugPrint('Share'),
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String lable;
  final Function() onTap;

  const _PostButton(
      {super.key,
      required this.icon,
      required this.lable,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 4.0,
                ),
                Text(lable),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
