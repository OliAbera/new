import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import './data_service.dart';

class WeatherInterfaceO extends StatefulWidget {
  WeatherInterfaceO({Key? key}) : super(key: key);
  String dropdownValue = 'one';
  @override
  State<WeatherInterfaceO> createState() => _WeatherInterfaceState();
}

class _WeatherInterfaceState extends State<WeatherInterfaceO> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();
  //late WeatherResponse _response;
  late String sityName = '';
  late String iconUrl = '';
  late int temperature = 0;
  late String pressure = '';
  late String humidity = '';
  late bool searching = false;
  late String description = '';
  late bool wrong = false;
  late bool? activeConnection = true;
  String selectedPlantType = '';

  void initState() {
    CheckUserConnection();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: activeConnection!
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    wrong
                        ? const Text('dogongorri ni jira!')
                        : searching
                            ? const SpinKitSpinningCircle(
                                color: Colors.blueAccent,
                                size: 100.0,
                              )
                            : Column(
                                children: [
                                  iconUrl != ''
                                      ? Image.network(iconUrl)
                                      : const SizedBox(
                                          height: 100.0,
                                          width: 100.0,
                                        ),
                                  Text(sityName),
                                  Text(
                                    '${temperature.toString()}°',
                                    style: const TextStyle(fontSize: 40),
                                  ),
                                  Text(description),
                                  temperature != 0
                                      ? Text(
                                          'Odeeffannoo Dabalataa',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(''),
                                  temperature != 0
                                      ? Text(
                                          'Dhiibbaa qilleensaa:           ${pressure.toString()}1010',
                                          style: const TextStyle(fontSize: 20),
                                        )
                                      : Text(''),
                                  temperature != 0
                                      ? Text(
                                          'jiidhinna:           ${humidity.toString()}23',
                                          style: const TextStyle(fontSize: 20),
                                        )
                                      : Text(''),
                                ],
                              ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: SizedBox(
                        width: 150,
                        child: TextField(
                          onSubmitted: (String value) {
                            _search();
                          },
                          controller: _cityTextController,
                          decoration: const InputDecoration(labelText: 'Magaalaa'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    ElevatedButton(onPressed: _search, child: Text('Barbaaduu')),
                    temperature != 0
                        ? Column(
                            children: [
                              Divider(),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                "Haalli qilleensaa amma jiru keemikaalota akka : ",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              temperature > 10 && temperature < 15
                                  ? Column(
                                      children: [
                                        Column(
                                          children: [
                                            Center(
                                              child: Column(
                                                children: [
                                                  Text(
                                                      'Xaa’oo:                        '),
                                                  DropdownButton<String>(
                                                    value: selectedPlantType,
                                                    onChanged: (newValue) {
                                                      setState(() {});
                                                    },
                                                    items: [
                                                      'Poomii                                        ',
                                                      'Garbuu                                       ',
                                                      'Baaqelaa                                    ',
                                                      'Kaarootii                                       ',
                                                      'Boqqolloo',
                                                      'Millee                                        ',
                                                      'Dinaacha                                     ',
                                                      'Roosii                                           ',
                                                      'Maashellaa                                       ',
                                                      'Tiimatimii                                        ',
                                                      'Qamadii                                          ',
                                                      'Qullubbii Adii                                          ',
                                                      'Kotoree',
                                                      ''
                                                    ].map((type) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: type,
                                                        child: Text(type),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 15 && temperature < 20
                                  ? Column(
                                      children: [
                                        Column(
                                          children: [
                                            Center(
                                              child: Column(
                                                children: [
                                                  Text(
                                                      'Xaa\'oo:                        '),
                                                  DropdownButton<String>(
                                                    value: selectedPlantType,
                                                    onChanged: (newValue) {
                                                      setState(() {});
                                                    },
                                                    items: [
                                                      '-Avuukaadoo                                 ',
                                                      '-Garbuu                                     ',
                                                      ' -Raafuu                                    ',
                                                      '-kaarootii',
                                                      '-Baaqelaa',
                                                      '-Wayinii ',
                                                      '-Loomii',
                                                      '-Maandariin ',
                                                      ' -Millee ',
                                                      '-Qullubbii diimaa',
                                                      '-Burtukaana ',
                                                      '-Roosii ',
                                                      '-Suufii ',
                                                      '-Maashellaa',
                                                      '-Shaayii',
                                                      ' -Tiimatimii ',
                                                      ' -Qamadii ',
                                                      ' -Yam ',
                                                      ''
                                                    ].map((type) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: type,
                                                        child: Text(type),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 20 && temperature < 30
                                  ? Column(
                                      children: [
                                        Column(
                                          children: [
                                            Column(
                                              children: [
                                                Center(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                          'Xaa\'oo:                      '),
                                                      DropdownButton<String>(
                                                        value:
                                                            selectedPlantType,
                                                        onChanged: (newValue) {
                                                          setState(() {});
                                                        },
                                                        items: [
                                                          '-Muuzii                                             ',
                                                          '-Avuukaadoo                                   ',
                                                          ' -Kaarootii                                  ',
                                                          ' -Teemerii ',
                                                          '-Baaqelaa ',
                                                          '-Wayinii',
                                                          '-Loomii ',
                                                          '-Mandarin ',
                                                          '-Millee ',
                                                          '-Qullubbii Adii ',
                                                          ' -Burtukaana ',
                                                          ' -Oil Palm ',
                                                          ' -Roozii ',
                                                          '-Ruuzii ',
                                                          '-Suufii ',
                                                          ' -Maashellaa',
                                                          ' -Kookanatii',
                                                          '-Tiimatimii ',
                                                          '-Ochoolonii ',
                                                          '-Xaafii ',
                                                          '-Buna',
                                                          ''
                                                        ].map((type) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: type,
                                                            child: Text(type),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 30
                                  ? Column(
                                      children: [
                                        Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                  'Xaa\'oo:                    '),
                                              DropdownButton<String>(
                                                value: selectedPlantType,
                                                onChanged: (newValue) {
                                                  setState(() {});
                                                },
                                                items: [
                                                  ' -Teemerii                                            ',
                                                  '-Millee                                    ',
                                                  ' -Tiimatimii',
                                                  '-Roosii ',
                                                  '-Yam ',
                                                  '-Kookanatii',
                                                  ''
                                                ].map((type) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: type,
                                                    child: Text(type),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 10 && temperature < 15
                                  ? Column(
                                      children: [
                                        Text(
                                            'Farra Ilbiisoota:                           '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            '-Muuzii                                               ',
                                            ' -Raafuu                                   ',
                                            ' -Kaarotii ',
                                            ' -Teemerii ',
                                            ' -Baaqelaa ',
                                            '-Qamadii ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 15 && temperature < 20
                                  ? Column(
                                      children: [
                                        Text(
                                            'Farra Ilbiisoota:                          '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            ' -Poomii                                                   ',
                                            '-Avuukadoo                                             ',
                                            '-Muuzii ',
                                            '-Garbuu ',
                                            ' -Raafuu ',
                                            ' -Kaarooti ',
                                            ' -Baaqelaa ',
                                            ' -Loomii ',
                                            ' -Boqolloo ',
                                            '-Mandarin ',
                                            '-Maangoo ',
                                            '-Maangoo',
                                            ' -Qullubbii Adii ',
                                            '-Burtukaana ',
                                            ' -Roozii ',
                                            ' -Suufii ',
                                            '-Maashelaa ',
                                            ' -Shaayii ',
                                            '-Timatimii',
                                            ' -Qamadii ',
                                            '-Qullubi Adii ',
                                            '-Beans ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 20 && temperature < 30
                                  ? Column(
                                      children: [
                                        Text(
                                            'Farra Ilbiisoota:                                 '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            ' -Poomii                                                 ',
                                            ' -Avuukadoo ',
                                            ' -Muuzii ',
                                            ' -Garbuu ',
                                            ' -Kaarotii ',
                                            '-Temerii ',
                                            '-Baaqela ',
                                            '-Wayinii',
                                            '-Loomii ',
                                            '-Boqqoloo ',
                                            '-Mandarin ',
                                            '-Maangoo ',
                                            '-Millet ',
                                            '-Oil Palm ',
                                            '-Qullubii diimaa ',
                                            '-Burtukaana ',
                                            '-Ruuzii ',
                                            '-Roozii',
                                            '-Suufii ',
                                            '-Maashelaa ',
                                            '-Shaayii',
                                            '-Tiimatimii ',
                                            '-Qamadii ',
                                            '-Yam ',
                                            '-Ochoolanii ',
                                            ' -Qullubii Adii ',
                                            '-Kookanatii ',
                                            '-Xaafii ',
                                            '-Buna ',
                                            '-Beans  ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 30
                                  ? Column(
                                      children: [
                                        Text(
                                            'Farra Ilbiisoota:                                 '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            '-Muuzii                                            ',
                                            '-Raafuu',
                                            '-Kaarootii ',
                                            '-Teemerii ',
                                            '-Kookanatii ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 10 && temperature < 15
                                  ? Column(
                                      children: [
                                        Text(
                                            'Qoricha aramaa:                                 '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            '-Avuukadoo                                           ',
                                            '-Muuzii ',
                                            '-Raafuu ',
                                            '-Kaarotii ',
                                            '-Shaayii ',
                                            '-Dinaacha ',
                                            '-Qamadii  ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 15 && temperature < 20
                                  ? Column(
                                      children: [
                                        Text(
                                            'Qoricha aramaa:                                 '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            ' -Poomii                                     ',
                                            ' -Avuukadoo ',
                                            ' -Muuzii ',
                                            ' -Garbuu ',
                                            '-Raafuu ',
                                            ' -Kaarotii ',
                                            '-Teemerii ',
                                            '-Baaqela',
                                            '-Loomii ',
                                            ' -Mandarin ',
                                            '-Millet ',
                                            ' -Qullubbi diimaa',
                                            ' -Burtukaana ',
                                            '-Roozii ',
                                            ' -Suufii',
                                            ' -Shaayii ',
                                            ' -Tiimatimii ',
                                            '-Qamadii ',
                                            ' -Qullubbi Adii  ',
                                            ' -Beans ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 20 && temperature < 30
                                  ? Column(
                                      children: [
                                        Text(
                                            'Qoricha aramaa:                               '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            ' -Poomii                                          ',
                                            ' -Avuukadoo ',
                                            ' -Muuzii ',
                                            ' -Garbuu ',
                                            ' -Kaarootii',
                                            '-Raafuu',
                                            '-Teemerii ',
                                            ' -Baaqelaa ',
                                            ' -Wayinii ',
                                             '-Loomii ',
                                            '-Boqqoloo ',
                                            ' -Mandarin ',
                                            '-Maangoo ',
                                            '-Millet ',
                                            '-Oil Palm ',
                                            '-Qullubbi diimaa ',
                                            '-Burtukaana ',
                                            '-Ruuzii ',
                                            '-Roozii',
                                            '-Suufii ',
                                            '-Maashelaa ',
                                            '-Shaayii',
                                            '-Timaatimii ',
                                            '-Qamadii ',
                                            '-Yam ',
                                            '-Ochoolonii ',
                                            '-Qullubbi adii ',
                                            '-kookanatii ',
                                            '-Xaafii ',
                                            '-Buna ',
                                            '-Beans ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 30
                                  ? Column(
                                      children: [
                                        Text(
                                            'Qoricha aramaa:                                    '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            ' -Kookanatii                                         ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 10 && temperature < 15
                                  ? Column(
                                      children: [
                                        Text('Facaasuu:'),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            '-Garbuu                                                  ',
                                            '-Raafuu ',
                                            '-Kaarootii ',
                                            ' -Baaqelaa ',
                                            '-Wayinii ',
                                            '-Boqolloo ',
                                            '-Qullubbii diimaa ',
                                            '-Dinaacha ',
                                            '-Suufii',
                                            '-Qullubbi adii',
                                            '-Qamadii',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 15 && temperature < 20
                                  ? Column(
                                      children: [
                                        Text(
                                            'Facaasuu:                                    '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            ' -Poomii                                            ',
                                            ' -Garbuu ',
                                            '-Raaduu ',
                                            ' -Kaarootii',
                                            '-Baaqelaa',
                                            '-Mandarin ',
                                            '-Millet  ',
                                            ' -Qullubbii diimaa ',
                                            ' -Dinaacha ',
                                            ' -Ruuzii',
                                            ' -Suufii',
                                            ' -Qullubbi adii ',
                                            '-Xaafii ',
                                            ' -Qamadii   ',
                                            ' -Beans',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 20 && temperature < 30
                                  ? Column(
                                      children: [
                                        Text(
                                            'Facaasuu:                                                  '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            '  -Avuukadoo                                             ',
                                            '-Muuzii                                                  ',
                                            ' -Kaarootii ',
                                            'Raafuu  ',
                                            '-Baaqellaa',
                                            '-Loomii ',
                                            ' -Mandarin ',
                                            '-Maangoo ',
                                            '-Millet ',
                                            '-Oil Palm ',
                                            '-Qullubbii diimaa',
                                            '-Burtukaana ',
                                            '-Dinaacha ',
                                            '-Roozii ',
                                            '-Suufii ',
                                            '-Maashelaa ',
                                            '-Shaayii ',
                                            '-Tiimatimii ',
                                            '-Yam ',
                                            '-Ochoolanaii  ',
                                            '-Kookanatii ',
                                            '-Xaafii ',
                                            '-Buna ',
                                            '-Beans  ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 30
                                  ? Column(
                                      children: [
                                        Text(
                                            'Facaasuu:                                          '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            ' -Teemerii                                                  ',
                                            ' -OilPalm ',
                                            '-Yam ',
                                            '-Kookanatii ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 10 && temperature < 15
                                  ? Column(
                                      children: [
                                        Text(
                                            'Lafaa Qotuu:                                       '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            ' -poomii                                           ',
                                            '-Muuzii ',
                                            '-Garbuu ',
                                            '-Raafuu ',
                                            '-Teemerii ',
                                            ' -Baaqelaa ',
                                            '-Wayinii ',
                                            '-Mandarin',
                                            '-Millet ',
                                            '-Qullubbii diimaa ',
                                            '-Dinaacha ',
                                            '-Suufii',
                                            '-Qullubbii adii  ',
                                            '-Tiimatimii ',
                                            '-Qamadiii ',
                                            '-Xaafii ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 15 && temperature < 20
                                  ? Column(
                                      children: [
                                        Text(
                                            'Lafaa Qotuu:                                              '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            '-Muuuzii                                                   ',
                                            ' -Garbuu ',
                                            ' -Teemerii ',
                                            '-Kaarootii',
                                            '-Baaqelaa',
                                            ' -Loomii ',
                                            '-Boqolloo ',
                                            '-Mandarin ',
                                            '-Millet  ',
                                            ' -Burtukaana ',
                                            '-Dinaacha ',
                                            ' -Roozii ',
                                            ' -Suufii',
                                            '-Maashelaa ',
                                            'Shaayii ',
                                            '-Qamadii ',
                                            ' -Ochoolonii ',
                                            '-Xaafii ',
                                            '-Qullubbii adii ',
                                            '-Beans ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 20 && temperature < 30
                                  ? Column(
                                      children: [
                                        Text(
                                            'Lafaa Qotuu:                                            '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            '-Avuukadoo                                                        ',
                                            '-Garbuu  ',
                                            '-Kaarootii ',
                                            '- Boqolloo ',
                                            ' -Baaqellaa ',
                                            '-Loomii ',
                                            '-Mandarin ',
                                            '-Maangoo ',
                                            '-Millet ',
                                            '-Oil Palm ',
                                            '-Burtukaana ',
                                            '-Ruuzii  ',
                                            '-Maashelaa ',
                                            '-Shaayii   ',
                                            '-Yam ',
                                            '-Ochoolonii  ',
                                            '-Kookanatii ',
                                            '-Xaafii ',
                                            '-Buna ',
                                            '-Beans  ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              temperature >= 30
                                  ? Column(
                                      children: [
                                        Text(
                                            'Lafaa Qotuu:                                     '),
                                        DropdownButton<String>(
                                          value: selectedPlantType,
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          items: [
                                            ' -Teemerii                                         ',
                                            '-Garbuu',
                                            '-Baaqelaa',
                                            '-OilPalm',
                                            '-Millet',
                                            '-Maashela',
                                            '-Ochoolonii ',
                                            '-Beans  ',
                                            '-Kookanatii ',
                                            ''
                                          ].map((type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )
                                  : Text(''),
                              const SizedBox(
                                height: 400,
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Internetiin hin jiru!'),
                    ElevatedButton(
                      onPressed: CheckUserConnection,
                      child: const Text('Irra deebi\ee yaalii!'),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  void _search() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    await CheckUserConnection();
    if (activeConnection == true) {
      setState(() {
        wrong = false;
      });
      print('search started');
      setState(() => searching = true);
      final statuscode =
          await _dataService.statuscodes(_cityTextController.text);
      print(statuscode);

      if (statuscode == 200) {
        final response =
            await _dataService.getWeather(_cityTextController.text);
        setState(() {
          //_response = response;
          sityName = response.cityName!;
          temperature = response.tempInfo!.temperature!.toInt();
          description = response.weatherInfo!.description!;
          iconUrl = response.iconUrl!;
        });
        setState(() {
          searching = false;
          _cityTextController.clear();
        });
      } else {
        setState(() {
          wrong = true;
        });
      }
    } else if (activeConnection == false) {
      setState(() {
        activeConnection = false;
      });
    }

    // print(response.cityName);
    // print(response.weatherInfo?.description);
    // print(response.weatherInfo?.description);
    // print(response.tempInfo?.temperature?.round());
  }

  Future CheckUserConnection() async {
    activeConnection = await InternetConnectionChecker().hasConnection;
    if (activeConnection == true) {
      print('YAY! Free cute dog pics!');
      setState(() {
        activeConnection = true;
      });
    } else {
      print('No internet :( Reason:');
    }
  }
}


//"https://giphy.com/gifs/juan-gabriel-sSgvbe1m3n93G"