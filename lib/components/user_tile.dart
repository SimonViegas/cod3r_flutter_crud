import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:provider/provider.dart';

import '../provider/users.dart';
import '../routes/routes.dart';

class UserTile extends StatelessWidget {
  final User? user;

  const UserTile(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = user!.avatarUrl.isEmpty
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user!.avatarUrl),
          );
    return ListTile(
      leading: avatar,
      title: Text(user!.name),
      subtitle: Text(user!.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir usuário'),
                    content: const Text('Tem certeza???'),
                    actions: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: const Text('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: const Text('Sim'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                ).then((confirmed) => {
                      if (confirmed)
                        {
                          Provider.of<Users>(context, listen: false)
                              .remove(user),
                        }
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
