import 'package:animate_do/animate_do.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/components/custom_button.dart';
import 'package:foodapp/components/custom_header.dart';
import 'package:foodapp/components/custom_text_field.dart';
import 'package:foodapp/utils/app_colors.dart';
import 'package:foodapp/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _isObscure = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _phonenumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: FadeInRight(
        child: Container(
          height: size.height,
          color: Color(0xffE5E5E5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomHeader(
                  size: size,
                  header: "Register",
                  tagline: 'Create Account',
                  image: 'top.png',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: fontcolorblack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      CustomTextField(
                        controller: _name,
                      ),
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: fontcolorblack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      CustomTextField(
                        controller: _email,
                      ),
                      Text(
                        'Phone Number',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: fontcolorblack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      CustomTextField(
                        controller: _phonenumber,
                      ),
                      Text(
                        'Password',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: fontcolorblack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextField(
                          controller: _password,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: kwhite,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(
                                color: kwhite,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      CutomButton(
                        text: "Register",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty ||
        _name.text.isEmpty ||
        _phonenumber.text.isEmpty ||
        _password.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else if (_phonenumber.text.length != 10) {
      isValid = false;
    } else {
      isValid = true;
    }

    return isValid;
  }
}
