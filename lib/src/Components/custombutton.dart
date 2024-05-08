import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double width;
  final double height;

  const NormalButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 111, 15),
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}

class ButtonOutline extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double width;
  final double height;
  const ButtonOutline(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                        width: 1, color: Color.fromARGB(255, 255, 111, 15))))),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style:
              TextStyle(color: Color.fromARGB(255, 255, 111, 15), fontSize: 15),
        ),
      ),
    );
  }
}

class GardientButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double width;
  final double height;
  const GardientButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.orange.shade300,
                const Color.fromARGB(255, 255, 111, 15)
              ]),
              borderRadius: BorderRadius.circular(5)),
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ));
  }
}

class SortButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double width;
  const SortButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
          width: width,
          height: 40,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 3),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: TextStyle(fontSize: 16)),
              const SizedBox(width: 15),
              Image.asset('images/assets/icon/dropdown_arrow2-512.webp',
                  width: 15, height: 15),
            ],
          )),
    );
  }
}

class MoneyButton extends StatelessWidget {
  final Function onTap;
  final String text;
  const MoneyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          width: 120,
          height: 35,
          child: Center(
              child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ))),
    );
  }
}

class CusIconButton extends StatelessWidget {
  final Function onTap;
  final String url;
  const CusIconButton({super.key, required this.onTap, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5, top: 15),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Image.asset(url, width: 25, height: 25),
      ),
    );
  }
}
