import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool isClicked = false;
  String resultValue = "";

  List<String> images = [];

  List<String> result = [];

  List<String> totalLetter = [];

  @override
  void initState() {
    resultValue = "boisson";
    images = [
      'images/boisson/boisson1.jpg',
      'images/boisson/boisson2.webp',
      'images/boisson/boisson3.jpg',
      'images/boisson/boisson4.webp'
    ];
    result = initEmptyList(resultValue.length);
    totalLetter = koocClavier(resultValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KoocUtils.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: KoocUtils.borderColor.withOpacity(0.3),
              height: 60.0,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              width: (MediaQuery.of(context).size.width * 0.8).toDouble(),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: List.generate(
                    images.length,
                    (index) => Card(
                          shadowColor: Colors.white60,
                          color: KoocUtils.fieldGgColor,
                          borderOnForeground: true,
                          child: Container(
                            width: 150.0,
                            height: 150.0,
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                                borderRadius: KoocUtils.borderRadius,
                                image: DecorationImage(
                                    image: AssetImage(images[index]),
                                    fit: BoxFit.fill)),
                          ),
                        )),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int index = 0; index < resultValue.length; index++)
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(2.0),
                      width:
                          (MediaQuery.of(context).size.width / 10).toDouble(),
                      height:
                          (MediaQuery.of(context).size.width / 10).toDouble(),
                      decoration: BoxDecoration(
                          borderRadius: KoocUtils.borderRadius,
                          color: KoocUtils.fieldGgColor,
                          border: Border.all(
                              color: KoocUtils.borderColor, width: 2)),
                      child: Text(
                        result.isNotEmpty ? result[index].toUpperCase() : '',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: SizedBox(
                      width:
                          (MediaQuery.of(context).size.width * 0.7).toDouble(),
                      child: GridView.count(
                        crossAxisCount: 6,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                            totalLetter.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      result[index] = totalLetter[index];
                                      isClicked = true;
                                    });

                                    if (index == result.length - 1) {
                                      dialogBuilder(
                                        context,
                                        () {
                                          setState(() {
                                            resultValue = "bruit";
                                            result = initEmptyList(
                                                resultValue.length);
                                            totalLetter =
                                                koocClavier(resultValue);
                                            images = [
                                              'asset/images/bruit/bruit.jpeg',
                                              'asset/images/bruit/bruit2.jpg',
                                              'asset/images/bruit/bruit3.jpg',
                                              'asset/images/bruit/bruit4.webp'
                                            ];
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    }
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 2.0,
                                          right: 2.0,
                                          left: 2.0,
                                          bottom: 4.0),
                                      alignment: Alignment.center,
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: KoocUtils.borderRadius,
                                          color: KoocUtils.btnGrayColor,
                                          border: Border.all(
                                              color: KoocUtils.borderColor)),
                                      child: Text(
                                        totalLetter[index].toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: KoocUtils.textColor),
                                      )),
                                )),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          for (int index = 0; index < 2; index++)
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 2.0, right: 2.0, left: 2.0, bottom: 4.0),
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: KoocUtils.borderRadius,
                                  color:
                                      KoocUtils.btnGreenColor.withOpacity(0.5),
                                  border:
                                      Border.all(color: KoocUtils.borderColor)),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: SizedBox(
                      width:
                          (MediaQuery.of(context).size.width * 0.7).toDouble(),
                      child: GridView.count(
                        crossAxisCount: 6,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                            totalLetter.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      result[index] = totalLetter[index];
                                      isClicked = true;
                                    });

                                    if (index == result.length - 1) {
                                      dialogBuilder(
                                        context,
                                        () {
                                          setState(() {
                                            resultValue = "rond";
                                            result = initEmptyList(
                                                resultValue.length);
                                            totalLetter =
                                                koocClavier(resultValue);
                                            images = [
                                              'assets/images/rond/rond1.jpg',
                                              'assets/images/rond/rond2.jpg',
                                              'assets/images/rond/rond3.webp',
                                              'assets/images/rond/rond4.jpg',
                                            ];
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    }
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 2.0,
                                          right: 2.0,
                                          left: 2.0,
                                          bottom: 4.0),
                                      alignment: Alignment.center,
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: KoocUtils.borderRadius,
                                          color: KoocUtils.btnGrayColor,
                                          border: Border.all(
                                              color: KoocUtils.borderColor)),
                                      child: Text(
                                        totalLetter[index].toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: KoocUtils.textColor),
                                      )),
                                )),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          for (int index = 0; index < 2; index++)
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 2.0, right: 2.0, left: 2.0, bottom: 4.0),
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: KoocUtils.borderRadius,
                                  color:
                                      KoocUtils.btnGreenColor.withOpacity(0.5),
                                  border:
                                      Border.all(color: KoocUtils.borderColor)),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),
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
