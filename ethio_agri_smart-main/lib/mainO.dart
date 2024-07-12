import 'package:ethio_agri_smart/Video_player.dart';
import 'package:ethio_agri_smart/all.dart';
import 'package:ethio_agri_smart/dartO.dart';
import 'package:ethio_agri_smart/disease_identification.dart';
import 'package:ethio_agri_smart/message.dart';
import 'package:ethio_agri_smart/navigation_drawer.dart';
import 'package:ethio_agri_smart/onepageO.dart';
import 'package:ethio_agri_smart/rotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainO(),
    );
  }
}

class MainO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: Locale(themeNotifier.currentLocale), // Set the locale
            supportedLocales: [
              const Locale('en', 'US'), // English
              const Locale('om', 'ET'), // Afaan Oromoo
              // Add more locales as needed
            ],
            localizationsDelegates: [
              // Add your localization delegates here
              // Example:
              // AppLocalizations.delegate,
              // GlobalMaterialLocalizations.delegate,
              // GlobalWidgetsLocalizations.delegate,
              // GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeNotifier.currentThemeMode,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}

class ThemeNotifier with ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.system;
  String _currentLocale = 'en_US'; // Default to English

  ThemeMode get currentThemeMode => _currentThemeMode;
  String get currentLocale => _currentLocale;

  void setThemeMode(ThemeMode themeMode) {
    _currentThemeMode = themeMode;
    notifyListeners();
  }

  void setLocale(String locale) {
    _currentLocale = locale;
    notifyListeners();
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home()),
      );
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
              'Ismart Agrii',
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

class _HomeState extends State<Home> {
  final FlutterTts flutterTts = FlutterTts();
  bool _glow = false; // State variable to manage glowing effect

  @override
  void initState() {
    super.initState();
    _startGlowAnimation();
  }

  // Function to start the glowing animation
  void _startGlowAnimation() async {
    setState(() {
      _glow = true; // Enable glowing effect
    });
    await Future.delayed(Duration(seconds: 1)); // Delay for glowing effect
    setState(() {
      _glow = false; // Disable glowing effect
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
                title: Text('English'),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Provider.of<ThemeNotifier>(context, listen: false)
                      .setLocale('om_ET'); // Set locale to Afaan Oromoo
                },
              ),
              ListTile(
                title: Text('Amharic'),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  // Additional logic for Amharic language if needed
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomDrawer()),
            );
          },
        ),
        title: Text(
          "Ismart Agrii",
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
            tooltip: 'Change Language',
          ),
          IconButton(
            icon: Icon(Icons.speaker_phone),
            onPressed: () {
              _speak(
                  'Baga Nagaan gara Smart Agri nagaan duftan. page kana irati wantoota arman gadi argatu: Tokkoo, Gorsa. Lama, Haala Qilleensa. Sadi, safartu kemikala. afur, Gati midhan. shan, midhan marsan fachasu. Ja\'a, Dr.Crop. Torba, Video. Galatoma!');
            },
            tooltip: 'Text to Speech',
          ),
          IconButton(
            icon: Icon(Icons.cloud),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeatherInterfaceO()),
              );
            },
            tooltip: 'Weather',
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            tooltip: 'Settings',
          ),
        ],
        elevation: 20,
        flexibleSpace: Container(
          color: _glow ? Colors.blue : Colors.transparent,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20, // Increased spacing between buttons
          crossAxisSpacing: 20, // Increased spacing between buttons
          padding: EdgeInsets.all(10),
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Button background color white
                onPrimary: Colors.black, // Text and icon color black
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPageO()),
                );
              },
              icon: Icon(Icons.search, size: 30), // Increased icon size
              label: Text('Search', style: TextStyle(fontSize: 16)),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Button background color white
                onPrimary: Colors.black, // Text and icon color black
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherInterfaceO()),
                );
              },
              icon: Icon(Icons.cloud, size: 30), // Increased icon size
              label: Text('Weather', style: TextStyle(fontSize: 16)),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Button background color white
                onPrimary: Colors.black, // Text and icon color black
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Nextpage11()),
                );
              },
              icon: Icon(Icons.calculate, size: 30), // Increased icon size
              label: Text('Calculator', style: TextStyle(fontSize: 16)),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Button background color white
                onPrimary: Colors.black, // Text and icon color black
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelegramApp()),
                );
              },
              icon: Icon(Icons.shopping_cart, size: 30), // Increased icon size
              label: Text('Shopping', style: TextStyle(fontSize: 16)),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Button background color white
                onPrimary: Colors.black, // Text and icon color black
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CropRecommendationPage()),
                );
              },
              icon: Icon(Icons.swap_horiz, size: 30), // Increased icon size
              label: Text('Crop Advice', style: TextStyle(fontSize: 16)),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Button background color white
                onPrimary: Colors.black, // Text and icon color black
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiseaseIdentifier()),
                );
              },
              icon: Icon(Icons.add, size: 30), // Increased icon size
              label: Text('Disease Detection', style: TextStyle(fontSize: 16)),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Button background color white
                onPrimary: Colors.black, // Text and icon color black
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoPlayer1()),
                );
              },
              icon: Icon(Icons.play_arrow_outlined, size: 30), // Increased icon size
              label: Text('Video Player', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
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
            title: Text('Light Mode'),
            value: ThemeMode.light,
            groupValue: themeNotifier.currentThemeMode,
            onChanged: (value) {
              themeNotifier.setThemeMode(value!);
            },
          ),
          RadioListTile<ThemeMode>(
            title: Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themeNotifier.currentThemeMode,
            onChanged: (value) {
              themeNotifier.setThemeMode(value!);
            },
          ),
          RadioListTile<ThemeMode>(
            title: Text('System Default'),
            value: ThemeMode.system,
            groupValue: themeNotifier.currentThemeMode,
            onChanged: (value) {
              themeNotifier.setThemeMode(value!);
            },
          ),
        ],
      ),
    );
  }
}
