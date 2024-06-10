import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List<String> images = [
    //   'images/boisson/boisson1.jpg',
    //   'images/boisson/boisson2.webp',
    //   'images/boisson/boisson3.jpg',
    //   'images/boisson/boisson4.webp'
    // ];
    List<String> images = [
      'images/bruit/bruit.jpeg',
      'images/bruit/bruit2.jpg',
      'images/bruit/bruit3.jpg',
      'images/bruit/bruit4.webp'
    ];

    List<String> aphabet = [
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "i",
      "j",
      "k",
      "l",
      "m",
      "n",
      "o",
      "p",
      "q",
      "r",
      "s",
      "t",
      "u",
      "v",
      "w",
      "x",
      "y",
      "z"
    ];

    List<String> result = ['B', 'R', 'U', 'I', 'T'];

    BorderRadius border = BorderRadius.circular(6);
    int totalLetter = 7;
    int totalLetterValue = 5;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 3, 41),
      body: Container(
        color: const Color(0xFF242c43),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: List.generate(
                  images.length,
                  (index) => Card(
                        shadowColor: Colors.white60,
                        color: const Color(0xFF161a2a),
                        borderOnForeground: true,
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          padding: const EdgeInsets.all(4.0),
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              borderRadius: border,
                              image: DecorationImage(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.fill)),
                        ),
                      )),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int index = 0; index < totalLetterValue; index++)
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(2.0),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: border,
                          color: const Color(0xFF161a2a),
                          border: Border.all(
                              color: const Color(0xff374e86), width: 2)),
                      child: Text(
                        result[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int index = 0; index < totalLetter; index++)
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          alignment: Alignment.center,
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: border,
                              color: index == totalLetter - 1
                                  ? const Color(0xffb0d800)
                                  : const Color(0xffdedede),
                              border:
                                  Border.all(color: const Color(0xff374e86))),
                          child: index == totalLetter - 1
                              ? const Icon(
                                  Icons.abc,
                                  color: Colors.white,
                                )
                              : Text(
                                  aphabet[index].toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff151519)),
                                ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int index = 0; index < totalLetter; index++)
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          width: 35,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: border,
                              color: index == totalLetter - 1
                                  ? const Color(0xffb0d800)
                                  : const Color(0xffdedede),
                              border: Border.all(
                                  color: const Color(0xff374e86),
                                  style: BorderStyle.solid)),
                          child: index == totalLetter - 1
                              ? const Icon(
                                  Icons.delete_forever_rounded,
                                  color: Colors.white,
                                )
                              : Text(
                                  aphabet[index + 7].toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff151519)),
                                ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
