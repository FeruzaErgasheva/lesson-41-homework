import 'package:flutter/material.dart';
import 'package:lesson_41/controllers/contacts_controller.dart';
import 'package:lesson_41/models/contact_model.dart';
import 'package:lesson_41/views/widgets/contact_tile.dart';
import 'package:lesson_41/views/widgets/dialogbox.dart';
import 'package:lesson_41/views/widgets/editdialogbox.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final ContactsController contactsController = ContactsController();

  void delete(int index) {
    setState(() {
      contactsController.delete(index);
    });
  }

  Future<void> showialog() async {
    Map<String, dynamic>? data = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return DialogBox();
      },
    );
    if (data != null) {
      contactsController.add(data['name'], data["phone"]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showialog,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: contactsController.list.length,
        itemBuilder: (context, index) {
          return ContactTile(
            contactsController.list[index],
            onDelete: () {
              delete(index);
            },
            onEdit: () async {
              Contact? editedContact = await showDialog(
                context: context,
                builder: (context) =>
                    EditDialogBox(contact: contactsController.list[index]),
              );
              if (editedContact != null) {
                contactsController.edit(
                    index, editedContact.name, editedContact.phone);
                setState(() {});
              }
            },
          );
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contacts"),
      ),
    );
  }
}
