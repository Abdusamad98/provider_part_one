import 'package:flutter/material.dart';
import 'package:provider_part_one/data/api_service/api_service.dart';
import 'package:provider_part_one/data/local_db/local_db.dart';
import 'package:provider_part_one/data/repositories/my_repository.dart';
import 'package:provider_part_one/ui/bella_info_screen.dart';
import 'package:provider_part_one/ui/counter_example_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider_part_one/view_model/bella_view_model.dart';
import 'package:provider_part_one/view_model/counter_view_model.dart';

void main() {
  MyRepository myRepository = MyRepository(apiService: ApiService(), localDatabase: LocalDatabase());
  CounterViewModel myObject = CounterViewModel();
  BellaViewModel bellaViewModel = BellaViewModel(myRepository: myRepository);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => myObject),
        ChangeNotifierProvider(create: (_) => bellaViewModel),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BellaInfoScreen());
  }
}
