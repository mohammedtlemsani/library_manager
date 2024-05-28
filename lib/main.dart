import 'package:flutter/material.dart';
import 'book_screen.dart';
import 'book_screen.dart';
import 'members_screen.dart';
import 'about_screen.dart';

void main() {
  runApp(LibraryManagerApp());
}

class LibraryManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Manager'),
      ),
      drawer: LibraryDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Bienvenue à la Bibliothèque',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Gérez facilement vos livres et adhérents avec notre application de gestion de bibliothèque.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildNavigationCard(
                    context,
                    'Livres',
                    Icons.book,
                    BooksScreen(),
                  ),
                  _buildNavigationCard(
                    context,
                    'Adhérents',
                    Icons.people,
                    MembersScreen(),
                  ),
                  _buildNavigationCard(
                    context,
                    'À propos',
                    Icons.info,
                    AboutScreen(),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Icon(Icons.book, size: 50),
                  title: Text('Total des livres'),
                  subtitle: Text('1000'),
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Icon(Icons.people, size: 50),
                  title: Text('Total des adhérents'),
                  subtitle: Text('250'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationCard(BuildContext context, String title, IconData icon, Widget destination) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: 120,
          height: 150,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 40),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LibraryDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("User Name"),
            accountEmail: Text("Bibliothèque publique"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/library_logo.jpeg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Livres'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BooksScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Adhérents'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MembersScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('À propos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
