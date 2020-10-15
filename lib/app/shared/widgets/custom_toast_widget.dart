import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IconToastWidget extends StatefulWidget {
  final Key key;
  final Color backgroundColor;
  final String message;
  final Widget textWidget;
  final String assetName;
  final bool lottieLoop;

  IconToastWidget({
    this.key,
    this.backgroundColor,
    this.textWidget,
    this.message,
    this.lottieLoop,
    @required this.assetName,
  }) : super(key: key);

  factory IconToastWidget.error({String msg}) => IconToastWidget(
        message: msg,
        assetName: 'error',
        lottieLoop: true,
        backgroundColor: Colors.red,
      );

  factory IconToastWidget.info({String msg}) => IconToastWidget(
        message: msg,
        assetName: 'success',
        lottieLoop: true,
        backgroundColor: Colors.blue,
      );

  factory IconToastWidget.success({String msg}) => IconToastWidget(
        message: msg,
        assetName: 'success',
        lottieLoop: false,
        backgroundColor: Colors.green,
      );

  @override
  _IconToastWidgetState createState() => _IconToastWidgetState();
}

class _IconToastWidgetState extends State<IconToastWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.symmetric(vertical: 23.0, horizontal: 10.0),
      decoration: ShapeDecoration(
        shadows: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            offset: Offset(0, 2),
            blurRadius: 1.0,
          ),
        ],
        color: widget.backgroundColor ?? Color(0x9F000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: SizedBox(
                width: 40,
                height: 40,
                child: Lottie.asset(AssetsUtils.animation(widget.assetName), repeat: widget.lottieLoop)),
          ),
          Expanded(
            child: widget.textWidget ??
                Text(
                  widget.message ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: "ProductSansRegular",
                  ),
                  softWrap: true,
                  maxLines: 200,
                ),
          ),
        ],
      ),
    );
  }
}
