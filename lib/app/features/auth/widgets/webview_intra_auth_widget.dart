import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/signin/signin_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/signin/signin_event.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/loading_widget.dart';
import 'package:epitech_intranet_mobile/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/global.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebviewIntraAuthWidget extends StatefulWidget {
  final GlobalKey globalKey;
  final String profileName;

  WebviewIntraAuthWidget(this.globalKey, this.profileName);

  State<StatefulWidget> createState() => _WebviewIntraAuthWidget();
}

class _WebviewIntraAuthWidget extends State<WebviewIntraAuthWidget> {
  final FlutterWebviewPlugin webviewPlugin = FlutterWebviewPlugin();

  StreamSubscription<WebViewStateChanged> listener;
  String officeAuthUrl;

  /// Init state and webview controller
  @override
  void initState() {
    super.initState();
    listener = webviewPlugin.onStateChanged.listen(this.onStateChanged);
    getIt<Dio>().get("https://intra.epitech.eu/admin/autolog?format=json").then((Response value) {
      dynamic body = value.data;
      if (body == null || value.statusCode >= 500 || value.data['office_auth_uri'] == null) {
        return null;
      }
      this.setState(() => officeAuthUrl = body['office_auth_uri']);
    });
  }

  /// When activity closing
  @override
  void dispose() {
    listener.cancel();
    webviewPlugin.dispose();
    super.dispose();
  }

  /// When webview state is changed
  void onStateChanged(WebViewStateChanged state) async {
    if (state.url.startsWith("https://intra.epitech.eu/admin/autolog")) {
      if (state.type == WebViewState.shouldStart) webviewPlugin.hide();

      // Check if view is mounted and displayed
      if (state.type == WebViewState.finishLoad) {
        try {
          // Get html page from javascript
          webviewPlugin.evalJavascript("document.documentElement.innerHTML").then((body) {
            if (Platform.isIOS) {
              // Remove html tags from response
              RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
              return body.replaceAll(exp, '');
            } else {
              String autologin = body.substring(body.indexOf("autologin"));
              String autolog_url = autologin.substring(autologin.indexOf(":") + 1);
              autolog_url = autolog_url.substring(1, autolog_url.indexOf("\\n}"));
              autolog_url = autolog_url.replaceAll("\\", "");
              return autolog_url.substring(1, autolog_url.length - 1);
            }
          }).then((autologJson) {
            Map<String, dynamic> result;
            if (Platform.isIOS)
              result = json.decode(autologJson);
            else
              result = {"autologin": autologJson};

            // Check if autolog exists
            if (result["autologin"] == null) {
              BlocProvider.of<SigninBloc>(widget.globalKey.currentContext)
                  .add(SigninEvent.error(error: 'httpError.auth.failed'));
              Navigator.of(widget.globalKey.currentContext).maybePop();
              return;
            } // (E9&T^\;

            webviewPlugin.close();
            BlocProvider.of<SigninBloc>(widget.globalKey.currentContext)
                .add(SigninEvent.signin(autologUrl: result['autologin'], profileName: widget.profileName));
            Navigator.pop(widget.globalKey.currentContext);
          });
        } catch (err) {
          BlocProvider.of<SigninBloc>(widget.globalKey.currentContext)
              .add(SigninEvent.error(error: 'httpError.internal'));
          Navigator.pop(widget.globalKey.currentContext);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    webviewPlugin.close();
                    listener.cancel();
                    webviewPlugin.dispose();

                    // Close bottom sheet
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close, size: 30, color: Color(0xFF131313)),
                ),
                Text(
                  translate(Keys.Auth_Signin_Submit),
                  style: TextStyle(color: Color(0xFF131313), fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(child: _buildContent())
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (officeAuthUrl == null) {
      return LoadingWidget();
    }

    return WebviewScaffold(
      withJavascript: true,
      withZoom: false,
      clearCache: true,
      clearCookies: true,
      url: officeAuthUrl,
    );
  }
}
