import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uog/src/constant/colors.dart';

class QRResult extends StatefulWidget {
  final Function() closeScreen;

  const QRResult({super.key, required this.closeScreen});

  @override
  _QRResultState createState() => _QRResultState();
}

class _QRResultState extends State<QRResult> {
  bool _isUpdating = false;
  bool _isUpdatedToday = false;
  String? _studentName;
  String? _studentId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _fetchStudentDetails();
    _checkIfUpdatedToday();
  }

  Future<void> _fetchStudentDetails() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userCollection = _firestore.collection('users');
      final docRef = userCollection.doc(user.uid);

      try {
        DocumentSnapshot doc = await docRef.get();

        if (doc.exists) {
          setState(() {
            _studentName = doc['name'] as String?;
            _studentId = doc['SCHOOLID'] as String?;
          });
        } else {
          // print("No such document");
        }
      } catch (e) {
        print("Error fetching student details: $e");
      }
    }
  }

  Future<void> _checkIfUpdatedToday() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && _studentId != null) {
      final currentDate = DateTime.now().toIso8601String().split('T')[0]; // YYYY-MM-DD
      final attendanceRef = _firestore
          .collection('attendance')
          .doc(currentDate)
          .collection('students')
          .doc(_studentId!);

      try {
        DocumentSnapshot doc = await attendanceRef.get();

        if (doc.exists) {
          final data = doc.data() as Map<String, dynamic>;
          final status = data['status'];
          setState(() {
            _isUpdatedToday = status == 'Present';
          });
        }
      } catch (e) {
        print("Error checking attendance: $e");
      }
    }
  }

  Future<bool> _updateAttendance(String studentId, String name) async {
    try {
      final currentDate = DateTime.now().toIso8601String().split('T')[0]; // YYYY-MM-DD
      final attendanceRef = _firestore
          .collection('attendance')
          .doc(currentDate)
          .collection('students')
          .doc(studentId);

      await attendanceRef.set({
        'name': name,
        'id': studentId,
        'timestamp': FieldValue.serverTimestamp(),
        'status': 'Present', // Add status here
      }, SetOptions(merge: true));

      return true;
    } catch (e) {
      print("Error updating attendance: $e");
      return false;
    }
  }

  Future<void> _handleUpdateAttendance() async {
    if (_studentId == null || _studentName == null) {
      print("Student ID or Name is null");
      return;
    }

    final success = await _updateAttendance(_studentId!, _studentName!);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(success ? "Success" : "Failure"),
          content: Text(success
              ? "Attendance has been updated successfully."
              : "There was an error updating the attendance. Please try again."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    // Update the flag after successful update
    setState(() {
      _isUpdatedToday = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          "Scanned Result",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline, size: 300, color: Colors.green,),
            const Text(
              "Attendance updated successfully",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            if (_studentName != null && _studentId != null)
              Column(
                children: [
                  Text("Student Name: $_studentName"),
                  Text("Student ID: $_studentId"),
                ],
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isUpdating || _isUpdatedToday
                  ? null
                  : () async {
                setState(() {
                  _isUpdating = true;
                });
                await _handleUpdateAttendance();
                setState(() {
                  _isUpdating = false;
                });
              },
              child: _isUpdating
                  ? CircularProgressIndicator()
                  : Text(_isUpdatedToday ? "Updated Today" : "Update Attendance"),
            ),
          ],
        ),
      ),
    );
  }
}
