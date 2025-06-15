import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpersonaa/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:xpersonaa/features/posts/presentation/components/my_drawer_tile.dart';
import 'package:xpersonaa/features/profile/presentation/pages/profile_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Icon(Icons.person, size: 80,),

              const SizedBox(height: 20,),

              MyDrawerTile(title: "H O M E", icon: Icons.home, onTap: (){
                Navigator.pop(context);
              },),

              MyDrawerTile(title: "P R O F I L E", icon: Icons.person,
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage())
                  );
                }),

              MyDrawerTile(title: "S E A R C H", icon: Icons.search,
                onTap: (){
                  Navigator.pop(context);
                }),

              MyDrawerTile(title: "S E T T I N G S", icon: Icons.settings,
                onTap: (){
                  Navigator.pop(context);
                }),

              const Spacer(),
              MyDrawerTile(title: "L O G O U T", icon: Icons.logout, onTap: () => context.read<AuthCubit>().logout(),),
            ],
          ),
        ),
      ),
    );
  }
}
