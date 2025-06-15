import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpersonaa/config/firebase_options.dart';
import 'package:xpersonaa/features/auth/data/firebase_auth_repo.dart';
import 'package:xpersonaa/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:xpersonaa/features/auth/presentation/cubits/auth_states.dart';
import 'package:xpersonaa/features/posts/presentation/home_page.dart';
import 'package:xpersonaa/pages/auth_page.dart';
import 'package:xpersonaa/themes/light_mode.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = FirebaseAuthRepo();
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
      child: MaterialApp(
        title: 'A social media app',
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthState>(builder: (context, authState){

          if(authState is UnAuthenticated){
            return const AuthPage();
          }

          if(authState is Authenticated){
            return const HomePage();
          }

          else{
            return const Scaffold(

              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }, listener: (context, state){
          if(state is AuthError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        }),
      ),
    );
  }
}
