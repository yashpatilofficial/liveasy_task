// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveasy_task/constants/color.dart';

class ProfileSelector extends StatefulWidget {
  const ProfileSelector({Key? key}) : super(key: key);

  @override
  _ProfileSelectorState createState() => _ProfileSelectorState();
}

class _ProfileSelectorState extends State<ProfileSelector> {
  int _radioValue = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value!;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 112),
              child: Text(
                "Please select your profile",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 26),
            ),
            Container(
              height: 89,
              width: 328,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.center,
                    child: Transform.scale(
                      scale: 1.6,
                      child: Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: (int? newvalue) {
                          setState(() {
                            _handleRadioValueChange(newvalue);
                          });
                        },
                        activeColor: Colors.green,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => leadDarkBlue),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/ShipperButtonLogo.png"),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: EdgeInsets.only(top: 16),
                    width: 200,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 21,
                          child: Text(
                            "Shipper",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: blackMain),
                          ),
                        ),
                        Container(padding: EdgeInsets.only(top: 8)),
                        Container(
                          height: 30,
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: subTextGrey),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 24),
            ),
            Container(
              height: 89,
              width: 328,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.center,
                    child: Transform.scale(
                      scale: 1.6,
                      child: Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: (int? newvalue) {
                          setState(() {
                            _handleRadioValueChange(newvalue);
                          });
                        },
                        activeColor: Colors.green,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => leadDarkBlue),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child:
                        Image.asset("assets/images/TransporterButtonLogo.png"),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: EdgeInsets.only(top: 16),
                    width: 200,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 21,
                          child: Text(
                            "Transporter",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: blackMain),
                          ),
                        ),
                        Container(padding: EdgeInsets.only(top: 8)),
                        Container(
                          height: 30,
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: subTextGrey),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 24),
            ),
            GestureDetector(
              onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
