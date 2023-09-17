import 'package:flutter/material.dart';
import 'package:instegram_bti/data/post_data.dart';
import 'package:instegram_bti/views/tab_bar_sheet/post_content.dart';

// ignore: must_be_immutable
class HomeData extends StatefulWidget {
  Function fun;
  HomeData({super.key, required this.fun});

  @override
  State<HomeData> createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return PostContent(post: accountData[index], fun: widget.fun);
      },
      itemCount: accountData.length,
    );
  }
}
