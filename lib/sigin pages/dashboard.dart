import 'package:flutter/material.dart';
import 'package:flutter_job_portal/sigin%20pages/log_in_page.dart';
import 'package:flutter_job_portal/sigin%20pages/sign_up_page.dart';

class DashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        // onboardingAfV (4:1107)
        padding:  EdgeInsets.fromLTRB(0, 0, 0, 8),
        width:  double.infinity,
        decoration:  BoxDecoration (
          color:  Color(0xffffffff),
        ),
        child:
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.center,
            children:  [
              Container(
                // autogroupqqxhpzw (B4jdLAZzQF91xD8SxTQqXH)
                margin:  EdgeInsets.fromLTRB(0, 0, 0, 23),
                padding:  EdgeInsets.fromLTRB(54, 213, 54, 149),
                width:  double.infinity,
                child:
                Column(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    Container(
                      // contentwJs (12:1763)
                      margin:  EdgeInsets.fromLTRB(0, 0, 0, 60),
                      width:  double.infinity,
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // logofVm (12:1757)
                            margin:  EdgeInsets.fromLTRB(86, 0, 85, 39.48),
                            width:  double.infinity,
                            child:
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.center,
                              children:  [
                                // medics and logo
                                Container(
                                  child: Image.asset('assets/images/job.png'),
                                ),
                                Text(
                                  // medicssrj (12:1759)
                                  'JOB',

                                ),
                              ],
                            ),
                          ),
                          Center(
                            // headlineCPD (4:1117)
                            child:
                            Container(
                              margin:  EdgeInsets.fromLTRB(0, 0, 0, 9),
                              child:
                              Text(
                                'Let’s get started!',
                                textAlign:  TextAlign.center,
                                style: TextStyle(fontSize: 20),

                              ),
                            ),
                          ),
                          // logintoenjoythefeatureswevepro
                          Container(
                            // logintoenjoythefeatureswevepro (4:1118)
                            constraints:  BoxConstraints (
                              maxWidth:  267,
                            ),
                            child:
                            Text(
                              'Login to enjoy the features we’ve provided, and stay healthy!',
                              textAlign:  TextAlign.center,

                            ),
                          ),
                        ],
                      ),
                    ),

                    // loginbuttontfM (12:1754)


                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Page()));

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        minimumSize: MaterialStateProperty.all<Size>(Size(300, 56)),

                      ),
                      child: Text("login", style: TextStyle(color: Colors.white)),
                    ),

                    SizedBox(height: 20),

                    // signupbutton

                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_Up_Page()));

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        minimumSize: MaterialStateProperty.all<Size>(Size(300, 56)),
                      ),
                      child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                    ),


                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
