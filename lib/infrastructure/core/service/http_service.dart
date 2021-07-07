import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:get/get.dart';

class HttpService extends GetxService {
  final GetConnect connect = GetConnect();

  Future<HttpService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  @override
  void onInit() {
    connect.httpClient.baseUrl = "https://intra.epitech.eu";
    connect.httpClient.timeout = Duration(milliseconds: 20000);
    connect.httpClient.followRedirects = true;

    super.onInit();
  }
}
