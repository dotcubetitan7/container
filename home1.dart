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

  final List<Map<String, dynamic>> products = [
    {
      "image": "https://static.vecteezy.com/system/resources/thumbnails/046/966/566/small_2x/stylish-blonde-girl-in-sunglasses-and-black-t-shirt-posing-near-motorcycle-free-photo.jpeg",
      "title": "Men's Dark Grey Introvert...",
      "price": 80.0,
      "oldPrice": 100.0,
      "discount": 20,
    },
    {
      "image": "https://www.dhresource.com/webp/m/0x0/f2/albu/g1/M00/80/2B/rBVaGVoibD-AOo0KAAIbyPnPsbY929.jpg",
      "title": "Men's Dark Grey Introvert...",
      "price": 80.0,
      "oldPrice": 100.0,
      "discount": 20,
    },
    {
      "image": "https://www.dhresource.com/webp/m/0x0/f2/albu/g16/M01/9A/EF/rBVa32AKVWSAUvG0AAFaSOadLXk788.jpg",
      "title": "Men's Dark Grey Introvert...",
      "price": 80.0,
      "oldPrice": 100.0,
      "discount": 20,
    },
    {
      "image": "https://i.pinimg.com/originals/4c/dc/e7/4cdce7619f510409ccd352d85a12798b.webp",
      "title": "Men's Dark Grey Introvert...",
      "price": 80.0,
      "oldPrice": 100.0,
      "discount": 20,
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                height: height * 0.20,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 18 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration:
                    const Duration(milliseconds: 600),
                viewportFraction: 0.8,
              ),
            ),
            SizedBox(height: height * 0.03),
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
                      SizedBox(
                        height: height * 0.13,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: creators.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: width * 0.02),
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
                                radius: 35,
                                backgroundImage: NetworkImage(creators[index]),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: height * 0.03),
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
                      SizedBox(
                        height: height * 0.23,
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
                                    width: width * 0.27,
                                    height: height * 0.15,
                                    margin: EdgeInsets.only(bottom: height * 0.01),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
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
                      SizedBox(height: height * 0.06),
                      Text(
                        "From Categories You like",
                        style: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: height * 0.015),
                      _buildProductGrid(),
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

  Widget _buildProductGrid() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 17,
        mainAxisSpacing: 17,
        childAspectRatio: 0.70,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => _buildProductDetailsPage(product),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        product['image'],
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 16,
                        child: Icon(Icons.favorite_border,
                            size: 20, 
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    product['title'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        "\$${(product['price'] as double).toStringAsFixed(0)}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "\$${(product['oldPrice'] as double).toStringAsFixed(0)}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "${product['discount']}% Off",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductDetailsPage(Map<String, dynamic> product) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Image.network(product['image'], height: 250, fit: BoxFit.cover),
          const SizedBox(height: 1),
          Text(
            product['title'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\$${product['price']}  (Old: \$${product['oldPrice']})",
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Text(
            "${product['discount']}% OFF",
            style: const TextStyle(fontSize: 18, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
