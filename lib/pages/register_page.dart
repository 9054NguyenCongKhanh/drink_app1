import 'package:drink_app1/services/auth/auth_servide.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register() async {
    final _authServie = AuthServide();

    // check if passwords match -> create user

    if (passwordController.text == confirmPasswordController.text) {
      // try creating user
      try {
        await _authServie.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      }
      // display any errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    // if passwords don't match -> show error
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Mật khẩu không trùng khớp"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock_open_rounded,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(height: 25),
          //tin nhan va slogan app
          Text("Tạo tài khoản",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
          const SizedBox(height: 25),
          //email text field
          MyTextField(
            controller: emailController,
            hintText: "Email hoặc số điện thoại",
            obscureText: false,
          ),
          const SizedBox(height: 10),
          //password text field
          MyTextField(
            controller: passwordController,
            hintText: "Mật khẩu",
            obscureText: true,
          ),

          const SizedBox(height: 10),
          //confirmpassword text field
          MyTextField(
            controller: confirmPasswordController,
            hintText: "Xác nhận mật khẩu",
            obscureText: true,
          ),

          const SizedBox(height: 10),
          //sign up button
          MyButton(
            text: "Đăng nhập",
            onTap: () {},
          ),

          const SizedBox(height: 25),
          //already have acc? login here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bạn đã có tài khoản?",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Đăng nhập ngay",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
