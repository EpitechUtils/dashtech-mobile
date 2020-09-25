import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class TabBarSubHeaderWidget extends StatelessWidget {
  final TabController _controller;
  final List<String> _labelKeys;

  TabBarSubHeaderWidget(this._controller, this._labelKeys);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
          color: Color(0xFFF4F4F4),
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
