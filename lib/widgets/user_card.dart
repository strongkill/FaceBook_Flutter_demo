import 'package:flutter/material.dart';
import 'package:storye2/widgets/profile_avatar.dart';

import '../models/models.dart';

class UserCard extends StatelessWidget{
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileAvatar(imageUrl: user.imageUrl),
        const SizedBox(width: 6.0,),
        Text(
          user.name,
          style: const TextStyle(fontSize: 16.0),
        )
      ],
    );
  }

}