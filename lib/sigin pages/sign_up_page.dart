
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_portal/home/Homez.dart';
import 'package:flutter_job_portal/home/flitter_page.dart';
import 'package:flutter_job_portal/main.dart';
import 'package:flutter_job_portal/sigin%20pages/dashboard.dart';
import 'package:flutter_job_portal/sigin%20pages/log_in_page.dart';


class Sign_Up_Page extends StatefulWidget{

  @override
  State<Sign_Up_Page> createState() => _Sign_Up_PageState();
}

class _Sign_Up_PageState extends State<Sign_Up_Page> {
  TextEditingController jname=TextEditingController();

  TextEditingController jemail=TextEditingController();

  TextEditingController jpass=TextEditingController();


  void createAccount() async {
    String email = jemail.text.trim();
    String password = jpass.text.trim();
    String name = jname.text.trim();

    if (email == "" || password == "" || name == "") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Missing Information"),
            content: Text("Please fill in all the details."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else if (!isValidEmail(email)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid Email"),
            content: Text("Please enter a valid email address."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else if (password.length < 6) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Weak Password"),
            content: Text("Password should be at least 6 characters."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      try {
        // Create a new account
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // Navigate to the home page on successful account creation
        Navigator.pushReplacement(
            context as BuildContext,
            MaterialPageRoute(builder: (context) => SelectTypePage()));

        print("User created");
      } catch (e) {
        // Handle the case where the email already exists
        if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Account Creation Failed"),
                content: Text("The email address is already in use."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        } else {
          // Handle other exceptions if necessary
          print("Error: $e");
        }
      }
    }
  }

  bool isValidEmail(String email) {
    // Simple email validation using a regular expression
    final emailRegex =
    RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  /////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade50 ,
        leading: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardPage()));
          },
          child: BackButton(
          ),
        ),
          // color:  Colors.blue.shade200,
        title: Center(
          child: Text('Sign Up'),
        ),
      ),


      body: Container(
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: jname,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color:  Colors.blue.shade400,
                        )

                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color:  Colors.blue.shade400,
                            width: 2
                        )
                    ),
                    label: Text('Your Name'),
                    prefixIcon: Icon(Icons.person),

                  ),

                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: jemail,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color:  Colors.blue.shade400,
                        )

                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color:  Colors.blue.shade400,
                            width: 2
                        )
                    ),
                    label: Text('Your Email'),
                    prefixIcon: Icon(Icons.email),

                  ),

                ),
              ),
            ),
///////////////////////////////
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 350,
                child: TextField(
                  controller: jpass,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color:  Colors.blue.shade400,
                          )

                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color:  Colors.blue.shade400,
                              width: 2
                          )
                      ),
                      label: Text('Password'),


                      prefixIcon: Icon(Icons.lock),
                     //e suffixIcon: Icon(Icons.remove_red_eye)


                  ),

                ),
              ),
            ),


            TextButton(
              onPressed: () {
                createAccount();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                minimumSize: MaterialStateProperty.all<Size>(Size(300, 56)),
              ),
              child: Text("Sign Up", style: TextStyle(color: Colors.white)),
            ),


            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login_Page()),
                );
              },
              child: Text("Exists an Account"),
            ),

          ],
        ),

      ),
    );
  }
}


