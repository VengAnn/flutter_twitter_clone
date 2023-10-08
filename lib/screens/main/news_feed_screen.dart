import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twitter_clone/controllers/news_feed_controller.dart';

class NewsFeedScreen extends StatelessWidget {
  NewsFeedScreen({super.key});

  final _controller = Get.put(NewsFeedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsFeed Screen'),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SizedBox(
        height: Get.height,
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  // backgroundImage: NetworkImage(),
                  child: Text('PH'),
                ),
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'What\'s your mind?',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )),
                  ),
                )),
                IconButton(
                  onPressed: () {
                    _controller.pickImage();
                  },
                  icon: const Icon(Icons.image),
                ),
              ],
            ),
            const Divider(
              thickness: 2.0,
              //color: Colors.amber,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://1.bp.blogspot.com/-vdzLpHaoE8g/YCgchxEAyaI/AAAAAAAAEoQ/bUwLefj19mAaiGE6BEMHsIQ3-BiDEDpdgCLcBGAsYHQ/s590/Dasha%2BTaran%2Bphotos.jpg'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('name'),
                                Row(
                                  children: [
                                    Text(
                                      '1 hour ago',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Icon(
                                      Icons.public,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: null,
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                      //
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s'
                          'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Image.network(
                        'https://www.sukhbeerbrar.com/wp-content/uploads/2021/11/taaarannn_201312512_971878916686561_1371852452961023488_n-1-819x1024.jpg',
                        fit: BoxFit.cover,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: const Stack(
                                children: [
                                  Positioned(
                                    child: Text(
                                      '😍',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 15,
                                    child: Text(
                                      '😜',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 30,
                                    child: Text(
                                      '👌',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('1.5k Comments'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //
                      const Divider(),
                      //
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                              ),
                              onPressed: () {},
                              child: const Icon(
                                Icons.thumb_up,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          //one more elevatedbutton
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                              ),
                              onPressed: () {},
                              child: const Icon(
                                Icons.comment,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          //one button share
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                              ),
                              onPressed: () {},
                              child: const Icon(
                                Icons.share_rounded,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.grey),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
