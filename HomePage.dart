import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    "https://picsum.photos/id/1018/600/300",
    "https://picsum.photos/id/1015/600/300",
    "https://picsum.photos/id/1019/600/300",
    "https://picsum.photos/id/1020/600/300",
    "https://picsum.photos/id/1021/600/300",
  ];

  final List<String> creators = [
    "https://wallpaperaccess.com/full/1846731.jpg",
    "https://th.bing.com/th/id/OIP.NVdKuOg1Q_ApgVBRgynmOwHaEK?w=278&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
    "https://th.bing.com/th/id/OIP.Vbz1UyCPx4Kgv1HZ_YoJkwHaE8?w=245&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
    "https://wallpapercave.com/wp/wp3198091.jpg",
    "https://th.bing.com/th/id/OIP.Yszo9jpb4Lcc-m7uDcgXvQHaEk?w=202&h=183&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  ];

  final List<Map<String, dynamic>> categories = [
    {
      "name": "Fashion &\nBeauty",
      "image":
          "https://images.pexels.com/photos/712513/pexels-photo-712513.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-712513.jpg&fm=jpg",
    },
    {
      "name": "Fitness &\nWellness",
      "image": "https://wallpaperaccess.com/full/2465431.jpg",
    },
    {
      "name": "Tech &\nGadgets",
      "image":
          "https://i.pinimg.com/originals/87/b0/2b/87b02b25551236024b9142260e908afe.jpg",
    },
    {
      "name": "Finance &\nBusiness",
      "image":
          "https://miro.medium.com/v2/resize:fit:1120/1*_0_8X--FEYoQpz7K6PV8DQ.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // screen size
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF02447F),
              Color(0xFF000427),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.06),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/Frame.png',
                    width: width * 0.25,
                    height: height * 0.07,
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications_none,
                          color: Colors.white, size: width * 0.07),
                      SizedBox(width: width * 0.04),
                      Icon(Icons.shopping_cart_outlined,
                          color: Colors.white, size: width * 0.07),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.015),

            // 🔹 Carousel
            CarouselSlider(
              items: imgList
                  .map(
                    (item) => Container(
                      margin: EdgeInsets.all(width * 0.015),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: height * 0.22,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration:
                    const Duration(milliseconds: 600),
                viewportFraction: 0.7,
              ),
            ),

            SizedBox(height: height * 0.02),

            // 🔹 Bottom white container
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(
                    width * 0.04, height * 0.02, width * 0.02, 0),
                decoration: const BoxDecoration(
                  color: Color(0XFFF5F5F5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#TRENDING CREATORS",
                        style: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: height * 0.015),

                      // 🔹 Creators horizontal list
                      SizedBox(
                        height: height * 0.13,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: creators.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: width * 0.04),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(width * 0.01),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Colors.blue, Colors.yellow],
                                ),
                              ),
                              child: CircleAvatar(
                                radius: width * 0.12,
                                backgroundImage: NetworkImage(creators[index]),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: height * 0.03),

                      // 🔹 Divider with text
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Color(0xFF1B1931),
                              thickness: 1,
                              endIndent: 10,
                            ),
                          ),
                          Text(
                            "TOP CATEGORIES",
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1,
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: Color(0xFF1B1931),
                              thickness: 1,
                              indent: 10,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.02),

                      // 🔹 Categories list
                      SizedBox(
                        height: height * 0.22,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: width * 0.03),
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            return Container(
                              width: width * 0.28,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF1B1931),
                                    Color(0xFF433D6B)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width * 0.25,
                                    height: height * 0.12,
                                    margin: EdgeInsets.only(bottom: height * 0.01),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      image: DecorationImage(
                                        image: NetworkImage(category["image"]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    category["name"],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
