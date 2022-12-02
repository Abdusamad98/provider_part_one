const String userTable = "user_table";

class CachedUsersFields {
  static const String id = "_id";
  static const String name = "name";
  static const String age = "age";
  static const String count = "count";
}

class CachedUser {
  final int? id;
  final String name;
  final int age;
  final int count;

  CachedUser({
    this.id,
    required this.age,
    required this.name,
    required this.count,
  });

  CachedUser copyWith({
    int? id,
    int? age,
    int? count,
    String? name,
  }) =>
      CachedUser(
        id: id ?? this.id,
        age: age ?? this.age,
        name: name ?? this.name,
        count: count ?? this.count,
      );

  static CachedUser fromJson(Map<String, Object?> json) => CachedUser(
    id: json[CachedUsersFields.id] as int?,
    age: json[CachedUsersFields.age] as int,
    name: json[CachedUsersFields.name] as String,
    count: json[CachedUsersFields.count] as int,
  );

  Map<String, Object?> toJson() {
    return {
      CachedUsersFields.id: id,
      CachedUsersFields.age: age,
      CachedUsersFields.name: name,
      CachedUsersFields.count: count,
    };
  }

  @override
  String toString() => "ID = $id;  Age = $age;   Username = $name;";
}
