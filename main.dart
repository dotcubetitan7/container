import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 13, 131, 64)),
      ),
      home: const MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    PlacePage(),
    ContactsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Menu Button'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
       SizedBox(
            height: 70,
            child: DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 230, 227, 185),
                    Color.fromARGB(255, 255, 255, 255),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
               
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ArmPoint',
                    style: TextStyle(
                      color: Color.fromARGB(199, 163, 158, 95),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: const Color.fromARGB(255, 110, 82, 15),
                    ),
                  ),
                ],
              ),
            ),
          ), SizedBox(height: 20),

              ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
              ),

                ListTile(
              leading: const Icon(Icons.switch_account),
              title: const Text(' Switch Account '),
              onTap: () {
                Navigator.pushNamed(context, '/place');
              },
              ),

                ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' Courses '),
              onTap: () {
                Navigator.popAndPushNamed(context, '/contacts');
              },
              ),

                ListTile(
              leading: const Icon(Icons.info),
              title: const Text(' Terms & Conditions '),
              onTap: () {
                Navigator.pop(context);
              },
              ),

                ListTile(
              leading: const Icon(Icons.screen_rotation),
              title: const Text(' Section Rotate '),
              onTap: () {
                Navigator.pop(context);
              },
              ),

                ListTile(
              leading: const Icon(Icons.directions),
              title: const Text(' Directions '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
        ],
      ),
    ),
    
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plagiarism_rounded),
            label: 'Place',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Page'));
  }
}

class PlacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Place Page'));
  }
}

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Contacts Page'));
  }
}
