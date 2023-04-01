import 'package:flutter/material.dart';
import 'package:storye2/widgets/profile_avatar.dart';

import '../models/user_model.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    super.key,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children:  [
              ProfileAvatar(imageUrl: currentUser.imageUrl,)
              ,
              const SizedBox(
                width: 8.0,
              ),
              const Expanded(
                child: TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: 'Whats on your mind?'),
                ),
              ),
            ],
          ),
          const Divider(height: 10.0, thickness: 0.5),
          SizedBox(height: 40.0,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                  onPressed: () => debugPrint('Live'),
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: const Text('Live')),
              const VerticalDivider(width: 8.0,),
              TextButton.icon(
                  onPressed: () => debugPrint('Photo'),
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: const Text('Photo')),
              const VerticalDivider(width: 8.0,),
              TextButton.icon(
                  onPressed: () => debugPrint('Room'),
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.red,
                  ),
                  label: const Text('Room')),
              const VerticalDivider(width: 8.0,),

            ],
          ))
        ],
      ),
    );
  }
}
