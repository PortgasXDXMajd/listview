import 'package:flutter/material.dart';
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

class OnePersonWidget extends StatefulWidget {
  Person person;
  Function delete;
  Function addToSelectedList;
  Function removeFromSelectedList;
  bool isSelectionMode;

  OnePersonWidget(
      {this.person,
      this.delete,
      this.addToSelectedList,
      this.removeFromSelectedList,
      this.isSelectionMode = false});

  @override
  _OnePersonWidgetState createState() => _OnePersonWidgetState();
}

class _OnePersonWidgetState extends State<OnePersonWidget> {
  Color myColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.person.isSelected ? () {} : widget.addToSelectedList,
      onTap: widget.isSelectionMode
          ? (widget.person.isSelected
              ? widget.removeFromSelectedList
              : widget.addToSelectedList)
          : (() {}),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 2.0),
        child: Card(
          color: widget.person.isSelected ? Colors.grey[850] : myColor,
          child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  widget.person.imagePath,
                ),
              ),
              title: Text(
                widget.person.name,
                style: TextStyle(
                    color:
                        widget.person.isSelected ? Colors.white : Colors.black),
              ),
              subtitle: Text(
                widget.person.age.toString(),
                style: TextStyle(
                    color:
                        widget.person.isSelected ? Colors.white : Colors.black),
              ),
              trailing: widget.person.isSelected
                  ? Icon(
                      Icons.check,
                      color: Colors.greenAccent,
                    )
                  : IconButton(
                      onPressed: widget.delete,
                      icon: Icon(Icons.delete, color: Colors.red),
                    )),
        ),
      ),
    );
  }
}
