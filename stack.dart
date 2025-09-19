
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 108, 145, 155),
        body: 
        Container(
      
        color: const Color.fromARGB(255, 63, 194, 194),
        child: Stack(
          children: [
            Image.network('https://tse1.mm.bing.net/th/id/OIP.2UjAGkB0BEZEloGXWHt3pAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
            width: double.infinity,
            height: 200,
            ),
            
            Positioned(
              top: 30,
              left: 40,
              right: 0,
              child: Text('THe Elephant', style: TextStyle(
                backgroundColor: Colors.brown,
              ),
              ), 
            ),
            
            Positioned(
              right: 20,
              top: 10,
              child: Text('Most Like From', style: TextStyle(
                backgroundColor: Colors.amber,
              ),)),

              Positioned(
                bottom: 10,
                right: 10,
                child: Text('Most prefered Animal', style: TextStyle(
                backgroundColor: Colors.redAccent,
              ),)),
              Positioned(
                bottom: 50,
                right: 10,
                child: Text('Most Animal', style: TextStyle(
                backgroundColor: Colors.redAccent,
              ),)),
              Positioned(
                bottom: 90,
                right: 10,
                child: Text('prefered Animal', style: TextStyle(
                backgroundColor: Colors.redAccent,
              ),)),
              Positioned(
                bottom: 105,
                left: 50,
                child: Text('Powerful Animal', style: TextStyle(
                backgroundColor: const Color.fromARGB(255, 74, 214, 35),
              ),)),
              Positioned(
                bottom: 90,
                left: 10,
                child: Text('Most prefered Animal', style: TextStyle(
                backgroundColor: Colors.redAccent,
              ),)),
              Positioned(
                bottom: 50,
                left: 10,
                child: Text('Most prefered Animal', style: TextStyle(
                backgroundColor: const Color.fromARGB(255, 188, 41, 238),
              ),)),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text('Most prefered Animal', style: TextStyle(
                backgroundColor: const Color.fromARGB(255, 173, 160, 14),
              ),)),
          ],
        ),
      ),
    )
   );
  }
}
