import 'package:flutter/material.dart';
import 'package:validationdwm14/constants/firebase.dart';

class ProfileScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profile'),
          actions: [
            Icon(Icons.edit),
          ],
        ),
        body: Center(
            child: FutureBuilder(
                future: getUsers(),
                builder: (context, snapshot) {
                  final users = snapshot.data;
                  return Column(children: [
                    Text(users[0].name.toString()),
                    Text(users[0].firstname.toString()),
                    Text(users[0].city.toString()),
                    Text(users[0].email.toString()),
                    ListTile(
                      title: Text('Sign Out',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                      onTap: () async {
                        await firebaseAuth.signOut();
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                  ]);
                })));
  }
}
