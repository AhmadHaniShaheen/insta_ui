import 'package:flutter/material.dart';
import 'package:instegram_bti/data/account_data.dart';
import 'package:instegram_bti/views/home_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              size: 32,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.comment_outlined,
              size: 32,
            ),
          ),
        ],
      ),
      body: ListView(
        children: accountData.map((e) {
          return HomeDataView(
            userName: e['user_name'],
            userImageProfile: e['user_image_profile'],
            post: e['post'],
            postDesription: e['post_desription'],
          );
        }).toList(),
      ),
    );
  }
}
