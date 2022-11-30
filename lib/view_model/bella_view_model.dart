import 'package:flutter/foundation.dart';
import 'package:provider_part_one/data/models/user_data.dart';
import 'package:provider_part_one/data/repositories/my_repository.dart';

class BellaViewModel extends ChangeNotifier {
  BellaViewModel({required MyRepository myRepository}) {
    _myRepository = myRepository;
  }

  late MyRepository _myRepository;

  bool isLoading = false;

  UserData? userData;

  fetchBellaInfo() async {
    notify(true);
    userData = await _myRepository.getBellaInfo();
    notify(false);
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
