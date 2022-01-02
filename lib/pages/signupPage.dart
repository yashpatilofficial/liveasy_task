// ignore_for_file: file_names
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveasy_task/constants/color.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:liveasy_task/pages/otpVerificationPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  firebase_auth.FirebaseAuth firebaseauth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Container(
            child: Text(
              "Please enter your mobile number",
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "You’ll receive a 6 digit code \nto verify next.",
            textAlign: TextAlign.center, style: TextStyle(color: subTextGrey),
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            height: 48,
            width: 327,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              children: [
                CountryCodePicker(
                  //padding: const EdgeInsets.only(left:0),
                  initialSelection: 'IN',
                ),
                const Text(
                  "-  ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                AspectRatio(
                  aspectRatio: 4,
                  //fit: BoxFit.none,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.length < 10) {
                        return 'Please enter some text';
                      }
                    },
                    keyboardType: TextInputType.phone,
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      hintText: 'Mobile Number',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        OtpVerificationPage(_controller.text)),
              );
            },
            child: Container(
              color: leadDarkBlue,
              width: 328,
              height: 56,
              alignment: Alignment.center,
              child: Text(
                "CONTINUE",
                style:
                    GoogleFonts.montserrat(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Image.asset("assets/images/group1.png"),
          ))
        ],
      )),
    );
  }
}
