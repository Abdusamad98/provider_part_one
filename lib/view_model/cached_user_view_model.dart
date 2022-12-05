import 'package:flutter/cupertino.dart';
import 'package:provider_part_one/data/models/cached_user_model.dart';
import 'package:provider_part_one/data/repositories/my_repository.dart';

class CachedUserViewModel extends ChangeNotifier {
  CachedUserViewModel({required MyRepository myRepository}) {
    _myRepository = myRepository;
    fetchUsersFromDB();
  }

  bool isLoading = false;
  late MyRepository _myRepository;

  List<CachedUser> cachedUsers = [];

  fetchUsersFromDB() async {
    notify(true);
    cachedUsers = await _myRepository.getAllUsers();
    notify(false);
  }

  insertUserAndUpdateDB(CachedUser cachedUser) async {
    notify(true);
    CachedUser savedUser = await _myRepository.insertUser(cachedUser);
    if (savedUser.id != null) {
      cachedUsers.add(savedUser);
      notifyListeners();
    }
    notify(false);
  }

  deleteUserAndUpdateDB(int id) async {
    notify(true);
    int deletedUserId = await _myRepository.deleteUSer(id);
    if (deletedUserId != -1) {
      cachedUsers.remove(cachedUsers.firstWhere((element) => element.id == id));

      notify(false);
    }
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
