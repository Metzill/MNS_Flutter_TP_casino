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
      home: const MyHomePage(title: 'Casino'),
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
    Slot(
        "bar",
        const Image(
          image: AssetImage("assets/images/bar.png"),
          height: 250,
          width: 250,
        )),
    Slot(
        "cerise",
        const Image(
          image: AssetImage("assets/images/cerise.png"),
          height: 250,
          width: 250,
        )),
    Slot(
        "cloche",
        const Image(
          image: AssetImage("assets/images/cloche.png"),
          height: 250,
          width: 250,
        )),
    Slot(
        "diamant",
        const Image(
          image: AssetImage("assets/images/diamant.png"),
          height: 250,
          width: 250,
        )),
    Slot(
        "fer-a-cheval",
        const Image(
          image: AssetImage("assets/images/fer-a-cheval.png"),
          height: 250,
          width: 250,
        )),
    Slot(
        "pasteque",
        const Image(
          image: AssetImage("assets/images/pasteque.png"),
          height: 250,
          width: 250,
        )),
    Slot(
        "sept",
        const Image(
          image: AssetImage("assets/images/sept.png"),
          height: 250,
          width: 250,
        ))
  ];

  Slot img1 = Slot(
      "sept",
      const Image(
        image: AssetImage("assets/images/sept.png"),
        height: 250,
        width: 250,
      ));
  Slot img2 = Slot(
      "sept",
      const Image(
        image: AssetImage("assets/images/sept.png"),
        height: 250,
        width: 250,
      ));
  Slot img3 = Slot(
      "sept",
      const Image(
        image: AssetImage("assets/images/sept.png"),
        height: 250,
        width: 250,
      ));

  String _gameOverText = "";

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
      img1 = images[3];
      img2 = images[3];
      img3 = images[3];
    });
    checkWin();
  }

  void superWin() {
    setState(() {
      img1 = images[6];
      img2 = images[6];
      img3 = images[6];
    });
    checkWin();
  }

  void checkWin() {
    if (img1.name == img2.name &&
        img2.name == img3.name &&
        img3.name == images[6].name) {
      _gameOverText = "Super Jackpot ! 🎉";
    } else if (img1.name == img2.name && img2.name == img3.name) {
      _gameOverText = "Jackpot";
    } else {
      _gameOverText = "You lost, try again !";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Bandit Manchot"),
      ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            color: (_gameOverText == "Super Jackpot ! 🎉")
                ? Colors.yellow
                : Colors.white),
        child: Column(
          children: [
            Row(children: [img1.img, img2.img, img3.img]),
            const SizedBox(height: 250),
            Text(
              _gameOverText,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshImage,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
