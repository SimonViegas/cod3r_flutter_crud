import 'package:flutter/material.dart';
import '../data/dummy_users.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const users = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuários'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Center(
              child: Text('Usuário ${users.values.elementAt(index).name}'));
        },
      ),
    );
  }
}
