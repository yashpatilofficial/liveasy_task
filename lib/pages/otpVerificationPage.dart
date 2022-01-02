// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveasy_task/constants/color.dart';
import 'package:liveasy_task/pages/profileSelection.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpVerificationPage extends StatefulWidget {
  final String phone;
  const OtpVerificationPage(this.phone, {Key? key}) : super(key: key);

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                "Verify Phone",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "Code is sent to ${widget.phone}",
                textAlign: TextAlign.center,
                style: TextStyle(color: subTextGrey),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 48,
              //padding: EdgeInsets.only(top: 24),
              child: OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 48,
                outlineBorderRadius: 0,
                otpFieldStyle: OtpFieldStyle(backgroundColor: lightFillBlue),
                style: const TextStyle(
                  fontSize: 25,
                ),
                textFieldAlignment: MainAxisAlignment.center,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                            verificationId: _verificationCode!, smsCode: pin))
                        .then((value) async {
                      if (value.user != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileSelector()));
                      }
                    });
                  } catch (e) {
                    //   FocusScope.of(context).unfocus();
                    //   _scaffoldkey.currentState
                    //       .showSnackBar(SnackBar(content: Text('Invalid OTP')));
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn’t receive the code?"),
                TextButton(
                  onPressed: () async => _verifyPhone(),
                  child: Text("Request Again"),
                ),
              ],
            ),
            Container(
              color: leadDarkBlue,
              width: 328,
              height: 56,
              alignment: Alignment.center,
              child: Text(
                "VERIFY AND CONTINUE",
                style:
                    GoogleFonts.montserrat(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber:
            '+91${widget.phone}', //Hardcoding the country code trying to find optimum way
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileSelector()));
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 60));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
