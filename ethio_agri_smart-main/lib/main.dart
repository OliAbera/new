import 'package:ethio_agri_smart/all.dart';
import 'package:ethio_agri_smart/dart.dart';
import 'package:ethio_agri_smart/disease_identification.dart';
import 'package:ethio_agri_smart/mainO.dart';
import 'package:ethio_agri_smart/message.dart';
import 'package:ethio_agri_smart/onepage.dart';
import 'package:ethio_agri_smart/rotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:ethio_agri_smart/Video_player.dart';
import 'package:ethio_agri_smart/Setting.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class ThemeNotifier with ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeMode get currentThemeMode => _currentThemeMode;

  void setThemeMode(ThemeMode themeMode) {
    _currentThemeMode = themeMode;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeNotifier.currentThemeMode,
          home: SplashScreen(),
          routes: {
            '/home': (context) => Home(),
            '/weather': (context) => WeatherInterface(),
            '/nextpage': (context) => Nextpage11(),
            '/telegram': (context) => TelegramApp(),
            '/recommendations': (context) => CropRecommendationPage(),
            '/disease': (context) => DiseaseIdentifier(),
            '/search': (context) => SearchPage(),
          },
        );
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.agriculture,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Smart Agri',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final FlutterTts flutterTts = FlutterTts();
  bool _glow = false;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _startGlowAnimation();
  }

  void _startGlowAnimation() async {
    setState(() {
      _glow = true;
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _glow = false;
    });
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(text);
  }

  Future<void> _showLanguageDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Afaan Oromoo'),
                onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainO(),
                ),
              );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (_selectedIndex) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/weather');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/nextpage');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/telegram');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/recommendations');
        break;
      case 5:
        Navigator.pushReplacementNamed(context, '/disease');
        break;
      case 6:
        Navigator.pushReplacementNamed(context, '/search');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
          ),
          title: Text(
            "Smart Agri",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.language),
              onPressed: () {
                _showLanguageDialog(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.speaker_phone),
              onPressed: () {
                _speak(
                    'Welcome to Smart Agri, Here on the Home Page you can find. 1.Recommendations Button: Where you can find all Informations about your plant or crop. 2.WeatherFlora button: where you can find accurate weather forecastings and recommendations. 3.Scan Plants button: Where you can capture image by camera or pick image from gallery and identify the plant\'s type. 4.Agrocalculator button: Where you can calculate the precise amounts of pesticides, herbicides and fertilizers for your plant or crop. 5.Crop Price Inquiry: Where you can get information on real time crop price information. 6.Crop Rotation button: Where you can know and use good practices of Crop Rotation. 7.Dr.Crop button: Where you can capture image by camera or pick form gallery and detect the plant\'s or crop\'s disease. 8.AgriVid button: Where you can get awesome videos related to agriculture.  Thank you!');
              },
            ),
            IconButton(
              icon: Icon(Icons.video_library),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayer1(),
                ),
              );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
          elevation: 20,
          flexibleSpace: Container(
            color: _glow ? Colors.blue : Colors.transparent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Icons Section
            SizedBox(height: 16),

            // Horizontal Scroll for Disease Alert Widgets
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Disease Alert Widget - Blight
                  Card(
                    elevation: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Blight, first-outbreak: Ireland 1840 on Potatoes!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://th.bing.com/th/id/OIP.pPWXooEPMOLFXcSeb-o39gAAAA?w=284&h=184&c=7&r=0&o=5&pid=1.7',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Blight is a disease that affects a wide range of plants, caused by fungal pathogens. Early detection and appropriate treatment are crucial to prevent significant crop loss. Farmers should regularly inspect their crops and use recommended fungicides when necessary.',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              // Add your action here
                            },
                            child: Text(
                              'Learn More',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 16),

                  // Disease Alert Widget - Downy Mildew
                  Card(
                    elevation: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Downy Mildew, first-outbreak: France 1878 on Grapes!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://th.bing.com/th/id/OIP.MDQFtq3aOaunIuu3uI-O-wHaFg?w=201&h=180&c=7&r=0&o=5&pid=1.7',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Downy mildew is a serious disease of many crops, particularly affecting grapevines, cucumbers, and lettuce. The disease is favored by cool, moist conditions and can lead to severe crop losses if not managed properly. Regular monitoring and the use of resistant varieties are key control measures.',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              // Add your action here
                            },
                            child: Text(
                              'Learn More',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 16),

                  // Disease Alert Widget - Rust
                  Card(
                    elevation: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rust, first-outbreak: USA 1904 on Wheat!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://th.bing.com/th/id/OIP.CSmhxA4qvCz2JsSmfpiiiwHaFj?w=248&h=186&c=7&r=0&o=5&pid=1.7',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Rust diseases are caused by fungal pathogens and can affect a wide range of plants, including wheat, barley, and roses. These diseases are characterized by reddish or orange pustules on leaves and stems. Effective management includes the use of resistant varieties, crop rotation, and timely fungicide applications.',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              // Add your action here
                            },
                            child: Text(
                              'Learn More',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Recommendations Card
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recommendations',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Find all the information you need about your plant or crop. From disease identification to crop management and weather forecasts, get expert recommendations and stay informed.',
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/recommendations');
                      },
                      child: Text(
                        'Learn More',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
           Card(
  elevation: 4,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest Agricultural News',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Stay updated with the latest news in agriculture, including new technologies, market trends, and policy changes.',
        ),
        SizedBox(height: 8),
        Image.network(
          'https://th.bing.com/th/id/OIP.JWYpE2ahlFql4SyfL8880AHaHa?w=185&h=184&c=7&r=0&o=5&pid=1.7', // Replace with your image URL
          width: double.infinity, // Adjust as needed
          height: 200, // Adjust as needed
          fit: BoxFit.cover, // Adjust how the image is displayed
        ),
        SizedBox(height: 8),
        TextButton(
          onPressed: () {
            // Navigate to news page or add your action here
          },
          child: Text(
            'Read More',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    ),
  ),
),


                 Card(
  elevation: 4,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Featured Agricultural videos!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Watch a featured video on innovative farming techniques, success stories, or new agricultural technologies.',
        ),
        SizedBox(height: 8),
        Image.network(
          'https://th.bing.com/th?q=Agricultural+Resources+Examples&w=120&h=120&c=1&rs=1&qlt=90&cb=1&pid=InlineBlock&mkt=en-XA&cc=AE&setlang=en&adlt=strict&t=1&mw=247', // Replace with your image URL
          width: double.infinity, // Adjust as needed
          height: 200, // Adjust as needed
          fit: BoxFit.cover, // Adjust how the image is displayed
        ),
        SizedBox(height: 8),
        TextButton(
          onPressed: () {
            // Navigate to news page or add your action here
          },
          child: Text(
            'Read More',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    ),
  ),
),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: 'Agrocalculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.telegram),
            label: 'Telegram',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.autorenew_outlined),
            label: 'Crop Rotation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Disease identifier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outlined),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}





class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          RadioListTile<ThemeMode>(
            title: Text('Light Theme'),
            value: ThemeMode.light,
            groupValue: themeNotifier.currentThemeMode,
            onChanged: (value) {
              themeNotifier.setThemeMode(value!);
            },
          ),
          RadioListTile<ThemeMode>(
            title: Text('Dark Theme'),
            value: ThemeMode.dark,
            groupValue: themeNotifier.currentThemeMode,
            onChanged: (value) {
              themeNotifier.setThemeMode(value!);
            },
          ),
          RadioListTile<ThemeMode>(
            title: Text('System Theme'),
            value: ThemeMode.system,
            groupValue: themeNotifier.currentThemeMode,
            onChanged: (value) {
              themeNotifier.setThemeMode(value!);
            },
          ),
          ListTile(
            leading: Icon(Icons.video_library),
            title: Text('Play Video'),
            onTap: () {
              // Navigate to VideoPlayer1 class
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayer1(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}