import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  static Future<void> storeUserDetails({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    //
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', name);
      await prefs.setString('email', email);
      await prefs.setString('password', password);

      // Display scaffold message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User details stored successfully!"),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      // Handle error
      print("Error storing user details: $error");
    }
  }
}
