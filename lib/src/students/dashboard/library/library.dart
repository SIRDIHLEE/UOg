import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/students/dashboard/library/library_item.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Library"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            child: Stack(children: [
              Image.asset("assets/images/librec.png"),
              Positioned(
                  top: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "The university libraries are filled with so much more than\nbooks. They are great places to work, or collaborate\nquietly with computers, printers and scanners throughout",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Whether it's help with working with numbers, referencing, exam preparation, making the most of the library's journals, books, databases and resources, our Librarians, Academic Skills Tutors and other members of the library team can help and advise.",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                    "The library has its own dedicated resource, LibGuides, which specialises in information ranging from the subject related resources for your courses, to guidance on copyright rules, employability and even filming in the libraries!",
                    style: TextStyle(fontSize: 15)),
                SizedBox(
                  height: 20,
                ),
                LibraryItem(
                    title: "Avery Hill",
                    time: "8:00am - 9:00pm",
                    text: "Avery Hill Library"),
                SizedBox(
                  height: 12,
                ),
                LibraryItem(
                    title: "Greenwich",
                    time: "8:00am - 9:00pm",
                    text: "Stockwell Street Library"),
                SizedBox(
                  height: 12,
                ),
                LibraryItem(
                    title: "Medway",
                    time: "8:00am - 9:00pm",
                    text: "Drill Hall Library")
              ],
            ),
          )
        ],
      ),
    );
  }
}
