import 'package:flutter/material.dart';
import 'package:listview/person.dart';

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
