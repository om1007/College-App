//
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'dart:math';
//
// // List of example first names and last names
// List<String> firstNames = [
//   'Arjun', 'Jane', 'David', 'Emily', 'Michael', 'Sophia', 'Robert', 'Emma', 'William', 'Olivia'
// ];
// List<String> lastNames = [
//   'Jaisal', 'Johnson', 'Brown', 'Taylor', 'Anderson', 'Thomas', 'Jackson', 'White', 'Harris', 'Martin'
// ];
//
// String generateRandomName(Random random) {
//   String firstName = firstNames[random.nextInt(firstNames.length)];
//   String lastName = lastNames[random.nextInt(lastNames.length)];
//   return '$firstName $lastName';
// }
//
// class FacultyStatus extends StatelessWidget {
//   const FacultyStatus({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Faculty Status'),
//       ),
//       body: ListView.builder(
//         itemCount: 7, // Generate 7 tiles (2 fixed + 5 dummy)
//         itemBuilder: (context, index) {
//           if (index == 0) {
//             // Fixed tile with the name "Arjun Jaiswal"
//             return FacultyStatusTile(
//               facultyName: 'Rushi',
//               designation: 'Professor',
//               department: 'Computer Science',
//               isAvailable: true,
//               phoneNumber: '12345',
//               location: 'Class 66',
//               startTime: TimeOfDay(hour: 9, minute: 0),
//               endTime: TimeOfDay(hour: 13, minute: 0),
//             );
//           } else if (index == 2) {
//             // Fixed tile with the name "Prasad Bolke"
//             return FacultyStatusTile(
//               facultyName: 'Prasad Bolke',
//               designation: 'Associate Professor',
//               department: 'Electrical Engineering',
//               isAvailable: false,
//               phoneNumber: '0987654321',
//               location: 'Location 3',
//               startTime: TimeOfDay(hour: 10, minute: 0),
//               endTime: TimeOfDay(hour: 16, minute: 30),
//             );
//           } else {
//             // Generate random data for dummy tiles
//             Random random = Random();
//             String facultyName = generateRandomName(random);
//             String designation = ['Professor', 'Associate Professor', 'Assistant Professor'][random.nextInt(3)];
//             String department = ['IT Department', 'Computer Science', 'Electrical Engineering'][random.nextInt(3)];
//             bool isAvailable = random.nextBool();
//             String phoneNumber = '1234567890';
//             String location = 'Location ${index + 1}';
//             TimeOfDay startTime = TimeOfDay(hour: random.nextInt(24), minute: random.nextInt(60));
//             TimeOfDay endTime = TimeOfDay(hour: random.nextInt(24), minute: random.nextInt(60));
//
//             return FacultyStatusTile(
//               facultyName: facultyName,
//               designation: designation,
//               department: department,
//               isAvailable: isAvailable,
//               phoneNumber: phoneNumber,
//               location: location,
//               startTime: startTime,
//               endTime: endTime,
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//
// class FacultyStatusTile extends StatelessWidget {
//   final String facultyName;
//   final String designation;
//   final String department;
//   final bool isAvailable;
//   final String phoneNumber;
//   final String location;
//   final TimeOfDay startTime;
//   final TimeOfDay endTime;
//
//   const FacultyStatusTile({
//     Key? key,
//     required this.facultyName,
//     required this.designation,
//     required this.department,
//     required this.isAvailable,
//     required this.phoneNumber,
//     required this.location,
//     required this.startTime,
//     required this.endTime,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(
//         child: Icon(
//           isAvailable ? Icons.check : Icons.close,
//           color: Colors.white,
//         ),
//         backgroundColor: isAvailable ? Colors.green : Colors.red,
//       ),
//       title: Text(
//         facultyName,
//         style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Designation: $designation'),
//           Text('Department: $department'),
//           Text('Available: ${isAvailable ? 'Yes' : 'No'}'),
//           Text('Phone: $phoneNumber'),
//           Text('Location: $location'),
//           Text('Time: ${startTime.format(context)} - ${endTime.format(context)}'),
//         ],
//       ),
//       onTap: () {
//         // Add onTap functionality if needed
//       },
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: FacultyStatus(),
//   ));
// }


//ppppppppppppppppppppppp

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FacultyStatus extends StatelessWidget {
  const FacultyStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty Status'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('faculties').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // Show error dialog after a delay
            _showErrorDialog(context, 'Error: ${snapshot.error}');
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> facultyData = documents[index].data() as Map<String, dynamic>;

              return FacultyStatusTile(
                facultyName: facultyData['displayName'] ?? 'Unknown',
                isAvailable: facultyData['available'] ?? false,
                phoneNumber: facultyData['phoneNumber'] ?? 'Not available',
                email: facultyData['email'] ?? 'Not available',
                location: facultyData['location'] ?? 'Unknown',
                startTime: _parseTimeOfDay(facultyData['startTime']),
                endTime: _parseTimeOfDay(facultyData['endTime']),
              );
            },
          );
        },
      ),
    );
  }

  TimeOfDay _parseTimeOfDay(String? timeString) {
    if (timeString == null || !timeString.startsWith('TimeOfDay(')) {
      return TimeOfDay(hour: 0, minute: 0); // Default value if parsing fails
    }
    try {
      String trimmed = timeString.replaceAll('TimeOfDay(', '').replaceAll(')', '');
      List<String> components = trimmed.split(':');
      int hour = int.parse(components[0]);
      int minute = int.parse(components[1]);
      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      print('Error parsing TimeOfDay: $e');
      return TimeOfDay(hour: 0, minute: 0); // Default value if parsing fails
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    Future.delayed(Duration(seconds: 4), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(message),
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
    });
  }
}

class FacultyStatusTile extends StatelessWidget {
  final String facultyName;
  final bool isAvailable;
  final String phoneNumber;
  final String email;
  final String location;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  const FacultyStatusTile({
    Key? key,
    required this.facultyName,
    required this.isAvailable,
    required this.phoneNumber,
    required this.email,
    required this.location,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          isAvailable ? Icons.check : Icons.close,
          color: Colors.white,
        ),
        backgroundColor: isAvailable ? Colors.green : Colors.red,
      ),
      title: Text(
        facultyName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Available: ${isAvailable ? 'Yes' : 'No'}'),
          Text('Phone: $phoneNumber'),
          Text('Email: $email'),
          Text('Location: $location'),
          Text('Time: ${_formatTime(startTime)} - ${_formatTime(endTime)}'),
        ],
      ),
    );
  }

  String _formatTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final time = TimeOfDay(hour: timeOfDay.hour, minute: timeOfDay.minute);
    final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dateTime);
  }
}

//555555555555555555555555555555
//4444444444444444444444444444444



//mmmmmmmmmmmmmmmmmmmmmmm/
//yyyyyyyyyyyyyyyyyyyyy

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// class FacultyStatus extends StatefulWidget {
//   const FacultyStatus({Key? key}) : super(key: key);
//
//   @override
//   _FacultyStatusState createState() => _FacultyStatusState();
// }
//
// class _FacultyStatusState extends State<FacultyStatus> {
//   late DatabaseReference _database;
//   late User? _currentUser;
//   late List<Map<String, dynamic>> _allStatusDetails = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _database = FirebaseDatabase.instance.reference();
//     _getCurrentUser();
//   }
//
//   Future<void> _getCurrentUser() async {
//     _currentUser = FirebaseAuth.instance.currentUser;
//     await _fetchAllStatusDetails();
//     setState(() {});
//   }
//
//   Future<void> _fetchAllStatusDetails() async {
//     try {
//       DataSnapshot snapshot = await _database.child('faculties').get();
//       if (snapshot.value != null) {
//         Map<dynamic, dynamic> faculties = snapshot.value as Map<dynamic, dynamic>;
//         _allStatusDetails = faculties.entries.map((entry) {
//           final value = entry.value as Map<String, dynamic>;
//           return {
//             'displayName': entry.key,
//             ...value,
//           };
//         }).toList();
//       }
//     } catch (error) {
//       print("Error fetching status details: $error");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     DateTime now = DateTime.now();
//     String formattedDate = DateFormat('EEEE, d MMMM yyyy').format(now);
//     String formattedTime = DateFormat('h:mm a').format(now);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Updated Status'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Current Date: $formattedDate',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               SizedBox(height: 12.0),
//               Text(
//                 'Current Time: $formattedTime',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               SizedBox(height: 24.0),
//               Text(
//                 'Faculty Name:',
//                 style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 _currentUser != null ? _currentUser!.displayName ?? 'Unknown' : 'Loading...',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               SizedBox(height: 24.0),
//               // Display fetched status details
//               for (var statusDetails in _allStatusDetails) ...[
//                 SizedBox(height: 24.0),
//                 Text(
//                   'Status of ${statusDetails['displayName']}:',
//                   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Availability: ${statusDetails['available'] ? 'Available' : 'Not Available'}',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Timings: From ${statusDetails['startTime']} To ${statusDetails['endTime']}',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Location: ${statusDetails['location']}',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Phone Number: ${statusDetails['phoneNumber']}',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Email: ${statusDetails['email']}',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
