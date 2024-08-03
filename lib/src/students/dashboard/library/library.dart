import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/students/dashboard/library/library_item.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Library"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            child: Stack(children: [
              Image.asset("assets/images/librec.png",),
              Positioned(
                  top: 10,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        "The university libraries are filled with so much \nmore than books. They are great places to \nwork, or collaborate quietly with computers, \nprinters, and scanners throughout",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        maxLines: null,
                        softWrap: true,
                      ),
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
