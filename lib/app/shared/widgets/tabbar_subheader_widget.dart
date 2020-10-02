import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class TabBarSubHeaderWidget extends StatelessWidget {
  final TabController _controller;
  final List<String> _labelKeys;
  final Color backColor;

  TabBarSubHeaderWidget(this._controller, this._labelKeys, {this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: TabBar(
        controller: _controller,
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: this.backColor != null ? this.backColor : Theme.of(context).scaffoldBackgroundColor,
        ),
        tabs: _labelKeys
            .map((key) => Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(translate(key).toUpperCase()),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
