import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpersonaa/components/my_button.dart';
import 'package:xpersonaa/components/my_textfield.dart';
import 'package:xpersonaa/features/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget{
  final void Function()? tooglePages;
  const LoginPage({super.key, required this.tooglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(){
    final email = emailController.text;
    final password = passwordController.text;

    final authCubit = context.read<AuthCubit>();

    if(email.isNotEmpty || password.isNotEmpty) {
      authCubit.login(email, password);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill all the fields")));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 80, color: Theme.of(context).colorScheme.primary,),

              const SizedBox(height: 20,),

              Text("Welcome to Xpersonaa",
              style: TextStyle(
                  fontSize: 20,
              color: Theme.of(context).colorScheme.primary,
              ),
              ),
              const SizedBox(height: 30,),
              MyTextField(hintText: "Email", obscureText: false, controller: emailController),
              const SizedBox(height: 15,),
              MyTextField(hintText: "Password", obscureText: true, controller: passwordController),
              const SizedBox(height: 15,),
              Container(
                alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("Forgot Password?",
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Theme.of(context).colorScheme.primary
                      ,fontSize: 16,)
                  )
              ),

              const SizedBox(height: 15,),
              MyButton(text: "Login", onTap: (){
                login();
              }),

              const SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: widget.tooglePages,
                      child: Text("Register",
                        style: TextStyle(color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold),)),
                ],
              )


            ],
          ),

        ),
      ),
    );
  }
}