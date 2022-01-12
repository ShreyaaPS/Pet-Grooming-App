import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petgrooming/details.dart';
import 'package:flutter/material.dart';

class booking extends StatefulWidget {
  static const routeName = '/booking';
  final List<Map<String, dynamic>> items;
  booking(this.items);
  @override
  _booking createState() => _booking();
}

class _booking extends State<booking> {
  DateTime? pickedDate;
  TimeOfDay? pickedTime;
  Map<String, dynamic>? petDetails;

  void pickDate(BuildContext context) async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
      initialDatePickerMode: DatePickerMode.day,
    );
    setState(() {});
  }

  void pickTime(BuildContext context) async {
    pickedTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
    );
    if (pickedTime!.hour < 10 || pickedTime!.hour >= 18) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text("The time should be between 10:00AM and 6:00PM"),
          ),
        );
      pickedTime = null;
    }
    setState(() {});
  }

  void updateDetails(BuildContext context) async {
    String email = FirebaseAuth.instance.currentUser!.email!;
    Map<String, dynamic> order = {
      "items": widget.items,
      "time": pickedTime!.hour.toString() +
          ":" +
          (pickedTime!.minute.toString().length == 1
              ? "0" + pickedTime!.minute.toString()
              : pickedTime!.minute.toString()),
      "date": pickedDate!.toIso8601String(),
      "pet details": petDetails,
    };
    try {
      await FirebaseFirestore.instance.collection('orders').doc(email).update({
        "orders": FieldValue.arrayUnion([order]),
      });
      Navigator.of(context).pop("success");
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text(
              "There was an error",
            ),
          ),
        );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  onPressed: () => print('Menu'),
                  icon: Icon(Icons.menu),
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 30.0),
            const Text(
              'Book Your Time Slot',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  color: Color(0xFFFFC05F),
                  child: const Text(
                    'Pet Details',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () async {
                    final returnVal = await Navigator.of(context)
                        .pushNamed(details.routeName);
                    petDetails = returnVal as Map<String, dynamic>;
                  }, //{
                  //setState();
                  //},
                )
              ],
            ),
            const SizedBox(height: 30.0),
            TextButton(
              onPressed: () => pickDate(context),
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 0),
                leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFFEEF8FF),
                  ),
                  child: const Icon(
                    Icons.calendar_today,
                    size: 25.0,
                    color: Color(
                      0xFF309DF1,
                    ),
                  ),
                ),
                title: pickedDate == null
                    ? const Text("Pick appointment date")
                    : Text(pickedDate!.day.toString() +
                        "-" +
                        pickedDate!.month.toString() +
                        "-" +
                        pickedDate!.year.toString()),
              ),
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     border: InputBorder.none,
            //     hintText: 'Appointment Day',
            //     icon: Container(
            //       width: 50.0,
            //       height: 50.0,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20.0),
            //         color: Color(0xFFEEF8FF),
            //       ),
            //       child: Icon(
            //         Icons.calendar_today,
            //         size: 25.0,
            //         color: Color(
            //           0xFF309DF1,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Divider(height: 40.0),
            TextButton(
              onPressed: () => pickTime(context),
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 0),
                leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFFEEF8FF),
                  ),
                  child: Icon(
                    Icons.calendar_today,
                    size: 25.0,
                    color: Color(
                      0xFF309DF1,
                    ),
                  ),
                ),
                title: pickedTime == null
                    ? const Text("Pick appointment time")
                    : Text(
                        pickedTime!.hour.toString() +
                            ":" +
                            (pickedTime!.minute.toString().length == 1
                                ? "0" + pickedTime!.minute.toString()
                                : pickedTime!.minute.toString()),
                      ),
              ),
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     border: InputBorder.none,
            //     hintText: 'Appointment Time',
            //     icon: Container(
            //       width: 50.0,
            //       height: 50.0,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20.0),
            //         color: Color(0xFFEEF8FF),
            //       ),
            //       child: Icon(
            //         Icons.calendar_today,
            //         size: 25.0,
            //         color: Color(
            //           0xFF309DF1,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Divider(height: 40.0),
            FlatButton(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Color(0xFF309DF1),
              child: const Text(
                'Book',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                if (pickedDate != null && pickedTime != null) {
                  if (petDetails != null) {
                    updateDetails(context);
                  } else {
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Please click on Pet details and enter the pet details"),
                        ),
                      );
                  }
                } else {
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text("Please enter all details"),
                      ),
                    );
                }
              },
            ),
          ]),
    );
  }
}
