import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/virtualtours/widget/tour_item.dart';

class VirtualToursScreen extends StatelessWidget {
  const VirtualToursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Virtual/ Audio tours",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
        leading: const Icon(Icons.arrow_back),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                tourItem(image: Image.asset("assets.images/tour1.png"), text: 'Greenwich Campus sits on a UNESCO World Heritage Site on the banks of the River Thames.', title: 'Greenwich Campus\nVirtual Tour',),
                Text("yh")
                // tourItem(title: "Avery Hill Campus\nVirtual Tour", text: "Surrounded by green spaces, Avary Hill campus is located in Eltham, South-East London.", image: Image.asset("assets/images/tour2.png"))
              ],
            ),
          )
        ]
      ),
    );
  }
}
