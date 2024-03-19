import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_job_portal/home/flitter_page.dart';
import 'package:flutter_job_portal/home/job_detailz.dart';
import 'package:flutter_job_portal/home/profile.dart';

class Home_page extends StatefulWidget {
  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JobZZ'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add a back button icon
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectTypePage()), // Navigate to SelectTypePage
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
        ],
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('jobss').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var jobs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              var job = jobs[index].data() as Map<String, dynamic>;
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JobDetailsPage(job: job)),
                  );
                },
                child: JobCard(job: job),
              );
            },
          );
        },
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final Map<String, dynamic> job;

  const JobCard({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      String title = job['Title'] ?? 'No Title';
      String company = job['Company'] ?? 'No Company';
      String salary = job['Salary'] != null ? '₹${job['Salary'].toString()}' : 'No Salary'; // Use ₹ for Rupees

      return Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          title: Text('Title: $title'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Company: $company'),
              SizedBox(height: 4),
              Text('Salary: $salary'),
            ],
          ),
        ),
      );
    } catch (e) {
      print('Error building JobCard: $e');
      return Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          title: Text('Error loading job data'),
        ),
      );
    }
  }
}
