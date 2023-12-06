import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyNew());
}

class MyNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "TOP TEN CARS",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Horizon",
            ),
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Sharepage1())),
                  child: Text("Share"),
                ),
                PopupMenuItem(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutPage())),
                  child: Text("About"),
                ),
                PopupMenuItem(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Exit())),
                  child: Text("Exit"),
                ),
              ],
            )
          ],
        ),
        body: buildCombinedLists(context),
      ),
    );
  }

  Widget buildCombinedLists(BuildContext context) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            buildME(context),
            Mainpage(), // Add the Mainpage widget here
            Texx(),
          ],
        ),
      );
  Widget Texx() {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 30.0,
      fontFamily: 'Horizon',
    );

    return Container(
      width: 300.0,
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            'Abdul Rahman',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
          ColorizeAnimatedText(
            'AHMAD SODAIS',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
        ],
        isRepeatingAnimation: true,
        onTap: () {
          print("Tap Event");
        },
      ),
    );
  }

  Widget buildME(BuildContext context) => Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [],
        ),
      );
}

class CardItem {
  final String images;
  final String title;
  final String subtitle;
  const CardItem(
      {required this.images, required this.title, required this.subtitle});
}

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List<CardItem> items = [
    CardItem(
      images: "images3/23.jfif",
      title: "Benz",
      subtitle: "Price: 100000 ",
    ),
    CardItem(images: "images3/4.jfif", title: "RTX", subtitle: "Price:10000 "),
    CardItem(images: "images3/1.jfif", title: "T20", subtitle: "100000 "),
    CardItem(images: "images3/10.jfif", title: "Neon", subtitle: "100000 "),
    CardItem(images: "images3/11.jfif", title: "Carel", subtitle: "100000 "),
    CardItem(images: "images3/7.jfif", title: "ROLX", subtitle: "100000 "),
    CardItem(images: "images3/12.jfif", title: "Moon", subtitle: "100000 "),
    CardItem(images: "images3/15.jfif", title: "Rox", subtitle: "100000 "),
    CardItem(images: "images3/20.jfif", title: "NEL", subtitle: "100000 "),
    CardItem(images: "images3/26.jfif", title: "FOX", subtitle: "100000 "),
    CardItem(images: "images3/18.jfif", title: "MAZ", subtitle: "100000 "),
    CardItem(images: "images3/13.jfif", title: "MZ", subtitle: "100000 "),
    // ... (other items)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, _) => SizedBox(width: 50),
        itemBuilder: (context, index) => buildCard(items[index]),
      ),
    );
  }

  Widget buildCard(CardItem item) => Container(
        height: 900,
        width: 200,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cars(item: item))),
                      child: Image.asset(
                        item.images,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(item.title),
            Text(item.subtitle),
          ],
        ),
      );
}

class Cars extends StatelessWidget {
  final CardItem item;

  const Cars({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          item.title,
          style: TextStyle(fontFamily: "Horizon"),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Container(
                        height: 400,
                        width: 250,
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              item.images,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: 450,
                          height: 100,
                          child: Text(
                            """
                           The invention of the automobile is attributed to various
                           inventors, with Karl Benz often credited for creating the
                            first true automobile in the late 19th century.
                      
                          """,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          child: ElevatedButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => More_Details())),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                              ),
                              child: Text(
                                "More Details",
                                style: TextStyle(
                                    fontFamily: "Horizon", color: Colors.white),
                              )),
                        ),
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class share extends StatelessWidget {
  const share({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Exit extends StatelessWidget {
  const Exit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Aboutpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/about': (context) => AboutPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Website'),
      ),
      body: Center(
        child: Text('Welcome to the Car Website!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/about');
        },
        child: Icon(Icons.info),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Our Car Website',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to our Car Website, where you can find information about various car models, reviews, and more.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Contact Us:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Email: info@carwebsite.com'),
            Text('Phone: (123) 456-7890'),
          ],
        ),
      ),
    );
  }
}

class Sharepage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/about': (context) => AboutPage(),
        '/share': (context) => SharePage(),
      },
    );
  }
}

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Website'),
      ),
      body: Center(
        child: Text('Welcome to the Car Website!'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            tooltip: 'About',
            child: Icon(Icons.info),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/share');
            },
            tooltip: 'Share',
            child: Icon(Icons.share),
          ),
        ],
      ),
    );
  }
}

class AboutPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Our Car Website',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to our Car Website, where you can find information about various car models, reviews, and more.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Contact Us:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Email: info@carwebsite.com'),
            Text('Phone: (123) 456-7890'),
          ],
        ),
      ),
    );
  }
}

class SharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Share Our Car Website',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Help us spread the word about our Car Website. Share the link with your friends and family!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Replace 'your_website_link' with the actual link to your website
                final String websiteLink = 'your_website_link';
                // You can use any method to share the link, this is just a basic example
                // Here, it opens the share dialog with the website link
                // Note: This may not work on web depending on browser support
                // You may need to implement a custom sharing solution for web
                //Share.share('Check out the Car Website:www.google.com ');
              },
              child: Text('Share Website Link'),
            ),
          ],
        ),
      ),
    );
  }
}

class More_Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class Car {
  final String model;
  final int year;
  final String color;

  Car({
    required this.model,
    required this.year,
    required this.color,
  });
}

class MainPage extends StatelessWidget {
  final List<Car> cars = [
    Car(model: 'Toyota Camry', year: 2022, color: 'Blue'),
    Car(model: 'Ford Mustang', year: 2021, color: 'Red'),
    Car(model: 'Honda Accord', year: 2023, color: 'Silver'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car List'),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cars[index].model),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    carModel: cars[index].model,
                    carYear: cars[index].year,
                    carColor: cars[index].color,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String carModel;
  final int carYear;
  final String carColor;

  // Constructor to receive details about the car
  DetailsPage({
    required this.carModel,
    required this.carYear,
    required this.carColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Model: $carModel',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Year: $carYear',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Color: $carColor',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // Add more details here if needed
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the main page
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
