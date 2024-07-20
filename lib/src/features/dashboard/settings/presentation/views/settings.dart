import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

bool _dropdownVal = false;
bool _faqdropDownVal = false;

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings",  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
        centerTitle: true,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const Divider(
              thickness: 1.0,
            ),
            const SizedBox(
              height: 10,
            ),
            ExpansionTile(
              title: const Text(
                "Account Settings",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: _dropdownVal
                  ? Icon(Icons.keyboard_arrow_down)
                  : Icon(Icons.keyboard_arrow_down),

              // IconButton(
              //     onPressed: (){},
              //     icon: const Icon(Icons.keyboard_arrow_down)),
              children: const [
                ListTile(
                  title: Text("Switch to staff/student account"),
                )
              ],
              onExpansionChanged: (value) {
                setState(() {
                  _dropdownVal = value;
                });
              },
            ),
            const Divider(
              height: 2,
            ),
            ExpansionTile(
              title: const Text(
                "FAQ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: _faqdropDownVal
                  ? Icon(Icons.keyboard_arrow_down)
                  : Icon(Icons.keyboard_arrow_down),

              // IconButton(
              //     onPressed: (){},
              //     icon: const Icon(Icons.keyboard_arrow_down)),
              children: const [
                ListTile(
                  title: Text("FAQ"),
                )
              ],
              onExpansionChanged: (value) {
                setState(() {
                  _faqdropDownVal = value;
                });
              },
            ),
            const Divider(
              height: 2,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About this App",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Update available",
                    style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
