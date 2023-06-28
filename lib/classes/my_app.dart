import 'dart:math';
import 'package:flutter/material.dart';
import 'package:casino/classes/slot.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pomme, Poire et Ananas'),
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
  List<Slot> images = <Slot>[
    Slot("bar", const Image(image: AssetImage("assets/images/bar.png"))),
    Slot("cerise", const Image(image: AssetImage("assets/images/cerise.png"))),
    Slot("cloche", const Image(image: AssetImage("assets/images/cloche.png"))),
    Slot(
        "diamant", const Image(image: AssetImage("assets/images/diamant.png"))),
    Slot("fer-a-cheval",
        const Image(image: AssetImage("assets/images/fer-a-cheval.png"))),
    Slot("pasteque",
        const Image(image: AssetImage("assets/images/pasteque.png"))),
    Slot("sept", const Image(image: AssetImage("assets/images/sept.png")))
  ];

  Slot img1 =
      Slot("sept", const Image(image: AssetImage("assets/images/sept.png")));
  Slot img2 =
      Slot("sept", const Image(image: AssetImage("assets/images/sept.png")));
  Slot img3 =
      Slot("sept", const Image(image: AssetImage("assets/images/sept.png")));

  Slot getRandomImage() {
    final random = Random();
    var i = random.nextInt(images.length);
    return images[i];
  }

  void refreshImage() {
    setState(() {
      img1 = getRandomImage();
      img2 = getRandomImage();
      img3 = getRandomImage();
    });
    checkWin();
  }

  void normalWin() {
    setState(() {
      img1 = Slot("diamant",
          const Image(image: AssetImage("assets/images/diamant.png")));
      img2 = Slot("diamant",
          const Image(image: AssetImage("assets/images/diamant.png")));
      img3 = Slot("diamant",
          const Image(image: AssetImage("assets/images/diamant.png")));
    });
    checkWin();
  }

  void superWin() {
    setState(() {
      img1 = Slot(
          "sept", const Image(image: AssetImage("assets/images/sept.png")));
      img2 = Slot(
          "sept", const Image(image: AssetImage("assets/images/sept.png")));
      img3 = Slot(
          "sept", const Image(image: AssetImage("assets/images/sept.png")));
    });
    checkWin();
  }

  void checkWin() {
    if (img1.name == img2.name &&
        img2.name == img3.name &&
        img3.name == images[6].name) {
      const snackBar = SnackBar(
        content: Text("Super Jackpot ! 🎉"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (img1.name == img2.name && img2.name == img3.name) {
      const snackBar = SnackBar(
        content: Text("Jackpot"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      const snackBar = SnackBar(
        content: Text("You lost, try again !"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    super.initState();
    images.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Bandit Manchot"),
      ),
      body: Center(
        child: GridView.count(
            crossAxisCount: 3, children: [img1.img, img2.img, img3.img]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: superWin,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
