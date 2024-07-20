import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class OpenDayTextField extends StatelessWidget {
  const OpenDayTextField({super.key, required this.labeltext, required this.onChanged, this.textInputType});

final String labeltext;
final Function(String value) onChanged;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return  Container(
            height: 45,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: labeltext,
                labelStyle: TextStyle(fontSize: 15, color: AppColors.textField),
                
              enabledBorder: OutlineInputBorder(
            
              borderRadius: BorderRadius.circular(12),
              borderSide :  BorderSide(color:AppColors.primaryColor),
              
            
            ),),
              keyboardType: textInputType,
        onChanged: onChanged,
            ),
          );
  }
}