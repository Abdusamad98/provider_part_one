import 'package:provider_part_one/data/api_service/api_service.dart';
import 'package:provider_part_one/data/local_db/local_database.dart';
import 'package:provider_part_one/data/models/cached_user_model.dart';
import 'package:provider_part_one/data/models/user_data.dart';

class MyRepository {
  MyRepository({
    required ApiService apiService,
  }) {
    _apiService = apiService;
  }

  late ApiService _apiService;

// Fetch data from API
  Future<UserData> getBellaInfo() => _apiService.getUserData();

  //Fetch data From Local DB
  Future<CachedUser> insertUser(CachedUser cachedUser) =>
      LocalDataBase.insertCachedUser(cachedUser);
  Future<int> deleteUSer(int id) =>
      LocalDataBase.deleteCachedUserById( id);
  Future<List<CachedUser>> getAllUsers() => LocalDataBase.getAllCachedUsers();


}
