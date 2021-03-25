import 'package:validationdwm14/constants/firebase.dart';
import 'package:validationdwm14/models/movie.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: ListView(
        //padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            child: Row(
              children: [
                Text('Active Color'),
              ],
            ),
          ),
          ListTile(
            title: Text('Detail film'),
            onTap: () {
              Navigator.pushNamed(context, '/detail',
                  arguments: ItemArguments(text: 'Detail film'));
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            title: Text('Accueil'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            title: Text('Sign Out',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            onTap: () async {
              await firebaseAuth.signOut();
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      )),
    );
  }
}
