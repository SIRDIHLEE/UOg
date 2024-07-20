// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class annoucement_item extends StatelessWidget {
  const annoucement_item({
    super.key, required this.image, required this.text, required this.subtitle, 
  });
  // final String Image;
  final String  text, subtitle;
  // final String subtitle;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        
        height: 170,
        width: 80,
        decoration: BoxDecoration(
          // color: Colors.black,
          // border: Border.all(2),
          color: Colors.white70,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade400, style: BorderStyle.solid, width: 1.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(3.0, 3.0),
              // spreadRadius: 10,
              blurRadius: 2
            
            ),
           BoxShadow(
              color: Colors.white,
              offset: Offset(1.0, 1.0),
              // spreadRadius: 10,
              blurRadius: 1
            
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(1.0, 1.0),
              // spreadRadius: 10,
              blurRadius: 1
            
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(1.0, 1.0),
              // spreadRadius: 10,
              blurRadius: 1
            
            ),
          ],
        ),
        child:  Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           image ,
          const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    text,
                     style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  // Text("Event for prospective \nstudent:", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),),
                  Expanded(
                    child: Text(
                      subtitle,
                      style: TextStyle( fontSize: 12),
                        // "From taster days to subject open\nevenings, find out more\n about what you'll study, where you'll\n study it and perhaps even meet\n who'll you'll be studying with."
                        // "From taster days to subject open evenings, find out more about what you'll study, where you'll study it and perhaps even meet who'll you'll be studying with."
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
