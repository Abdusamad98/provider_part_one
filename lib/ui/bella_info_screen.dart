import 'package:flutter/material.dart';
import 'package:provider_part_one/view_model/bella_view_model.dart';
import 'package:provider/provider.dart';

class BellaInfoScreen extends StatelessWidget {
  const BellaInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var bellaProvider = Provider.of<BellaViewModel>(context);
    print("REBUILDEING BUILD METHOD");

    return Scaffold(
      appBar: AppBar(
        title: const Text("API CALL"),
      ),
      body: Column(
        children: [
          Container(height: 100,width: double.infinity,color: Colors.green,),
          Consumer<BellaViewModel>(
            builder: (context, bellaViewModel, child) {
              return Center(
                child: bellaViewModel.isLoading
                    ? const CircularProgressIndicator()
                    : (bellaViewModel.userData == null
                    ? const Text("Hozircha data juq")
                    : Column(
                  children: [
                    Text(bellaViewModel.userData!.name),
                    Text(bellaViewModel.userData!.age.toString()),
                    Text(bellaViewModel.userData!.count.toString()),
                  ],
                )),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<BellaViewModel>().fetchBellaInfo();
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
