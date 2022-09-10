import 'package:cybdom_podcast/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MyColors.darkBlue,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_outlined),
            label: "Download",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18.0),
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, Cybdom",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "Good day to listen to some podcast",
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        backgroundColor: MyColors.greyish),
                    onPressed: () {},
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.black54,
                    ),
                  ),
                )
              ],
            ),

            //  New Section
            const SizedBox(height: 24.0),
            Text(
              "Continue Listening",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12.0),
            Container(
              padding: const EdgeInsets.all(12),
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        "https://cybdom.tech/wp-content/uploads/2021/02/1-768x432.jpg",
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EP 19: Making Your Design Out of The Box",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          "Cybdom Tech",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: LinearProgressIndicator(
                                value: .5,
                                backgroundColor: MyColors.greyish,
                                color: MyColors.darkBlue,
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "15:24",
                              style: Theme.of(context).textTheme.labelSmall,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            //  New Section
            const SizedBox(height: 24.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Trending Categories",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                TextButton(
                  child: const Text(
                    "View All",
                    style: TextStyle(color: Colors.black54),
                  ),
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(height: 12.0),
            SizedBox(
              height: 120,
              child: PageView.builder(
                itemCount: 5,
                controller: PageController(
                  viewportFraction: .4,
                  initialPage: 1,
                ),
                itemBuilder: (context, i) => Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 14.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                              "https://cybdom.tech/wp-content/uploads/2020/04/wordpress-blog-app-in-flutter-768x432.jpg"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "Family Podcast",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),

            //  New Section
            const SizedBox(height: 24.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Top Podcast",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                TextButton(
                  child: const Text(
                    "View All",
                    style: TextStyle(color: Colors.black54),
                  ),
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(height: 12.0),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) => Container(
                margin: const EdgeInsets.only(bottom: 14.0),
                padding: const EdgeInsets.all(12),
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.black12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          "https://cybdom.tech/wp-content/uploads/2021/02/1-768x432.jpg",
                          fit: BoxFit.cover,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "EP 19: Making Your Design Out of The Box",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            "Cybdom Tech",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.lightBlue,
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.play_arrow,
                        color: MyColors.darkBlue,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
