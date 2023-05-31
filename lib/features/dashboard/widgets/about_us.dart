import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: PageView(
          children: [
            Container(
              child: Card(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Who We Are?",
                              style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'Neonderthaw',
                                color: Color.fromRGBO(95, 215, 252, 1),
                              )),
                          Text(
                              """We are a bunch of dedicated students with a vision and an idea to make a difference, especially 
                    with the current situation of the Vehical Rental World. To say in brief,\n""",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                          Text(
                              "\"Take care of your car in the garage, and the car will take care of you on the road.\"",
                              style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              )),
                          Text(
                              """\n And this is a quote we live by. Our aim is to provide the best on road service to out customers and ensure 
                      that they have a hassle free and smooth trip to their destination. We are a dedicated bunch of students out to get marks""",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ])
                  ])),
            ),
            Container(
              child: Card(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.network(
                          "data:image/jpeg;base64,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"),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Anirudh V Gubbi\n\n",
                              style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'Neonderthaw',
                                color: Color.fromRGBO(95, 215, 252, 1),
                              )),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.work),
                              Text("Position: Lead Developer",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.person),
                              Text("Roll Number: 211CS210",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.email),
                              Text(
                                  "Email ID: anirudhvgubbi.211CS210@nitk.edu.in",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.phone),
                              Text("Mobile Number: +91 73491 06129",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                        ])
                  ])),
            ),
            Container(
              child: Card(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Shashank G\n\n",
                              style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'Neonderthaw',
                                color: Color.fromRGBO(95, 215, 252, 1),
                              )),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.work),
                              Text("Position: Lead Developer",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.person),
                              Text("Roll Number: 211CS256",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.email),
                              Text("Email ID: shashankg.211CS256@nitk.edu.in",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.phone),
                              Text("Mobile Number: +91 91489 50666",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                        ]),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.network(
                          "https://images.unsplash.com/photo-1626847037657-fd3622613ce3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Y2FyJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
                    ),
                  ])),
            ),
            Container(
              child: Card(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.network(
                          "data:image/jpeg;base64,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"),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Anuhya Murki\n\n",
                              style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'Neonderthaw',
                                color: Color.fromRGBO(95, 215, 252, 1),
                              )),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.work),
                              Text("Position: Developer",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.person),
                              Text("Roll Number: 211CS213",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.email),
                              Text(
                                  "Email ID: anuhyamurki.211CS213@nitk.edu.in",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.phone),
                              Text("Mobile Number: +91 86600 53996",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                        ])
                  ])),
            ),
            Container(
              child: Card(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Y Supradha Bhat\n\n",
                              style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'Neonderthaw',
                                color: Color.fromRGBO(95, 215, 252, 1),
                              )),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.work),
                              Text("Position: Developer",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.person),
                              Text("Roll Number: 211CS265",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.email),
                              Text("Email ID: ysupradhabhat.211CS265@nitk.edu.in",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.phone),
                              Text("Mobile Number: +91 82170 75049",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                        ]),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.network(
                          "data:image/jpeg;base64,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"),
                    ),
                  ])),
            )
          ],
        ),
      ),
    ]);
  }
}
