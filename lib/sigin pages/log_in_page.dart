
import 'package:flutter/material.dart';
import 'package:flutter_job_portal/home/flitter_page.dart';
import 'package:flutter_job_portal/main.dart';
import 'package:flutter_job_portal/sigin%20pages/dashboard.dart';
import 'package:flutter_job_portal/sigin%20pages/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import '../home pages/flitter_page.dart';

class Login_Page extends StatefulWidget{

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  void login() async {
    String emailId = email.text.trim();
    String lPassword = pass.text.trim();

    if (emailId == "" || lPassword == "") {
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
    } else {
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailId,
          password: lPassword,
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SelectTypePage()));
      } on FirebaseAuthException catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login Failed"),
              content: Text("Invalid email or password."),
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
      }
    }
  }



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

        title: Center(
          child: Text('Login'),
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
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xff199a8e),
                        )

                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Color(0xff199a8e),
                            width: 2
                        )
                    ),
                    label: Text('your email'),
                    prefixIcon: Icon(Icons.email),

                  ),

                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 350,
                child: TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xff199a8e),
                          )

                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color(0xff199a8e),
                              width: 2
                          )
                      ),
                      label: Text('passward'),


                      prefixIcon: Icon(Icons.lock),
                      //suffixIcon: Icon(Icons.remove_red_eye)


                  ),

                ),
              ),
            ),



           // SizedBox.fromSize();
            TextButton(
              onPressed: () {
                String uEmail = email.text;
                String uPass = pass.text;
                print("email: $uEmail, Pass: $uPass");

                login();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                minimumSize: MaterialStateProperty.all<Size>(Size(300, 56)),
              ),
              child: Text("login", style: TextStyle(color: Colors.white)),
            ),


            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sign_Up_Page()),
                );
              },
              child: Text("Create an Account"),
            ),


          ],
        ),

      ),

    );
  }

}