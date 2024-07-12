import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TelegramApp extends StatefulWidget {
  @override
  _TelegramAppState createState() => _TelegramAppState();
}

class _TelegramAppState extends State<TelegramApp> {
  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crop Market',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Crop Market'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                // Show search history
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black,
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      alignment: messages[index].isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(8.0),
                        color: messages[index].isMe
                            ? Colors.greenAccent
                            : Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 12.0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    messages[index].isMe ? 'You' : 'Crop Bot',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  CircleAvatar(
                                    child: Icon(
                                      messages[index].isMe
                                          ? Icons.person
                                          : Icons.agriculture_outlined,
                                      color: Colors.white,
                                    ),
                                    radius: 15,
                                    backgroundColor: messages[index].isMe
                                        ? Colors.blue
                                        : Colors.green,
                                  ),
                                ],
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                messages[index].text,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.black,
              child: PlantInput(
                onSend: (plantType) {
                  setState(() {
                    messages.add(Message(text: plantType, isMe: true));
                  });

                  getPrice(plantType);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getPrice(String plantType) {
    setState(() {
      messages.add(Message(text: 'Fetching price...', isMe: false));
    });

    Future.delayed(Duration(seconds: 2), () {
      final plantTypePriceMap = {
        'Teff': '1kg 102 Birr',
        'Maize': '1kg 49 Birr',
        'Wheat': '1kg 70 Birr',
        'Barley': '1kg 52 Birr',
        'Rice': '1kg 77 Birr',
        'Sorghum': '1kg 56 Birr',
        'Beans': '1kg 49 Birr',
        'Pear': '1kg 49 Birr',
        'Tomatoes': '1kg 49 Birr',
        'Potatoes': '1kg 102 Birr',
        'Onions': '1kg 50 Birr',
        'Apples': '1kg 130 Birr',
        'Avocado': '1kg 150 Birr',
        'Banana': '1kg 60 Birr',
        'Earth Pea': '1kg 100 Birr',
        'Bell Pepper': '1kg 50 Birr',
        'Cabbage': '1kg 50 Birr',
        'Carrot': '1kg 60 Birr',
        'Coffee': '1kg 320 Birr',
        'Dates': '1kg 388 Birr',
        'Green Pepper': '1kg 100 Birr',
        'Grape': '1kg 454.425 Birr',
        'Strawberry': '1kg 235.5775 Birr',
        'Lemon': '1kg 50 Birr',
        'Lettuce': '1kg 100 Birr',
        'Salad': '1kg 80 Birr',
        'Spinach': '1kg 50 Birr',
        'Mandarin': '1kg 50 Birr',
        'Mango': '1kg 120 Birr',
        'Mushroom': '1kg 100 Birr',
        'Onion': '1kg 75 Birr',
        'Garlic': '1kg 200 Birr',
        'Orange': '1kg 150 Birr',
        'Pea': '1kg 100 Birr',
        'Pineapple': '1kg 150 Birr',
        'Potato': '1kg 60 Birr',
        'Pumpkin': '1kg 60 Birr',
        'Linseed': '1kg 100 Birr',
        'Tomato': '1kg 80 Birr',
        'Watermelon': '1kg 200 Birr',
        'Sweet Potato (Yam)': '1kg 80 Birr',
        'Zucchini': '1kg 75 Birr',
        'Sugarcane': '1kg 150 Birr',
        'Red Pepper': '1kg 500 Birr',
        'Apple': '1kg 140 Birr',
      };

      final response = plantTypePriceMap[plantType] ?? 'Price not available';

      setState(() {
        messages.removeWhere((msg) => msg.text == 'Fetching price...');
        messages.add(Message(text: response, isMe: false));
      });
    });
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}

class PlantInput extends StatefulWidget {
  final Function(String) onSend;

  PlantInput({required this.onSend});

  @override
  _PlantInputState createState() => _PlantInputState();
}

class _PlantInputState extends State<PlantInput> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              labelText: 'Plant Type',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          child: Text(
            'More Info',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            launch('https://www.selinawamucii.com/insights/prices/ethiopia/');
          },
          color: Colors.green,
        ),
        IconButton(
          icon: Icon(Icons.send, color: Colors.white),
          onPressed: () {
            final plantType = _textEditingController.text.trim();
            if (plantType.isNotEmpty) {
              _textEditingController.clear();
              widget.onSend(plantType);
            }
          },
        ),
      ],
    );
  }
}
