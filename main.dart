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
    HomePage(
        name: "Flutter Dev",
        location: "India",
    ),
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
        title: const Text('The Forest Nature',
        style: TextStyle(
          fontSize: 18,
          decoration: TextDecoration.underline,
          decorationColor: Color.fromARGB(214, 133, 55, 13),
        ),
        ),
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
            icon: Icon(Icons.car_crash),
            label: 'Vehicle',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String name;
  final String location;

  const HomePage({
    super.key,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'The Nature',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 24),

          Center(
            child: Container(
              width: double.infinity,
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://wallpapercave.com/wp/wc1706622.jpg',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: 27),

     Row(
      children: [
        Padding(padding: const EdgeInsets.fromLTRB(10, 0, 0, 0)),
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Oeschinen Lake Campground",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              const Text(
                "Kandersteg, Switzerland",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.red,
                    size: 20,
                  ),
                  SizedBox(width: 4),
                  Text("41"),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    SizedBox(height: 35),


          ListTile(
              title: const Text('1. Beautiful Green Scenery',
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w500,
              )),
              onTap: () {
                Navigator.of(context);
              },
              ),
          SizedBox(height: 10),

          Text(
            'Sometimes, a stunning view makes you stop in your tracks, and you find yourself taking a moment to appreciate the spectacular landscape in front of you. It could be an amazing sunset, the peak of your mountain like that work for live...,\n The or a fresh patch of wildflowers in a field you are passing by on a road trip. With nature that beautiful, you know it is one of those "take a picture, it\'ll last longer" moments.\n  Gather your travel companions in the frame and snap an epic selfie to show off your even more epic #view. While it may be a #NoFilter needed pic, a caption is still necessary, so you will want to keep some scenery captions for Instagram handy. ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 15, 21, 15),
            ),
          ),
          SizedBox(height: 40),

            Text(
            '2. Beautiful Mountains Screenery',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 25, 164, 168),
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(height: 10),

          Text(
            'Mountains have held my heart captive since my earliest memories, a passion passed down by my father. They stand as silent witnesses to life’s ebb and flow, embodying strength, resilience, and breathtaking beauty.\n The Irish wisely caution, “Marry a mountain girl, and you wed the entire mountain,” underscoring the profound connection some of us share with these majestic landscapes.\n Below, I present a curated collection of my cherished mountain quotes—each a testament to the wonder and inspiration these lofty realms evoke. May you savor these reflections that echo the grandeur of mountains. 🏔️🌄'
            '\nStanding in front of the mountain, out there in the wild, we make the memories that form us and that’s all thanks to the stories of triumph, sadness, achievement that we have heard about mountains.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 15, 21, 15),
            ),
          ),
            SizedBox(height: 40),

            Text(
            '3. Beautiful River Scenery',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 182, 47, 124),
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 20),

          Text(
            'Sometimes, a stunning view makes you stop in your tracks, and you find yourself taking a moment to appreciate the spectacular landscape in front of you.\n It could be an amazing sunset, the peak of your mountain like that work for live...,\n The or a fresh patch of wildflowers in a field you are passing by on a road trip. With nature that beautiful, you know it is one of those "take a picture, it\'ll last longer" moments.\n  Gather your travel companions in the frame and snap an epic selfie to show off your even more epic #view. While it may be a #NoFilter needed pic, a caption is still necessary, so you will want to keep some scenery captions for Instagram handy. ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 15, 21, 15),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}


class PlacePage extends StatelessWidget {
  const PlacePage({super.key});
  
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}


class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 12,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: "Car"),
                Tab(text: "Bus"),
                Tab(text: "Bike"),
                Tab(text: "Flight"),
                Tab(text: "Train"),
                Tab(text: "Boat"),
                Tab(text: "Ship"),
                Tab(text: "Carriage"),
                Tab(text: "Tractor"),
                Tab(text: "Helicopter"),
                Tab(text: "Bicycle"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: 
                Image.network('https://static.vecteezy.com/system/resources/thumbnails/025/288/097/small_2x/orange-car-driving-on-road-at-sunset-ai-generated-photo.jpg') ,
              ),

              Center(
                child: 
                Image.network('https://static.vecteezy.com/system/resources/thumbnails/052/073/446/small_2x/a-rapid-blur-of-motion-vividly-captures-a-modern-bus-that-is-speeding-along-an-expressway-at-dusk-with-vibrant-colors-of-the-stunning-sunset-beautifully-illuminating-the-entire-scene-around-it-photo.jpg'), 
                ),

              Center(
                child: 
                Image.network('https://wallpaperaccess.com/full/226908.jpg', fit: BoxFit.fitHeight,),
                ),

              Center(
                child:
                Image.network('https://c4.wallpaperflare.com/wallpaper/393/536/1/the-sky-clouds-flight-lights-wallpaper-preview.jpg'), 
                ),

              Center(
                child: 
                Image.network('https://wallpaperaccess.com/full/1339870.jpg'),
                ),

              Center(
                child: 
                  Image.network('https://www.hdwallpapers.in/download/boat_in_the_middle_of_river_with_landscape_view_of_trees_covered_forest_with_reflection_on_water_hd_nature-HD.jpg')
                ),

                Center(
                  child: 
                  Image.network('https://tse3.mm.bing.net/th/id/OIP.NNj6U19_I8OYPrh81vcTWAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3'),
                ),

                 Center(
                  child: 
                  Image.network('https://th.bing.com/th/id/R.e3e9edc09b6d62ba9b2927a75bd3a70e?rik=RIgoel5npGEyCg&riu=http%3a%2f%2fthumb1.shutterstock.com%2fdisplay_pic_with_logo%2f51608%2f51608%2c1125106529%2c10%2fstock-photo-horse-drawn-carriage-513699.jpg&ehk=NfjAMKTdDdWujERg2Etjfx1p39hLd4wOdg9x88oURDQ%3d&risl=&pid=ImgRaw&r=0'),
                ),

                Center(
                  child: 
                  Image.network('https://www.tractor.com/wp-content/uploads/2020/05/Tractor-Home-2.jpg'),
                ),

                Center(
                  child: 
                  Image.network('https://www.airbus.com/sites/g/files/jlcbta136/files/2023-03/h175-photo_lloyd_horgan.jpg'),
                ),

                Center(
                  child: 
                  Image.network('https://tse1.mm.bing.net/th/id/OIP.vg6tNiIUnooeMGcimCrscgHaHa?pid=ImgDet&w=474&h=474&rs=1&o=7&rm=3'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
