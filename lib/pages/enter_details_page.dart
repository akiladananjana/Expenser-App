import 'package:expenz_app/pages/main_page.dart';
import 'package:expenz_app/services/user_services.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/onboarding_page/custom_button.dart';
import 'package:flutter/material.dart';

class EnterDetailsPage extends StatefulWidget {
  const EnterDetailsPage({super.key});

  @override
  State<EnterDetailsPage> createState() => _EnterDetailsPageState();
}

class _EnterDetailsPageState extends State<EnterDetailsPage> {
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "Enter your\nPersonal Details",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  //
                ),
              ),
              SizedBox(height: 30),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        } else if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                        ).hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters long";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        } else if (value != _passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Text(
                          "Remember Me for the next time",
                          style: TextStyle(
                            color: kGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            //
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            activeColor: kMainColor,
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                                //
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        // Validate the form
                        if (_formKey.currentState!.validate()) {
                          final firstName = _nameController.text;
                          final email = _emailController.text;
                          final password = _passwordController.text;

                          // Store user details
                          await UserServices.storeUserDetails(
                            name: firstName,
                            email: email,
                            password: password,
                            context: context,
                          );

                          // Navigate to the main page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MainPage();
                              },
                            ),
                          );
                        }

                        //
                      },
                      child: CustomButton(buttonTitle: "Next"),
                    ),
                  ],
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
