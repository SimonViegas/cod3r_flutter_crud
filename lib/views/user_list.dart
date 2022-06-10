import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:provider/provider.dart';
import '../provider/users.dart';
import '../routes/routes.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final users = {...DUMMY_USERS};
    //final users = Provider.of<Users>(context, listen: false); //caso queira ignorar a atualização
    final users = Provider.of<Users>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
