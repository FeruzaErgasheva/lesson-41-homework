import 'package:flutter/material.dart';
import 'package:lesson_41/models/contact_model.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;
  final Function() onDelete;
  final Function() onEdit;

  ContactTile(this.contact,
      {super.key, required this.onDelete, required this.onEdit,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onEdit,
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete),
          )
        ],
      ),
      subtitle: Text(contact.phone),
      title: Text(contact.name),
      leading: CircleAvatar(
        backgroundColor: contact.color,
      ),
    );
  }
}
