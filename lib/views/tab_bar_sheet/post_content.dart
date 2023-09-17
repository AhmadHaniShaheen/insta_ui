import 'package:flutter/material.dart';
import 'package:instegram_bti/data/post_model.dart';

// ignore: must_be_immutable
class PostContent extends StatefulWidget {
  PostModel post;
  Function fun;

  PostContent({
    super.key,
    required this.post,
    required this.fun,
  });

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  List comments = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      widget.post.userImageProfile,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.post.userName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          Image.network(
            widget.post.post,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  widget.post.isFavarite = !widget.post.isFavarite;
                  setState(() {});
                },
                icon: Icon(
                  Icons.favorite,
                  color: widget.post.isFavarite ? Colors.red : Colors.grey,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {
                  // showBottomSheet(
                  //     context: context,
                  //     builder: (context) {
                  //       return SizedBox(
                  //         height: 400,
                  //         child: SingleChildScrollView(
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Column(
                  //               children: [
                  //                 Row(
                  //                   children: [
                  //                     Expanded(
                  //                       child: TextField(
                  //                         controller: controller,
                  //                       ),
                  //                     ),
                  //                     IconButton(
                  //                       onPressed: () {
                  //                         comments.add(controller.text);
                  //                         controller.clear();
                  //                         widget.fun();
                  //                       },
                  //                       icon: const Icon(
                  //                         Icons.add,
                  //                         size: 32,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 ...comments.map((e) {
                  //                   return ListTile(
                  //                     leading: const Icon(Icons.star),
                  //                     title: Text(e),
                  //                   );
                  //                 }).toList(),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     });
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (context, setState) => SizedBox(
                        height: 400,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: controller,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        comments.add(controller.text);
                                        controller.clear();
                                        widget.fun();
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        size: 32,
                                      ),
                                    ),
                                  ],
                                ),
                                ...comments.map((e) {
                                  return ListTile(
                                    leading: const Icon(Icons.star),
                                    title: Text(e),
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.comment,
                  size: 32,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text('${comments.length.toString()} comment')),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                  '${widget.post.userName} ${widget.post.postDesription}')),
        ],
      ),
    );
  }
}
