import 'package:vimigo/models/post.dart';
import 'package:vimigo/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:vimigo/views/comment_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false, isSorted = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
    // test();
  }

  getData() async {
    posts = await RemoteService().getPosts(isSorted);
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  test() {
    setState(() {
      isSorted = !isSorted;
      getData();
    });
  }

  Widget buildPostListview() {
    return Expanded(
      child: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 200),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ignore: unnecessary_string_interpolations
                              Text("${posts![index].title}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 15),
                              Text(
                                "${posts![index].userId.toString()} - ${posts![index].body}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Center(
          child: Text('Posts', style: TextStyle(color: Colors.black))),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                test();
              });
            },
            icon: const Icon(Icons.sort_outlined))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const CommentBox(), buildPostListview()],
          ),
        ));
  }
}
