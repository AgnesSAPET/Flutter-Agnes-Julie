import 'package:validationdwm14/components/drawer.dart';
import 'package:validationdwm14/components/landing.dart';
import 'package:validationdwm14/screens/detail.dart';
import 'package:flutter/material.dart';

import '../components/square.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  int nb = 0;
  Color color = Colors.blue;
  bool disable = false;

  _onTap(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  List<Widget> list = [
    Landing(),
    Container(
      color: Colors.blue,
      child: Column(
        children: [
          Text('Movie',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Builder(
                  builder: (context) => GestureDetector(
                    child: Square(number: 1),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen()));
                    },
                  ),
                ),
                SizedBox(width: 10),
                Builder(
                  builder: (context) => GestureDetector(
                    child: Square(number: 2),
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                ),
                SizedBox(width: 10),
                Builder(
                  builder: (context) => GestureDetector(
                    child: Square(number: 3),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Text('home')
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Accueil'),
        ),
        drawerEnableOpenDragGesture: !disable,
        drawer: DrawerMenu(),
        body: SafeArea(
          child: list[_selectedPage],
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'Movie',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_page),
                label: 'Profil',
              ),
            ],
            currentIndex: _selectedPage,
            selectedItemColor: Colors.red[800],
            onTap: (index) {
              _onTap(index);
              Navigator.pushNamed(context, '/profil');
            }));
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Flutter Apply Search on ListView')),
            body: Center(
              child: ListSearch(),
              widthFactor: 20,
              heightFactor: 60,
            )));
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();

  static List<String> movieList = [
    "Avatar",
    "The Dark Knight",
    "Inception",
    "Avengers",
    "Pulp Fiction"
  ];

  // Copy Main List into New List.
  List<String> newDataList = List.from(movieList);

  onItemChanged(String value) {
    setState(() {
      newDataList = movieList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Here...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return ListTile(
                  title: Text(data),
                  onTap: () => print(data),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
