import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyhall/auth/login_or_register.dart';
import 'package:studyhall/components/list_tyle.dart';
import 'package:studyhall/pages/prazos_page.dart';
import 'package:studyhall/pages/profile_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Column(
        children: [
          // icon
          DrawerHeader(
            child: Icon(
              Icons.person,
              color: Colors.yellow[700],
              size: 70
              ),
          ),

          // home
          MyListTile(
            icon: Icons.home,
            text: 'H O M E',
            onTap: () => Navigator.pop(context),
          ),

          // perfil
          MyListTile(
            icon: Icons.person,
            text: 'P E R F I L',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage())),
          ),

          // datas de entrega
          MyListTile(
            icon: Icons.calendar_month,
            text: 'P R A Z O S',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PaginaPrazos())),
          ),

          //logout
          MyListTile(
            icon: Icons.logout,
            text: 'L O G O U T',
            onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginOrRegister()));
             FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}