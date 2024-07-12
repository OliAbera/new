import 'package:ethio_agri_smart/MarkDownPage.dart';
import 'package:ethio_agri_smart/Setting.dart';
import 'package:ethio_agri_smart/main.dart';
import 'package:ethio_agri_smart/model/crop_model.dart';
import 'package:ethio_agri_smart/onePsound.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchPageO(),
    );
  }
}

class SearchPageO extends StatefulWidget {
  const SearchPageO({Key? key}) : super(key: key);

  @override
  State<SearchPageO> createState() => _SearchPageOState();
}

class _SearchPageOState extends State<SearchPageO> {
  static List<CropModel> main_crops_list = [
    CropModel(
        "Lii Afrikaa: Agapanthus ",
        "https://w7.pngwing.com/pngs/190/780/png-transparent-water-lily-water-lily-computer-wallpaper-sacred-lotus-flower-thumbnail.png",
        'African_lilyO.md'),
            CropModel(
        "Vaayilaayitii Afrikaa: Saintpaulia spp ",
        "https://w7.pngwing.com/pngs/907/75/png-transparent-sweet-violet-african-violets-parma-violet-others-purple-violet-color-thumbnail.png",
        'African_violetO.md'),
    CropModel(
        "Appilii:Malus sylvestris",
        "https://w7.pngwing.com/pngs/653/960/png-transparent-apple-apple-food-heart-fruit-thumbnail.png",
        'appleO.md'),
    CropModel(
        "Avokaadoo:Persea Americana",
        "https://w7.pngwing.com/pngs/381/546/png-transparent-avocado-guacamole-euclidean-fruit-avocado-natural-foods-food-logo-thumbnail.png",
        'avocadoO.md'),
    CropModel(
        "Muuzii:Musa acuminata",
        "https://w7.pngwing.com/pngs/731/89/png-transparent-banana-yellow-bananas-image-file-formats-food-orange-thumbnail.png",
        'BananaO.md'),
    CropModel(
        "Berries: Fragaria ananassa",
        "https://w7.pngwing.com/pngs/834/345/png-transparent-sour-cherry-berry-cherry-natural-foods-food-photography-thumbnail.png",
        'BerriesO.md'),
    CropModel(
        "Garbuu: Hordeum vulgare",
        "https://w7.pngwing.com/pngs/911/669/png-transparent-beer-barley-cereal-beer-grass-beer-rice-thumbnail.png",
        'BarleyO.md'),
    CropModel(
        "Kotoree: Phaseolus vulgaris ",
        "https://w7.pngwing.com/pngs/345/888/png-transparent-kidney-bean-common-bean-red-beans-and-rice-drybeans-food-photography-adzuki-bean-thumbnail.png",
        'BeansO.md'),
    CropModel(
        "Bell  peppeerii: Capsicum annuum ",
        "https://w7.pngwing.com/pngs/446/457/png-transparent-bell-pepper-chili-pepper-vegetable-paprika-bell-pepper-natural-foods-food-tomato-thumbnail.png",
        'Bell_peppersO.md'),
    CropModel(
        "Birookilii: Brassica oleracea ",
        "https://w7.pngwing.com/pngs/362/547/png-transparent-broccoli-broccoli-fresh-fruits-thumbnail.png",
        'BroccoliO.md'),
    CropModel(
        "Raafuu maraa:Hordeum vulgare",
        "https://w7.pngwing.com/pngs/874/309/png-transparent-cabbage-roll-carrot-napa-cabbage-vegetable-cabbage-leaf-vegetable-food-napa-cabbage-thumbnail.png",
        'cabbageO.md'),
    CropModel(
        "Kaarotii:Daucus carota",
        "https://w7.pngwing.com/pngs/140/351/png-transparent-carrot-vegetable-carrot-natural-foods-food-orange-thumbnail.png",
        'CarrotO.md'),
    CropModel(
        "Kauliflowerii: Brassica oleracea var. botrytis",
        "https://w7.pngwing.com/pngs/749/252/png-transparent-fried-cauliflower-dal-broccoli-cauliflower-leaf-vegetable-food-recipe-thumbnail.png",
        'CauliflowerO.md'),
    CropModel(
        "Buna: Cofea",
        "https://w7.pngwing.com/pngs/75/914/png-transparent-arabica-coffee-cafe-coffee-bean-coffee-roasting-coffee-food-cafe-coffee-thumbnail.png",
        'CoffeeO.md'),
    CropModel(
        "Jirbii: Gossypium hirsutum  or Gossypium barbadense",
        "https://w7.pngwing.com/pngs/757/531/png-transparent-white-cotton-sea-island-cotton-sateen-bt-cotton-seed-cotton-plant-textile-branch-computer-wallpaper-thumbnail.png",
        'CottonO.md'),
    CropModel(
        "Teemirii:Phoenix Dactylifera",
        "https://w7.pngwing.com/pngs/1022/516/png-transparent-date-palm-dates-dried-fruit-food-date-palm-eating-arecaceae-fruit-thumbnail.png",
        'DatesO.md'),
    CropModel(
        "Baaqelaa:Tuberous Pea",
        "https://w7.pngwing.com/pngs/889/806/png-transparent-pea-pod-peas-natural-foods-food-sticker-thumbnail.png",
        'Earth-PeaO.md'),
    CropModel(
        "Eggplantii: Solanum melongena",
        "https://w7.pngwing.com/pngs/27/797/png-transparent-eggplant-vegetable-eggplant-purple-food-violet-thumbnail.png",
        'EggplantsO.md'),
    CropModel(
        "Muuzii Itiyoophiyaa: Ensete ventricosum",
        "https://w7.pngwing.com/pngs/332/204/png-transparent-banana-banana-natural-foods-food-fitness-thumbnail.png",
        'Ethiopian_BananaO.md'),
    CropModel(
        "Muustardii Itiyoophiyaa: Brassica carinata ",
        "https://w7.pngwing.com/pngs/698/159/png-transparent-sarso-oil-mustard-oil-thumbnail.png",
        'Ethiopian_mustardO.md'),
    CropModel(
        "Qaaraa Itiyoophiyaa: Aframomum corrorima",
        "https://w7.pngwing.com/pngs/846/598/png-transparent-serrano-pepper-chili-con-carne-pasilla-chili-pepper-pepper-creative-leaf-creative-artwork-creative-ads-thumbnail.png",
        'Ethiopian_PeppersO.md'),
    CropModel(
        "Rozwoodii Itiyoophiyaa: Dalbergia melanoxylon",
        "https://w7.pngwing.com/pngs/47/472/png-transparent-narra-tree-dalbergieae-rosewood-plumeria-branch-plane-trees-arecaceae-thumbnail.png",
        'Ethiopian_rose_woodO.md'),
    CropModel(
        "Wayinii:Vitis Vinifera L.",
        "https://w7.pngwing.com/pngs/456/89/png-transparent-grapes-juice-isabella-common-grape-vine-table-grape-grape-pattern-natural-foods-frutti-di-bosco-food-thumbnail.png",
        'GrapesO.md'),
    CropModel(
        "Qaaraa: Capsicum annuum",
        "https://w7.pngwing.com/pngs/357/687/png-transparent-green-bell-pepper-chili-pepper-peppers-natural-foods-image-file-formats-food-thumbnail.png",
        'Green_pepperO.md'),
    CropModel(
        "Guavas:  Psidium guajava",
        "https://w7.pngwing.com/pngs/62/197/png-transparent-sliced-guava-fruits-common-guava-tropical-fruit-strawberry-guava-guava-natural-foods-food-orange-thumbnail.png",
        'GuavasO.md'),
    CropModel(
        "Kale:   Brassica oleracea var. sabellica",
        "https://w7.pngwing.com/pngs/152/4/png-transparent-minestrone-kale-leaf-vegetable-smoothie-kale-food-spinach-cabbage-thumbnail.png",
        'KaleO.md'),
    CropModel(
        "Legumes:  Chickpea, Garbanzo bean ",
        "https://w7.pngwing.com/pngs/174/7/png-transparent-peanut-lot-peanut-seed-legume-pistachio-peanut-miscellaneous-food-wholesale-thumbnail.png",
        'LegumesO.md'),
    CropModel(
        "Loomii:Citrus Limon",
        "https://w7.pngwing.com/pngs/486/920/png-transparent-lemon-fruit-lemon-natural-foods-food-citrus-thumbnail.png",
        'LemonO.md'),
    CropModel(
        "Salaaxaa:  Lactuca sativa",
        "https://w7.pngwing.com/pngs/88/637/png-transparent-romaine-lettuce-graphy-lettuce-leaves-vegetables-watercolor-leaves-leaf-vegetable-food-thumbnail.png",
        'LettuceO.md'),
    CropModel(
        "Limes:   Citrus aurantifolia",
        "https://w7.pngwing.com/pngs/274/772/png-transparent-key-lime-sweet-lemon-lemon-lime-drink-lime-natural-foods-food-citrus-thumbnail.png",
        'LimesO.md'),
    CropModel("Boqqolloo:Zea mays", "https://wallpapercave.com/wp/wp2570209.jpg",
        'MaizeO.md'),
    CropModel(
        "Mandarin:  Kid glove oranges, loose-skin oranges, tangerine oranges, tangerines",
        "https://w7.pngwing.com/pngs/520/639/png-transparent-mandarin-orange-desktop-others-natural-foods-food-orange-thumbnail.png",
        'MandarinO.md'),
    CropModel(
        "Maangoo:Mangifera Indica",
        "https://w7.pngwing.com/pngs/733/28/png-transparent-red-mangoes-juice-smoothie-mango-health-eating-mango-natural-foods-food-orange-thumbnail.png",
        'MangoO.md'),
    CropModel(
        "Millet:Pennisetum glaucom",
        "https://w7.pngwing.com/pngs/548/594/png-transparent-finger-millet-organic-food-proso-millet-millet-miscellaneous-food-glitter-thumbnail.png",
        'MilletO.md'),
    CropModel(
        "Mushrooma: Agaricus spp",
        "https://w7.pngwing.com/pngs/846/566/png-transparent-mushroom-fungus-mushroom-food-animation-common-mushroom-thumbnail.png",
        'MushroomsO.md'),
    CropModel(
        "Oilpalmii:Elaeis Guineensis",
        "https://w7.pngwing.com/pngs/645/649/png-transparent-palm-oil-palm-kernel-oil-cooking-oils-african-oil-palm-oil-miscellaneous-nutrition-oil-thumbnail.png",
        'Oil_palmO.md'),
    CropModel(
        "Sanyii zayitaa:  Helianthus annuus ",
        "https://w7.pngwing.com/pngs/147/606/png-transparent-castor-oil-ricinus-sesame-oil-seed-oil-oil-miscellaneous-olive-oil-thumbnail.png",
        'Oil_seedO.md'),
    CropModel(
        "Okra:  Abelmoschus esculentus",
        "https://w7.pngwing.com/pngs/217/236/png-transparent-lady-finger-vegetable-gumbo-ladyfinger-okra-vegetable-fruit-okra-natural-foods-leaf-vegetable-food-thumbnail.png",
        'OkraO.md'),
    CropModel(
        "Qullubbii diimaa:Allium cepa",
        "https://w7.pngwing.com/pngs/992/6/png-transparent-red-onion-food-vegetable-shallot-yellow-onion-onion-food-nutrition-onion-thumbnail.png",
        'OnionO.md'),
    CropModel(
        "burtukaana:Citrus x sinensis",
        "https://w7.pngwing.com/pngs/193/536/png-transparent-orange-citrus-fruit-orange-juice-fruit-fresh-orange-natural-foods-food-olive-thumbnail.png",
        'orangeO.md'),
    CropModel(
        "Paapaayaa:  Carica papaya",
        "https://w7.pngwing.com/pngs/19/949/png-transparent-papaya-fruit-papaya-fruit-auglis-papaya-natural-foods-dried-fruit-food-thumbnail.png",
        'PapayaO.md'),
    CropModel(
        "Peechisii:  Prunus persica",
        "https://w7.pngwing.com/pngs/642/518/png-transparent-peach-peach-food-orange-sticker-thumbnail.png",
        'peachesO.md'),
    CropModel(
        "Baaqilaa:    Pisum sativum",
        "https://w7.pngwing.com/pngs/939/560/png-transparent-pea-pea-natural-foods-food-fruit-thumbnail.png",
        'peaO.md'),
    CropModel(
        "Anaanaasii:   Ananas comosus",
        "https://w7.pngwing.com/pngs/9/79/png-transparent-pineapple-fruit-pineapple-pineapple-fruit-pineapple-clipart-thumbnail.png",
        'Pine_appleO.md'),
    CropModel(
        "Dinaacha:Solanum tuberosum",
        "https://w7.pngwing.com/pngs/320/313/png-transparent-potato-vegetable-tomato-onion-food-potato-food-tomato-onion-thumbnail.png",
        'potatoO.md'),
    CropModel(
        "Puulsii:   Phaseolus vulgaris",
        "https://w7.pngwing.com/pngs/847/797/png-transparent-edamame-soy-milk-organic-food-soybean-pea-food-fruit-vegetables-thumbnail.png",
        'PulsesO.md'),
    CropModel(
        "Buqqee:   Cucurbita pepo",
        "https://w7.pngwing.com/pngs/43/981/png-transparent-pumpkin-pumpkin-pumpkin-natural-foods-food-orange-thumbnail.png",
        'PumpkinO.md'),
    CropModel(
        "Hundee diimaa:  Raphanus sativus ",
        "https://w7.pngwing.com/pngs/245/365/png-transparent-sugar-beet-vegetable-beetroot-radish-beet-leaf-vegetable-food-leaf-thumbnail.png",
        'RadishO.md'),
    CropModel(
        "Barbaree: Capsicum annuum ",
        "https://w7.pngwing.com/pngs/993/988/png-transparent-red-bell-pepper-bell-pepper-chili-pepper-red-pepper-natural-foods-food-vegetables-thumbnail.png",
        'Red_pepperO.md'),
    CropModel(
        "Ruuzii:Orzya Sativa",
        "https://w7.pngwing.com/pngs/975/501/png-transparent-rice-field-rice-cake-rice-pudding-rice-food-grass-plant-stem-thumbnail.png",
        'RiceO.md'),
    CropModel(
        "Roozii:Rosa rubiginosa",
        "https://w7.pngwing.com/pngs/731/230/png-transparent-red-rose-illustration-blue-rose-red-rose-purple-blue-image-file-formats-thumbnail.png",
        'roseO.md'),
    CropModel(
        "Maashelaa:Sorghum bicolor(L.)Moench",
        "https://w7.pngwing.com/pngs/954/242/png-transparent-broom-corn-sweet-sorghum-grain-seed-food-sorghum-white-nutrition-superfood-thumbnail.png",
        'sorghumO.md'),
    CropModel(
        "Qoosxaa: Spinacia oleracea",
        "https://w7.pngwing.com/pngs/644/961/png-transparent-vegetarian-cuisine-leaf-vegetable-spinach-salad-spinach-food-leaf-eating-thumbnail.png",
        'SpinachO.md'),
    CropModel(
        "Shonkara: Saccharum officinarum",
        "https://w7.pngwing.com/pngs/525/609/png-transparent-green-sugarcane-sugarcane-saccharum-officinarum-icon-green-cane-cane-sugar-cane-real-shot-chart-food-green-apple-fruit-thumbnail.png",
        'SugaracaneO.md'),
    CropModel(
        "Suufii:Carthamus tinctorius",
        "https://w7.pngwing.com/pngs/563/723/png-transparent-three-sunflowers-common-sunflower-sunflower-seed-sunflower-sunflower-flower-flowers-thumbnail.png",
        'sunflowerO.md'),
    CropModel(
        "Dinaacha mi'aawaa: pomoea batatas",
        "https://w7.pngwing.com/pngs/908/946/png-transparent-sweet-potato-illustration-sweet-potato-nutrition-vegetable-yam-sweet-potato-food-cooking-sweetness-thumbnail.png",
        'sweet_potatoesO.md'),
    CropModel(
        "Chaardii Siwiizarlaand:   Beta vulgaris subsp. cicla.",
        "https://w7.pngwing.com/pngs/815/716/png-transparent-spinach-illustration-chard-switzerland-vegetable-rainbow-swiss-chard-leaf-vegetable-food-leaf-thumbnail.png",
        'Swiss_chardO.md'),
    CropModel(
        "Shaayii: Camellia sinensis",
        "https://w7.pngwing.com/pngs/644/368/png-transparent-green-tea-herbal-tea-tea-bag-green-tea-leaf-tea-herbal-tea-thumbnail.png",
        'TeaO.md'),
    CropModel(
        "Xaafii: Eragrostis tefF",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM8oR3WLydgIvX2aDlxeKDiYWwkWmd2seEsfPUFkmd8_v_Dh20WM-r78m-nifRUj_LCTo&usqp=CAU",
        'TeffO.md'),
    CropModel(
        "Tamboo:  Grand title Nicotiana",
        "https://w7.pngwing.com/pngs/516/430/png-transparent-cigarette-tobacco-vices-addictions-thumbnail.png",
        'TobaccoO.md'),
    CropModel(
        "Tiimatimii: Solanum lycopersicum",
        "https://w7.pngwing.com/pngs/974/789/png-transparent-tomato-soup-tomato-juice-tomato-thumbnail.png",
        'TomatoO.md'),
    CropModel(
        "Tuurniips: Brassica rapa subsp. rapa",
        "https://w7.pngwing.com/pngs/1008/20/png-transparent-radish-food-turnip-graphy-vegetable-natural-foods-food-photography-thumbnail.png",
        'TurnipsO.md'),
    CropModel(
        "Harbuu: Genus Citrullus",
        "https://w7.pngwing.com/pngs/816/249/png-transparent-watermelon-fruit-vegetable-food-watermelon-natural-foods-food-orange-thumbnail.png",
        'WatermelonsO.md'),
    CropModel(
        "Qamadii:Triticum",
        "https://w7.pngwing.com/pngs/848/147/png-transparent-wheat-wheat-food-photography-plant-stem-thumbnail.png",
        'WheatO.md'),
    CropModel(
        "Yaamii: Purple yam, winged yam, greater yam",
        "https://w7.pngwing.com/pngs/360/470/png-transparent-sweet-potato-vegetable-yam-organic-food-sweet-potato-food-nutrition-eating-thumbnail.png",
        'YamO.md'),
    CropModel(
        "Zuukiinii: Cucurbita pepo",
        "https://w7.pngwing.com/pngs/17/91/png-transparent-green-zucchini-cucumber-israeli-salad-vegetable-fruit-food-cucumber-pickled-cucumber-melon-vegetables-thumbnail.png",
        'ZucchiniO.md'),
  ];

  List<CropModel> display_list = List.from(main_crops_list);

  void updateList(String value) {
    setState(() {
      display_list = main_crops_list
          .where((element) =>
              element.crop_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Midhaan barbaaduu"),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return TextToSpeechApp1();
                },
              ));
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SettingsPage();
                },
              ));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Barbaacha gochuuf as barreessi...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: display_list.isEmpty
                  ? const Center(
                      child: Text(
                        "Bu'aan hin argamne",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return MarkDownPage(
                                title: display_list[index].crop_title,
                                mdName: display_list[index].mdPath ?? 'default.md',
                              );
                            },
                          ));
                        },
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.all(8.0),
                              title: Text(
                                display_list[index].crop_title!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              leading: ClipOval(
                                child: Image.network(
                                  display_list[index].crop_poster_url!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const Divider(color: Colors.white),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
