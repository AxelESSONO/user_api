import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_api/view/user_list_view.dart';
import 'package:user_api/viewmodel/user_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserViewModel(),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserListView(),
    );
  }
}