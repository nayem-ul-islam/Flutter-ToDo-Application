import 'package:flutter/material.dart';
import 'package:todo_application/screens/taskpage.dart';
import 'package:todo_application/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          color: Colors.white10,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 32.0,
                      bottom: 32.0,
                    ),
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.20,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        TaskCardWidget(
                          title: "Get Started!",
                          description:
                              "Hello User! Welcome to ToDo Application. This is a default task that you can edit or delete to start using the application.",
                        ),
                        TaskCardWidget(
                          title: "jajajja",
                          description: "hhhh",
                        ),
                        TaskCardWidget(
                          title: "jajajja",
                          description: "hhhh",
                        ),
                        TaskCardWidget(
                          title: "jajajja",
                          description: "hhhh",
                        ),
                        TaskCardWidget(
                          title: "jajajja",
                          description: "hhhh",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Taskpage(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.lightBlue,
                          Colors.blueAccent,
                        ],
                        begin: Alignment(0, -1.0),
                        end: Alignment(0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    child: Image(
                      image: AssetImage(
                        "assets/images/add_icon.png",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
