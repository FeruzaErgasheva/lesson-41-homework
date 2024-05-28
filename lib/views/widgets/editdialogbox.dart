import 'package:flutter/material.dart';
import 'package:lesson_41/models/contact_model.dart';

class EditDialogBox extends StatefulWidget {
  Contact contact;
  EditDialogBox({super.key, required this.contact});

  @override
  State<EditDialogBox> createState() => _EditDialogBoxState();
}

class _EditDialogBoxState extends State<EditDialogBox> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  _saveChanges() {
    if (name.text.isNotEmpty && phone.text.isNotEmpty) {
      Navigator.pop(context, Contact(name: name.text, phone: phone.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple,
      content: Container(
        height: 300,
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(hintText: widget.contact.name),
            ),
            TextField(
              controller: phone,
              decoration: InputDecoration(hintText: widget.contact.phone),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: _saveChanges,
                  child: const Text(
                    "Save changes",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
