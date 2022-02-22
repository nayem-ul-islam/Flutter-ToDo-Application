import 'package:flutter/material.dart';
import 'package:todo_application/database_helper.dart';
import 'package:todo_application/models/task.dart';
import 'package:todo_application/widgets.dart';

class Taskpage extends StatefulWidget {
  const Taskpage({Key? key}) : super(key: key);

  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.0,
                      bottom: 6.0,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/back_arrow_icon.png"),
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width * 0.10,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) async {
                              print("Field Value: $value");

                              if (value != "") {
                                DatabaseHelper _dbhelper = DatabaseHelper();
                                Task _newTask = Task(
                                  id: 1,
                                  title: value,
                                  description: "",
                                );
                                await _dbhelper.insertTask(_newTask);
                                print("New task has been created");
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Enter Task Title",
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Description For The Task...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                      ),
                    ),
                  ),
                  TodoWidget(
                    text: "Create your first task",
                    isDone: false,
                  ),
                  TodoWidget(
                    text: "Create your first todo as well",
                    isDone: true,
                  ),
                  TodoWidget(
                    text: "Create your second todo as well",
                    isDone: true,
                  ),
                  TodoWidget(
                    text: "Create your third todo as well",
                    isDone: true,
                  ),
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 24.0,
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
                    height: MediaQuery.of(context).size.height * 0.10,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(
                          20.0,
                        )),
                    child: Image(
                      image: AssetImage(
                        "assets/images/delete_icon.png",
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
