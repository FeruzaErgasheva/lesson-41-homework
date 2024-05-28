import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lesson_41/models/contact_model.dart';

class ContactsController {
  final List<Contact> _list = [
    Contact(name: "Feruza", phone: "+998993030917", color: Colors.red),
    Contact(name: "Muslima", phone: "+998973980917", color: Colors.blue),
    Contact(name: "Bob", phone: "+998993030917", color: Colors.yellow),
    Contact(name: "Sally", phone: "+998993030917"),
    Contact(name: "Mike", phone: "+998993030917"),
  ];
  List<Contact> get list {
    return [..._list];
  }

  void delete(int index) {
    _list.removeAt(index);
  }

  void add(String name, String phone) {
    int red = Random().nextInt(255);
    int green = Random().nextInt(255);
    int blue = Random().nextInt(255);

    _list.add(Contact(name: name, phone: phone));
  }

  void edit(int index, String name, String phone){
    _list[index].name=name;
    _list[index].phone=phone;
  }
}
