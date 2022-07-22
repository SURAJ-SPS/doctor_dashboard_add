import 'package:dpm_application/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/features/presentation/widgets/green_elevated_button.dart';
import 'core/util/button_constants.dart';
import 'core/util/color_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const id = 'login_select_lang';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> submit() async {
    final phoneNumber = countryCode + phoneNumberController.text;
    debugPrint('OTP is $phoneNumber');
    if (phoneNumber.length > 10) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(phoneNumberController: phoneNumber),
        ),
      );
    } else {
      const snackBar =
          SnackBar(content: Text('Invalid Phone Number. Please check again.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
  }

  String countryCode = '+91';
  List<String> countryCodeList = [
    '+91',
    '+880',
    '+855',
    '+233',
    "+60",
    "+92",
    "+63",
    "+94",
    "+255",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColour,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              const Text(
                "ENTER YOUR MOBILE NUMBER",
                style: kTitleTextStyle,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0xFFFFffffff)),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: DropdownButton<String>(
                          alignment: Alignment.centerLeft,
                          value: countryCode,
                          icon: const Padding(
                            padding: EdgeInsets.only(top: 20, right: 1),
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: kGreen,
                            ),
                          ),
                          elevation: 0,
                          style: const TextStyle(color: kGreen),
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              countryCode = newValue!;
                            });
                          },
                          items: countryCodeList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              alignment: Alignment.bottomCenter,
                              value: value,
                              child: Text(value, style: kDropDownTextStyle),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintStyle: kLoginTextFieldStyle,
                          contentPadding: EdgeInsets.all(0.0),
                          isDense: true,
                          border: InputBorder.none,
                        ),
                        controller: phoneNumberController,
                        style: kLoginTextFieldStyle,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          phoneNumberController.text = "";
                        },
                        icon: const CircleAvatar(
                          radius: 15.0,
                          foregroundColor: kAccentColor,
                          child: Icon(
                            CupertinoIcons.clear_circled,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: const Center(
                  child: Text(
                    'We will send you an SMS with the verification code to this number',
                    style: kSubtitleTextStyle,
                  ),
                ),
              ),
            ],
          ),
          GreenElevatedButton(buttonText: 'Continue', onPressed: submit)
        ],
      ),
    );
  }
}
