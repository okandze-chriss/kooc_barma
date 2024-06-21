import 'dart:math';
import 'package:flutter/material.dart';

class KoocUtils {
  static BorderRadius borderRadius = BorderRadius.circular(6);
  static const Color bgColor = Color(0xFF242c43);
  static const Color fieldGgColor = Color(0xFF161a2a);
  static const Color btnGreenColor = Color(0xffb0d800);
  static const Color btnGrayColor = Color(0xffdedede);
  static const Color borderColor = Color(0xff374e86);
  static const Color textColor = Color(0xff151519);
  static const Color btnClickColor = Color(0xff353d51);

  static const List<String> aphabet = [
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
}

List<String> koocClavier(String mot) {
  List<String> letters = [];

  for (var i = 0; i < mot.length; i++) {
    letters.add(mot[i]);
  }

  for (var i = mot.length; i < 12; i++) {
    letters.add(getRandomString());
  }

  return letters;
}

String getRandomString() {
  const String characters = 'abcdefghijklmnopqrstuvwxyz';
  var r = Random();
  return String.fromCharCodes(List.generate(
      1, (_) => characters.codeUnitAt(r.nextInt(characters.length))));
}

List<String> initEmptyList(int length) {
  List<String> values = [];
  for (var i = 0; i < length; i++) {
    values.add('');
  }
  return values;
}

List<String> stringToList(String word) {
  List<String> values = [];
  for (var i = 0; i < word.length; i++) {
    values.add(word[i]);
  }
  return values;
}

bool compareTwoList(List<dynamic> listOne, List<dynamic> listTwo) {
  return listOne.join('') == listTwo.join('');
}

Future<void> dialogBuilder(BuildContext context, Function()? onPressed) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        title: const Text('Basic dialog title'),
        content: const SizedBox(
          height: double.maxFinite,
          child: Column(
            children: [
              Text(
                'A dialog is a type of modal window that\n'
                'appears in front of app content to\n'
                'provide critical information, or prompt\n'
                'for a decision to be made.',
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20.0)),
                    shape: const MaterialStatePropertyAll<OutlinedBorder>(
                        LinearBorder.none),
                    backgroundColor: MaterialStatePropertyAll(
                        KoocUtils.btnGreenColor.withOpacity(0.5)),
                    textStyle: const MaterialStatePropertyAll(
                        TextStyle(color: KoocUtils.textColor))),
                child: const Text(
                  'Continuer',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
          )
        ],
      );
    },
  );
}

Future<void> errorBuilder(BuildContext context, Function()? onPressed) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        title: const Text('Basic dialog title'),
        content: const SizedBox(
          height: double.maxFinite,
          child: Column(
            children: [
              Text(
                'A dialog is a type of modal window that\n'
                'appears in front of app content to\n'
                'provide critical information, or prompt\n'
                'for a decision to be made.',
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20.0)),
                    shape: const MaterialStatePropertyAll<OutlinedBorder>(
                        LinearBorder.none),
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                    textStyle: const MaterialStatePropertyAll(
                        TextStyle(color: KoocUtils.textColor))),
                child: const Text(
                  'Continuer',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
          )
        ],
      );
    },
  );
}
