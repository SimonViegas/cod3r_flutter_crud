import 'package:flutter/material.dart';
import 'package:flutter_crud/views/user_list.dart';
import 'package:provider/provider.dart';
import 'provider/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tanto faz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UserList(),
      ),
    );
  }
}
