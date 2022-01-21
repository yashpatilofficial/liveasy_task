// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveasy_task/constants/color.dart';
import 'package:liveasy_task/pages/signupPage.dart';

class languageSelectionPage extends StatefulWidget {
  const languageSelectionPage({Key? key}) : super(key: key);

  @override
  _languageSelectionPageState createState() => _languageSelectionPageState();
}

class _languageSelectionPageState extends State<languageSelectionPage> {
  String dropdownValue = 'English';
  final _languages = ['English', 'Hindi', 'Marathi', 'Gujrati'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(//safearea can be used to avoid any glitches ahead
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 128),
            ),
            Container(
              child: Image.asset("assets/images/thumbnail.png"),
            ),
            Container(
              padding: EdgeInsets.only(top: 35),
              child: Text(
                "Please select your profile",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
            ),
            Container(
              height: 30,
              width: 170,
              child: Text(
                "You can change the language at any time.",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: subTextGrey),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 24),//container can be replaced by a sizedBox
            ),
            Container(
              width: 216,
              height: 48,
              padding: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: DropdownButtonFormField(
                value: dropdownValue,
                elevation: 0,
                onChanged: (newvalue) {
                  setState(() {
                    dropdownValue = newvalue as String;
                  });
                },
                items: _languages.map<DropdownMenuItem<String>>((String value) {
                  //have not implemented languages
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 24),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ),
                );
              },
              child: Container(
                color: leadDarkBlue,
                width: 216,
                height: 48,
                alignment: Alignment.center,
                child: Text(
                  "NEXT",
                  style:
                      GoogleFonts.montserrat(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Image.asset("assets/images/group0.png"),//image name can be better
            ))
          ],
        ),
      ),
    );
  }
}
