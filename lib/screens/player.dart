import 'package:flutter/material.dart';

import '../global.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        backgroundColor: MyColors.greyish,
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Text(
                    "Now Playing",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    width: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        backgroundColor: MyColors.greyish,
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.keyboard_control,
                        color: Colors.black54,
                      ),
                    ),
                  )
                ],
              ),

              //  New Section
              const SizedBox(height: 24.0),
              Image.network(
                  "https://cybdom.tech/wp-content/uploads/2021/02/1-768x432.jpg"),

              Column(
                children: [
                  Text(
                    "EP 19: Making Your Design Out of The Box",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "Cybdom Tech",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.rss_feed,
                          color: Colors.black54,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.ios_share,
                          color: Colors.black54,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.download_for_offline,
                          color: MyColors.darkBlue,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  const LinearProgressIndicator(
                    color: MyColors.darkBlue,
                    backgroundColor: MyColors.lightBlue,
                    value: .3,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "03:23",
                      ),
                      Text("15:25")
                    ],
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shuffle_rounded,
                      color: Colors.black54,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.black54,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.darkBlue,
                      shape: const CircleBorder(),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.play_arrow,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_right,
                      color: Colors.black54,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.replay,
                      color: Colors.black54,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
