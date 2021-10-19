import 'package:animate_do/animate_do.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/components/custom_button.dart';
import 'package:foodapp/components/custom_dialogbox.dart';
import 'package:foodapp/components/custom_header.dart';
import 'package:foodapp/components/custom_loader.dart';
import 'package:foodapp/components/custom_text.dart';
import 'package:foodapp/components/custom_text_field.dart';
import 'package:foodapp/controllers/auth_controller.dart';
import 'package:foodapp/screens/login_screen/login_screen.dart';
import 'package:foodapp/utils/app_colors.dart';
import 'package:foodapp/utils/util_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

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

  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: FadeInRight(
        child: Container(
          height: size.height,
          color: const Color(0xffE5E5E5),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Name',
                        fontSize: 16,
                        color: kblack,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      CutomTextField(
                        controller: _name,
                      ),
                      const CustomText(
                        text: 'Email',
                        fontSize: 16,
                        color: kblack,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      CutomTextField(
                        controller: _email,
                      ),
                      const CustomText(
                        text: 'Phone Number',
                        fontSize: 16,
                        color: kblack,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      CutomTextField(
                        controller: _phonenumber,
                      ),
                      const CustomText(
                        text: 'Password',
                        fontSize: 16,
                        color: kblack,
                        fontWeight: FontWeight.w500,
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
                              borderSide: const BorderSide(
                                color: kwhite,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      isLoading
                          ? const Center(child: CustomLoader())
                          : CustomButton(
                              text: "Register",
                              onTap: () async {
                                if (inputValidation()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await AuthController().registerUser(
                                    context,
                                    _email.text,
                                    _password.text,
                                    _name.text,
                                    _phonenumber.text,
                                  );
                                  setState(() {
                                    isLoading = false;
                                  });
                                  UtilFunction.navigateTo(
                                      context, const LoginPage());
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
