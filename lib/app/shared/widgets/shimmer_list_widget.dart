import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListWidget extends StatelessWidget {
  final ScrollController scrollController;

  const ShimmerListWidget({
    Key key,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[200],
            highlightColor: Colors.grey[300],
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 20,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: AnimationLimiter(
            child: ListView.builder(
              controller: scrollController,
              shrinkWrap: true,
              itemCount: 3,
              addRepaintBoundaries: false,
              itemBuilder: (BuildContext ctxt, int index) => _buildItem(ctxt, index),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) => AnimationConfiguration.staggeredList(
        position: index,
        duration: Duration(milliseconds: 400),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: _buildRow(
              context,
            ),
          ),
        ),
      );

  Widget _buildRow(
    BuildContext ctxt,
  ) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[200],
              highlightColor: Colors.grey[300],
              child: Container(
                width: MediaQuery.of(ctxt).size.width / 3.5,
                height: 10,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (BuildContext ctxt, int index) => _buildCard(ctxt),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext ctxt,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 24, 12),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Shimmer.fromColors(
                          baseColor: Colors.grey[200],
                          highlightColor: Colors.grey[300],
                          child: ClipOval(
                            child: Container(
                              color: Colors.white,
                              height: 38,
                              width: 38,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Shimmer.fromColors(
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[300],
                            child: Container(
                              width: MediaQuery.of(ctxt).size.width / 1.8,
                              height: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1, left: 8),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[200],
                  highlightColor: Colors.grey[300],
                  child: Container(
                    width: 38,
                    height: 28,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
