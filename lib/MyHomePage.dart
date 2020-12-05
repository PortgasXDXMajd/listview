import 'package:flutter/material.dart';
import 'package:listview/OnePersonWidget.dart';
import 'package:listview/person.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Person> myList = [
    Person(
        imagePath: 'assets/person1.jpg',
        name: "Majd",
        age: 22,
        isSelected: false),
    Person(
        imagePath: 'assets/person2.jpg',
        name: "Ahmed",
        age: 35,
        isSelected: false),
    Person(
        imagePath: 'assets/person3.jpeg',
        name: "Ahlam",
        age: 18,
        isSelected: false),
    Person(
        imagePath: 'assets/person4.jpg',
        name: "Salem",
        age: 18,
        isSelected: false),
    Person(
        imagePath: 'assets/person5.jpg',
        name: "Samer",
        age: 19,
        isSelected: false),
    Person(
        imagePath: 'assets/person4.jpg',
        name: "Linda",
        age: 19,
        isSelected: false),
    Person(
        imagePath: 'assets/person1.jpg',
        name: "Aysha",
        age: 25,
        isSelected: false),
    Person(
        imagePath: 'assets/person3.jpeg',
        name: "Amer",
        age: 45,
        isSelected: false),
    Person(
        imagePath: 'assets/person5.jpg',
        name: "Amira",
        age: 22,
        isSelected: false),
    Person(
        imagePath: 'assets/person2.jpg',
        name: "Osama",
        age: 21,
        isSelected: false),
  ];

  List<Person> selectedPeople = List<Person>();

  bool isSelectionModeOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              selectedPeople.length != 0 ? Colors.grey[400] : Colors.blueAccent,
          actions: [
            selectedPeople.length != 0
                ? Center(
                    child: Text(
                    selectedPeople.length.toString() + " selected",
                    style: TextStyle(
                        color: selectedPeople.length != 0
                            ? Colors.black
                            : Colors.white),
                  ))
                : Container(),
            selectedPeople.length != 0
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        for (int i = 0; i < selectedPeople.length; i++) {
                          myList.remove(selectedPeople[i]);
                        }
                        selectedPeople.clear();
                      });
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  )
                : Container(),
          ],
          title: Text(
            "People List View",
            style: TextStyle(
                color:
                    selectedPeople.length != 0 ? Colors.black : Colors.white),
          ),
        ),
        body: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (BuildContext context, int index) {
            if (selectedPeople.length != 0) {
              isSelectionModeOn = true;
            } else {
              isSelectionModeOn = false;
            }
            return OnePersonWidget(
              isSelectionMode: isSelectionModeOn,
              person: myList[index],
              delete: () {
                setState(() {
                  myList.remove(myList[index]);
                });
              },
              addToSelectedList: () {
                setState(() {
                  selectedPeople.add(myList[index]);
                  myList[index].isSelected = true;
                });
              },
              removeFromSelectedList: () {
                setState(() {
                  selectedPeople.remove(myList[index]);
                  myList[index].isSelected = false;
                });
              },
            );
          },
        ));
  }
}