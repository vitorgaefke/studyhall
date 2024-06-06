import 'package:flutter/material.dart';
import 'package:studyhall/components/list_tyle.dart';
import 'package:studyhall/pages/profile_page.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onSignOut;
  const MyDrawer({super.key,
  required this.onSignOut});

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

          //logout
          MyListTile(
            icon: Icons.logout,
            text: 'L O G O U T',
            onTap: onSignOut!,
          ),
        ],
      ),
    );
  }
}