import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.network(
                    "https://cybdom.tech/wp-content/uploads/2020/04/cropped-Copie-de-cybdom-logo-4.png",
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "CybdomCast",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Listen to Various Great Topics of Podcast",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Listen to your favorite podcast episodes, donwload and listen offline. Anytime, anywhere with CybdomCast",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.black54),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/home'),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: Colors.blue.shade900,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 2.0),
                        width: 50,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Start listening",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
