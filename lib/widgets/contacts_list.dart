import 'package:flutter/material.dart';
import 'package:storye2/widgets/widgets.dart';

import '../models/models.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;

  const ContactsList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
              SizedBox(
                width: 8.0,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey,
              )
            ],
          ),
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              final User user = users[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: UserCard(user: user),
              );
            },
          ))
        ],
      ),
    );
  }
}
