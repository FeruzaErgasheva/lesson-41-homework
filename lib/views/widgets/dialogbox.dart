import 'package:flutter/material.dart';

class DialogBox extends StatefulWidget {
  // final nameController;
  // final phoneController;

  DialogBox({
    super.key,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  final _formKey = GlobalKey<FormState>();

  String name = '';

  String phone = "";

  void _add() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context, {"name": name, "phone": phone});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[200],
      content: Container(
        height: 300,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "New Contact",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                onSaved: (newValue) {
                  if (newValue != null) {
                    name = newValue;
                  }
                },
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Iltimos ism kiriting";
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Name",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                // controller: widget.nameController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (newValue) {
                  if (newValue != null) {
                    phone = newValue;
                  }
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Iltimos telefon raqam kiriting";
                  } else if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
                    return "Iltimos to'g'ri telefon raqam kiriting";
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add),
                  hintText: "Phone number",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                // controller: widget.phoneController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.deepPurple),
                        foregroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: _add,
                      child: const Text("Save")),
                  TextButton(
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.deepPurple),
                        foregroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
