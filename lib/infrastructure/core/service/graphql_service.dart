import 'package:artemis/artemis.dart';
import 'package:dashtech/infrastructure/core/graphql/http_auth_link.dart';
import 'package:dashtech/infrastructure/core/service/token_service.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart' as getx;

extension GraphQLResponseX on GraphQLResponse {
  int get statusCode => errors!.first.extensions!['exception']['status'] as int;

  String get statusMessage => errors!.first.message;
}

class GraphqlService extends getx.GetxService {
  final TokenService tokenService = getx.Get.find();
  late ArtemisClient client;

  Future<GraphqlService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  @override
  Future<void> onReady() async {
    /*await Hive.initFlutter();

    final Box box = await Hive.openBox("graphql");
    final HiveStore store = HiveStore(box);
    final Cache cache = Cache(store: store);*/
    final HttpAuthLink authLink = HttpAuthLink(
      graphQLEndpoint: '${DotEnv().env['BASE_URL']}/graphql',
      getToken: () async {
        final String? token = tokenService.getToken();
        if (token == null) return null;
        print(token);
        return 'Bearer $token';
      },
    );

    this.client = ArtemisClient.fromLink(authLink);
    super.onReady();
  }
}
