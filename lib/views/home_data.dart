import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeDataView extends StatefulWidget {
  String userName;
  String userImageProfile;
  String post;
  String postDesription;

  HomeDataView({
    super.key,
    required this.userName,
    required this.userImageProfile,
    required this.post,
    required this.postDesription,
  });

  @override
  State<HomeDataView> createState() => _HomeDataViewState();
}

class _HomeDataViewState extends State<HomeDataView> {
  List comments = [];
  bool isChecked = false;
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
                      widget.userImageProfile,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.userName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          Image.network(
            widget.post,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  isChecked = !isChecked;
                  setState(() {});
                },
                icon: Icon(
                  Icons.favorite,
                  color: isChecked ? Colors.red : Colors.grey,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {
                  showBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
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
                        );
                      });
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
          Text('${widget.userName} ${widget.postDesription}'),
        ],
      ),
    );
  }
}
