import 'package:flutter/material.dart';
import 'package:instegram_bti/data/post_data.dart';
import 'package:instegram_bti/views/tab_bar_sheet/post_content.dart';

// ignore: must_be_immutable
class FavariteData extends StatefulWidget {
  Function fun;
  FavariteData({super.key, required this.fun});

  @override
  State<FavariteData> createState() => _FavariteDataState();
}

class _FavariteDataState extends State<FavariteData> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return PostContent(
          post: accountData.where((element) {
            return element.isFavarite;
          }).toList()[index],
          fun: widget.fun,
        );
      },
      itemCount: accountData.where((element) {
        return element.isFavarite;
      }).length,
    );
  }
}
