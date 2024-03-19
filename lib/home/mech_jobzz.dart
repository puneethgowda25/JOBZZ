import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_job_portal/home/flitter_page.dart';
import 'package:flutter_job_portal/home/job_detailz.dart';
import 'package:flutter_job_portal/home/profile.dart';

class MechJobzz extends StatefulWidget {
  @override
  State<MechJobzz> createState() => _MechJobzzState();
}

class _MechJobzzState extends State<MechJobzz> {
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
        stream: FirebaseFirestore.instance.collection('mech_jobzz').snapshots(),
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
                child: MechJobCard(job: job),
              );
            },
          );
        },
      ),
    );
  }
}

class MechJobCard extends StatelessWidget {
  final Map<String, dynamic> job;

  const MechJobCard({Key? key, required this.job}) : super(key: key);

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
      print('Error building MechJobCard: $e');
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
