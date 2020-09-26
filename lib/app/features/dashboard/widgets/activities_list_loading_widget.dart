import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ActivitiesListLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[200],
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    width: 75,
                    height: 20,
                    color: Colors.white,
                  ),
                  Container(
                    width: 96,
                    height: 14,
                    color: Colors.white,
                  ),
                ],
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
              margin: EdgeInsets.only(bottom: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    width: 75,
                    height: 20,
                    color: Colors.white,
                  ),
                  Container(
                    width: 96,
                    height: 14,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext ctxt2, int index2) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 80,
                      color: Colors.white,
                      child: Container(),
                    ),
                  ),
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    width: 75,
                    height: 20,
                    color: Colors.white,
                  ),
                  Container(
                    width: 96,
                    height: 14,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (BuildContext ctxt2, int index2) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 80,
                      color: Colors.white,
                      child: Container(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
