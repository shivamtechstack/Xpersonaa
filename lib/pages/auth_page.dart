import 'package:flutter/material.dart';
import 'package:xpersonaa/pages/login_page.dart';
import 'package:xpersonaa/pages/register_page.dart';


class AuthPage extends StatefulWidget{
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  void toogleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage( tooglePages : toogleScreens,);
    }else{
      return RegisterPage( tooglePages : toogleScreens);
    }
  }
}