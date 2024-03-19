import 'package:flutter/material.dart';
import 'package:flutter_job_portal/home/Homez.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // Variables to store the initial values
  late String initialName;
  late String initialWork;
  late String initialEmail;
  late String initialPhone;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    // Set initial values for the controllers (you can fetch from your data)
    initialName = 'Puneeth Gowda';
    initialWork = 'Software Developer';
    initialEmail = 'puneethgowdaht@gmail.com';
    initialPhone = '63623 97351';

    nameController.text = initialName;
    workController.text = initialWork;
    emailController.text = initialEmail;
    phoneController.text = initialPhone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home_page()));
          },
          child: BackButton(),
        ),
        title: Text('My Profile'),
      ),
      body: SingleChildScrollView( // Wrap the body with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                // Add your profile picture here
                // backgroundImage: AssetImage('assets/profile_picture.jpg'),
              ),
              SizedBox(height: 16),
              isEditing
                  ? Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: workController,
                    decoration: InputDecoration(labelText: 'Work'),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Save the updated information to your data source
                      // You can also implement validation before saving
                      // For simplicity, it doesn't include validation in this example
                      // You can use nameController.text, workController.text, emailController.text, phoneController.text to get the updated values
                      // Save logic goes here

                      // Optional: Show a confirmation message to the user
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Profile updated successfully'),
                        ),
                      );

                      // Refresh the UI with the updated values
                      setState(() {
                        initialName = nameController.text;
                        initialWork = workController.text;
                        initialEmail = emailController.text;
                        initialPhone = phoneController.text;
                        isEditing = false;
                      });
                    },
                    child: Text('Save Changes'),
                  ),
                ],
              )
                  : Column(
                children: [
                  Text(
                    initialName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    initialWork,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text(initialEmail),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(initialPhone),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Switch to editing mode
                      setState(() {
                        isEditing = true;
                      });
                    },
                    child: Text('Edit Profile'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
