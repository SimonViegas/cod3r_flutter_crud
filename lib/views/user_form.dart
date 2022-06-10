import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../provider/users.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Formulário de Usuário'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState?.validate();
                if (isValid == true) {
                  _form.currentState?.validate();
                  _form.currentState?.save();
                  Provider.of<Users>(context, listen: false).put(User(
                    id: _formData['id'],
                    name: _formData['name']!,
                    email: _formData['email']!,
                    avatarUrl: _formData['avatarUrl']!,
                  ));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nome inválido';
                    }

                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'E-mail inválido';
                    }

                    return null;
                  },
                  onSaved: (value) => _formData['email'] = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'URL do Avatar'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['avatarUrl'] = value!,
                ),
              ],
            ),
          ),
        ));
  }
}
