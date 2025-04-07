import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/user_view_model.dart';


class UserListView extends StatelessWidget {

  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {

    final viewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Utilisateurs')),
      body: viewModel.isLoading ?
      Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: viewModel.users.length,
        itemBuilder: (context, index) {
          final user = viewModel.users[index];
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.fetchUsers(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}