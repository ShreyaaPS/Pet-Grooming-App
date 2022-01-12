import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petgrooming/constants.dart';
import 'package:petgrooming/form_field.dart';
import 'package:petgrooming/raised_fab.dart';

class FeedbackScreen extends StatefulWidget {
  static const routeName = "/feedback";

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  bool _isLoading = false;

  final List<String> _questions = [
    'How satisfied are you with the app UI?',
    'How much do you recommend our pet grooming studio to your friends?',
    'How much do you rate our facilities?',
    'How was your overall experience?',
  ];

  final List<int> _feedbackValue = [];

  final List<bool> _isFormFieldComplete = [];

  String? additionalComments;

  void _handleRadioButton(int group, int value) {
    setState(() {
      _feedbackValue[group] = value;
      _isFormFieldComplete[group] = false;
    });
  }

  void handleSubmitFeedback() async {
    bool complete = true;
    for (int i = 0; i < _feedbackValue.length; ++i) {
      if (_feedbackValue[i] == -1) {
        complete = false;
        _isFormFieldComplete[i] = true;
      } else {
        _isFormFieldComplete[i] = false;
      }
    }
    setState(() {});
    if (complete == true) {
      setState(() {
        _isLoading = true;
      });
      await FirebaseFirestore.instance.collection('feedback').add({
        "email": FirebaseAuth.instance.currentUser!.email,
        _questions[0]: _feedbackValue[0],
        _questions[1]: _feedbackValue[1],
        _questions[2]: _feedbackValue[2],
        _questions[3]: _feedbackValue[3],
        "Comments": additionalComments ?? "",
      });
      Navigator.of(context).pop("success");
    }
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _questions.length; ++i) {
      _feedbackValue.add(-1);
      _isFormFieldComplete.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback Page'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Please choose appropriate emoji icon for response',
                      style: kFeedbackFormFieldTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '😍 - Very Satisfied',
                      style: kFeedbackFormFieldTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '☺ - Satisfied',
                      style: kFeedbackFormFieldTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '😐 - Somewhat Satisfied',
                      style: kFeedbackFormFieldTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '😕 - Dissatified',
                      style: kFeedbackFormFieldTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '😠 - Very Dissatisfied',
                      style: kFeedbackFormFieldTextStyle,
                    ),
                    Divider(
                      height: 25.0,
                    ),
                  ]
                    ..addAll(
                      _questions.asMap().entries.map((entry) {
                        return FeedbackFormField(
                          id: entry.key + 1,
                          question: entry.value,
                          groupValue: _feedbackValue[entry.key],
                          radioHandler: (int value) =>
                              _handleRadioButton(entry.key, value),
                          error: _isFormFieldComplete[entry.key]
                              ? 'This is a required field'
                              : null,
                        );
                      }),
                    )
                    ..addAll([
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        decoration: kFeedbackFormFieldDecoration.copyWith(
                          hintText: 'Comments',
                        ),
                        maxLines: 5,
                        onChanged: (value) => additionalComments = value,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomRaisedButton(
                            save: handleSubmitFeedback,
                            title: 'Submit',
                          ),
                        ],
                      ),
                    ]),
                ),
              ),
            ),
    );
  }
}
