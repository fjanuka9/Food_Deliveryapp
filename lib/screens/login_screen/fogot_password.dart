import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/components/custom_button.dart';
import 'package:foodapp/components/custom_dialogbox.dart';
import 'package:foodapp/components/custom_header.dart';
import 'package:foodapp/components/custom_loader.dart';
import 'package:foodapp/components/custom_text_field.dart';
import 'package:foodapp/controllers/auth_controller.dart';
import 'package:foodapp/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FogotPassword extends StatefulWidget {
  const FogotPassword({Key? key}) : super(key: key);

  @override
  _FogotPasswordState createState() => _FogotPasswordState();
}

class _FogotPasswordState extends State<FogotPassword> {
  final _email = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        color: Color(0xffE5E5E5),
        child: Column(
          children: [
            CustomHeader(
              size: size,
              header: "Fogot Password",
              tagline: 'Reset Your Password',
              image: 'top.png',
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: kblack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  CutomTextField(
                    controller: _email,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  isLoading
                      ? CustomLoader()
                      : CustomButton(
                          text: "Send reset password email",
                          onTap: () async {
                            if (inpuValidation()) {
                              setState(() {
                                isLoading = true;
                              });
                              await AuthController()
                                  .SendPasswordResetEmail(context, _email.text);
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              DialogBox().dialogBox(
                                context,
                                DialogType.ERROR,
                                'Incorrect information.',
                                'Please enter valid details',
                              );
                            }
                          },
                        ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Login Here',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }

  bool inpuValidation() {
    var isValid = false;
    if (_email.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }
}
