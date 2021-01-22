import 'package:dashtech/application/planning/planning_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PlanningDayEventsListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[200],
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: Container(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: Container(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: Container(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: Container(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: Container(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
