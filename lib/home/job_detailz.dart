import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class JobDetailsPage extends StatelessWidget {
  final Map<String, dynamic> job;

  const JobDetailsPage({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = job['Title'] ?? 'No Title';
    String company = job['Company'] ?? 'No Company';
    String salary = job['Salary'] != null ? '\₹${job['Salary'].toString()}' : 'No Salary';
    String description = job['Description'] ?? 'No Description';
    String jobId = job['id'] ?? 'No ID'; // Assuming the job document has an 'id' field

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: $title',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('Company: $company', style: TextStyle(fontSize: 20)),
            SizedBox(height: 12),
            Text('Salary: $salary', style: TextStyle(fontSize: 20)),
            SizedBox(height: 24),
            Text(
              'Description:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(description, style: TextStyle(fontSize: 18)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // Check if user is authenticated
                    User? user = FirebaseAuth.instance.currentUser;
                    if (user == null) {
                      // User is not authenticated, show sign in screen or prompt to sign in
                      return;
                    }

                    // Retrieve user's email
                    String? userEmail = user.email;
                    if (userEmail == null) {
                      // User email is null, handle accordingly
                      return;
                    }

                    try {
                      // Show success dialog on pressing "Apply" button
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Application Submitted'),
                            content: Text('Your application has been received. We will contact you soon.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                  // Navigate back to previous page
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );

                      // Store the application in Firestore with the retrieved user email, job ID, and timestamp
                      await FirebaseFirestore.instance.collection('applied').add({
                        'email': userEmail,
                        'jobId': jobId,
                        'timestamp': FieldValue.serverTimestamp(),
                      });
                    } catch (e) {
                      // Handle Firestore write error
                      print('Error submitting application: $e');
                      // Show error message or retry logic
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Apply'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
