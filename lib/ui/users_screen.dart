import 'package:flutter/material.dart';
import 'package:provider_part_one/data/models/cached_user_model.dart';
import 'package:provider_part_one/view_model/cached_user_view_model.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<CachedUserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users in DB"),
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: List.generate(viewModel.cachedUsers.length, (index) {
                var item = viewModel.cachedUsers[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.id.toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      viewModel.deleteUserAndUpdateDB(item.id!);
                    },
                  ),
                );
              }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CachedUser cachedUser = CachedUser(
            id: null,
            age: 21,
            name: "David",
            count: 100,
          );
          viewModel.insertUserAndUpdateDB(cachedUser);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
