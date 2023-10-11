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
                        ),
                      ),
                    ),
                  ),
                ),
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
              child: GetBuilder<NewsFeedController>(
                builder: (_) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      _controller.getAllPost();
                    },
                    child: ListView.builder(
                      itemCount: _controller.posts.data != null
                          ? _controller.posts.data!.length
                          : 0,
                      itemBuilder: (context, index) {
                        final post = _controller.posts.data![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                post.user!.profileUrl != null
                                    ? CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          "http://192.168.0.108:8000/users/${post.user!.profileUrl}",
                                        ),
                                      )
                                    : const CircleAvatar(
                                        child: Text("P"),
                                      ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${post.user!.name}'),
                                      const Row(
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
                                const Spacer(),
                                const IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.more_horiz),
                                ),
                              ],
                            ),
                            //
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${post.caption}',
                                textAlign: TextAlign.justify,
                              ),
                            ),

                            post.imageUrl == null
                                ? const SizedBox()
                                : Center(
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "http://192.168.0.108:8000/posts/${post.imageUrl}",
                                      ),
                                      // loadingBuilder: (_, child, loadingProgress) {
                                      //   if (loadingProgress == null) {
                                      //     // Image is fully loaded, return the child widget
                                      //     return child;
                                      //   } else {
                                      //     return const CircularProgressIndicator();
                                      //   }
                                      // },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          child: const Icon(
                                            Icons.broken_image_rounded,
                                            size: 50,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        const Positioned(
                                          child: Text(
                                            '😍',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        const Positioned(
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
                                          child: Row(
                                            children: [
                                              const Text(
                                                '👌',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              //
                                              Text("${post.likesCount} Likes"),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                                '${post.commentsCount} comments'),
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
                                      // foregroundColor: Colors.red,
                                    ),
                                    onPressed: () {
                                      _controller.likeDisLike(postId: post.id!);
                                    },
                                    child: Icon(
                                      Icons.thumb_up,
                                      color: post.liked!
                                          ? Colors.blue
                                          : Colors.grey,
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
                                border:
                                    Border.all(width: 5, color: Colors.grey),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
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
