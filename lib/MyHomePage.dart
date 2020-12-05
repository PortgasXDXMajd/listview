import 'package:flutter/material.dart';
import 'package:listview/OnePersonWidget.dart';
import 'package:listview/constant.dart';
import 'package:listview/person.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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