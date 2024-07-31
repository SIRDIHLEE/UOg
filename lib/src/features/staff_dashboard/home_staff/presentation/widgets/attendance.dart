import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:uog/src/constant/colors.dart';

import '../../../../../constant/route.dart';
import 'attendance_tile.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('yyyy-MM-dd').format(now); // Format for Firestore

    return Column(
      children: [
        const AttendanceTile(),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('d MMMM yyyy').format(now),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor.withOpacity(0.50),
              ),
            ),
            Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.blackColor.withOpacity(0.50)),
          ],
        ),
        SizedBox(height: 16),
        Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.attendanceBColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Name', style: TextStyle(color: AppColors.scaffoldBackground, fontWeight: FontWeight.w600)),
                Text('Student Id', style: TextStyle(color: AppColors.scaffoldBackground, fontWeight: FontWeight.w600)),
                Text('Status', style: TextStyle(color: AppColors.scaffoldBackground, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _firestore
                .collection('attendance')
                .doc(formattedDate)
                .collection('students')
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              final documents = snapshot.data!.docs;

              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final data = documents[index].data() as Map<String, dynamic>;
                  final name = data['name'] ?? 'N/A';
                  final studentId = data['id'] ?? 'N/A';
                  final status = data['status'] ?? 'Absent'; // Assuming 'status' is a field

                  return ListTile(
                    // title: Text(name),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name),
                        Text(studentId),
                        Text(status, style: TextStyle(color: status == 'Present' ? Colors.green : Colors.red)),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
