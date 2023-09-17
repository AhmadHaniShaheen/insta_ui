import 'package:flutter/material.dart';
import 'package:instegram_bti/views/tab_bar_sheet/home_data.dart';
import 'package:instegram_bti/views/tab_bar_sheet/favarite_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: const TabBar(tabs: [
            Tab(text: 'Home'),
            Tab(text: 'Favarite'),
          ]),
        ),
        body: TabBarView(children: [
          HomeData(
            fun: updateUi,
          ),
          FavariteData(
            fun: updateUi,
            
          ),
        ]),
      ),
    );
  }
}
