import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpersonaa/components/my_button.dart';
import 'package:xpersonaa/components/my_textfield.dart';
import 'package:xpersonaa/features/auth/presentation/cubits/auth_cubit.dart';

class RegisterPage extends StatefulWidget{
  final void Function()? tooglePages;
  const RegisterPage({super.key, this.tooglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register(){
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    final authCubit = context.read<AuthCubit>();

    if(name.isNotEmpty || email.isNotEmpty || password.isNotEmpty || confirmPassword.isNotEmpty){
      if(password == confirmPassword){
        authCubit.register(name, email, password);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords don't match")));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill all the fields")));
      }
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
              MyTextField(hintText: "Name", obscureText: false, controller: nameController),
              const SizedBox(height: 15,),
              MyTextField(hintText: "Email", obscureText: false, controller: emailController),
              const SizedBox(height: 15,),
              MyTextField(hintText: "Password", obscureText: true, controller: passwordController),
              const SizedBox(height: 15,),
              MyTextField(hintText: "Confirm Password", obscureText: true, controller: confirmPasswordController),

              const SizedBox(height: 15,),
              MyButton(text: "Create Account", onTap: (){
                register();
              }),

              const SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                  const SizedBox(width: 5,),
                  GestureDetector(
                      onTap: widget.tooglePages,
                      child: Text("Login",
                        style: TextStyle(color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold),
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}