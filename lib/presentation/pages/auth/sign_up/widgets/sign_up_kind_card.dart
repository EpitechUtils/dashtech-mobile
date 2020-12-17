import 'package:flutter_file_store/application/auth/signup_controller.dart';
import 'package:flutter_file_store/presentation/core/theme/app_colors.dart';
import 'package:flutter_file_store/presentation/core/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignupKindCard extends StatelessWidget {
  const SignupKindCard({
    Key key,
    this.title,
    this.desc,
    this.img,
    this.kind,
    this.select,
  }) : super(key: key);

  final String title;
  final String desc;
  final String img;
  final SignupKind kind;
  final Function select;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        onTap: () => select(),
        splashColor: const Color(primaryColor).withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Flexible(
                child: SvgPicture.asset(
                  AssetsUtils.svg(img),
                  width: Get.width / 6,
                  height: 70,
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(
                            activeCardTextColor,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        desc,
                        style: const TextStyle(
                          color: Color(
                            activeCardTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
