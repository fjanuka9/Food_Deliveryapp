import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/components/custom_button.dart';
import 'package:foodapp/components/custom_dialogbox.dart';
import 'package:foodapp/components/custom_header.dart';
import 'package:foodapp/components/custom_loader.dart';
import 'package:foodapp/components/custom_text.dart';
import 'package:foodapp/components/custom_text_field.dart';
import 'package:foodapp/controllers/auth_controller.dart';
import 'package:foodapp/screens/login_screen/fogot_password.dart';
import 'package:foodapp/screens/login_screen/register_screen.dart';
import 'package:foodapp/utils/app_colors.dart';
import 'package:foodapp/utils/constants.dart';
import 'package:foodapp/utils/util_function.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isObscure = true;
  final _email = TextEditingController();
  final _password = TextEditingController();

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
                  header: "Login",
                  tagline: 'Access Account',
                  image: 'top.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kwhite,
                            elevation: 2,
                            padding: const EdgeInsets.all(
                              20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Image.asset(
                            Constants.imageAsset(
                              'google.png',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kwhite,
                            elevation: 2,
                            padding: const EdgeInsets.all(
                              20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Image.asset(
                            Constants.imageAsset(
                              'facebook.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'or Login with Email',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: greycolor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: 'Email',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          CutomTextField(
                            controller: _email,
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
                              ? const CustomLoader()
                              : CustomButton(
                                  text: "Sign In",
                                  onTap: () async {
                                    if (inpuValidation()) {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      AuthController().loginUser(
                                        context,
                                        _email.text,
                                        _password.text,
                                      );
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
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: 'Don’t have an account?',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: greycolor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Register',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      UtilFunction.navigateTo(
                                          context, const RegisterPage());
                                    },
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: kblack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                UtilFunction.navigateTo(
                                    context, const FogotPassword());
                              },
                              child: const Text(
                                'Fogot Password',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool inpuValidation() {
    var isValid = false;
    if (_email.text.isEmpty || _password.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }
}
