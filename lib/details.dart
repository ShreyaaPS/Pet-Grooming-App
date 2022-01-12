import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class details extends StatefulWidget {
  static const routeName = '/details';
  @override
  _details createState() => _details();
}

class _details extends State<details> {
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  void updateProfile(BuildContext context) async {
    String email = FirebaseAuth.instance.currentUser!.email!;
    if (_breedController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _ageController.text.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection('orders')
            .doc(email)
            .update({
          "breed": _breedController.text,
          "name": _nameController.text,
          "age": _ageController.text,
        });
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text("Pet details updated successfully"),
            ),
          );
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
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text("Please enter all the values"),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
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
            Text(
              'Enter Pet Details',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(height: 40.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     FlatButton(
            //       padding:
            //           EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20.0),
            //         side: BorderSide(
            //           color: Colors.transparent,
            //         ),
            //       ),
            //       color: Color(0xFFFFC05F),
            //       child: Text(
            //         'Payment',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 20.0,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //       onPressed: () {}, //{
            //       //setState();
            //       //},
            //     )
            //   ],
            // ),
            SizedBox(height: 30.0),
            TextField(
              controller: _breedController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Breed',
                icon: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFFEEF8FF),
                  ),
                  child: Icon(
                    Icons.pets,
                    size: 25.0,
                    color: Color(
                      0xFF309DF4,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Pet Name',
                icon: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFFEEF8FF),
                  ),
                  child: Icon(
                    Icons.pets,
                    size: 25.0,
                    color: Color(
                      0xFF309DF4,
                    ),
                  ),
                ),
              ),
            ),
            Divider(height: 40.0),
            TextField(
              keyboardType: TextInputType.number,
              controller: _ageController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Age',
                icon: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFFEEF8FF),
                  ),
                  child: Icon(
                    Icons.pets,
                    size: 25.0,
                    color: Color(
                      0xFF309DF4,
                    ),
                  ),
                ),
              ),
            ),
            Divider(height: 40.0),
            FlatButton(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Color(0xFF309DF1),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                if (_breedController.text.isNotEmpty &&
                    _nameController.text.isNotEmpty &&
                    _ageController.text.isNotEmpty) {
                  Navigator.of(context).pop({
                    "breed": _breedController.text,
                    "name": _nameController.text,
                    "age": _ageController.text,
                  });
                } else {
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text("Please enter all the values"),
                      ),
                    );
                }
              },
            ),
          ]),
    );
  }
}
