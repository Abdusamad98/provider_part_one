import 'package:flutter/material.dart';
import 'package:provider_part_one/view_model/counter_view_model.dart';
import 'package:provider/provider.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('REBUILDING build method');
    var myCounterProvider = Provider.of<CounterViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Counter Example"),
      ),
      body: Center(
        child: Text("Number:${myCounterProvider.counter}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myCounterProvider.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
