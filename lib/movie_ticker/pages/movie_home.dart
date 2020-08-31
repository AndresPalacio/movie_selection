import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticker/movie_ticker/constants.dart';
import 'package:movie_ticker/movie_ticker/models/billboard.dart';

import 'widgets/billboard_list.dart';
import 'widgets/header_option.dart';

final ScrollController _scrollController = ScrollController();

class MovieHome extends StatelessWidget {
  final resizeNotifier = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightAppBar = size.height * .15;
    final resizeValue = heightAppBar * .4;
    final billboardList = Billboard.billboardList;

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    resizeNotifier.value = heightAppBar;
    // });
    _scrollController.addListener(() {
      if (_scrollController.offset < (resizeValue))
        resizeNotifier.value = heightAppBar - _scrollController.offset;
    });
    return Scaffold(
        backgroundColor: kPrimaryColorDark,
        body: Stack(
          children: <Widget>[
            ListView.builder(
              controller: _scrollController,
              itemCount: billboardList.length,
              padding: EdgeInsets.only(top: heightAppBar+10),
              itemBuilder: (context, index) {
                return BillboardList(billboard: billboardList[index]);
              },
            ),
            ValueListenableBuilder<double>(
                valueListenable: resizeNotifier,
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColorHeavy,
                    boxShadow: [
                      BoxShadow(
                        color: kPrimaryColorDark.withOpacity(.4),
                        blurRadius: 15,
                      )
                    ],
                  ),
                  child: Row(children: <Widget>[
                    HeaderOption(
                      title: "Cinema",
                      isSelected: false,
                    ),
                    HeaderOption(
                      title: "Movie",
                      isSelected: true,
                    ),
                    HeaderOption(
                      title: "Time",
                      isSelected: false,
                    ),
                  ]),
                ),
                builder: (context, value, child) {
                  return SizedBox(
                      height: (value), width: double.infinity, child: child);
                }),
          ],
        ));
  }
}
