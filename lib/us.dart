import 'package:flutter/material.dart';
import 'univercity.dart';

class US extends StatefulWidget {
  const US({super.key});

  @override
  State<US> createState() => _USState();
}

class _USState extends State<US> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.6,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(204, 37, 129, 101),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(90)),
                    ),
                    child: Center(
                      child: Image.asset(
                        "images/united_states.png",
                        scale: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.666,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(204, 37, 129, 101),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.666,
                  padding: EdgeInsets.only(top: 40, bottom: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(90)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Welcome To University",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          wordSpacing: 2,
                          // color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Learing with Pleasure with Dear Students, Whenever you are",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 17,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(204, 37, 129, 101),
                        ),
                        // color: Colors.redAccent,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => univercity()));
                          },
                          child: const Text(
                            "Get Start",
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          // padding: const EdgeInsets.all(20),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       height: 60,
          //     ),
          //     SizedBox(
          //       height: 350,
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //         child: Image.asset(
          //           'images/united_states.png',
          //           fit: BoxFit.fitHeight,
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 70,
          //     ),
          //     Container(
          //       child: const Text(
          //         "Welcome To University",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           color: Colors.black,
          //           fontSize: 30,
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 50,
          //     ),
          //     Container(
          //       alignment: Alignment.center,
          //       width: 200,
          //       height: 50,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(30),
          //         color: Colors.redAccent,
          //       ),
          //       // color: Colors.redAccent,
          //       child: TextButton(
          //         onPressed: () {
          //           Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => univercity()));
          //         },
          //         child: const Text(
          //           "Continue",
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 25,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ),
      ),

      //  body: Container(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       SizedBox(
      //         height: 50,
      //       ),
      //     ],
      //   ),
      //  ),

      //  body: Center(
      //   child: TextButton(
      //     onPressed: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context)=>univercity()));
      //     },
      //     child: const Text(
      //       "Register",
      //       style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 30,
      //         color: Colors.black,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
