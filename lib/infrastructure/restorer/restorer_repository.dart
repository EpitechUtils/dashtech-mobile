import 'package:flutter_file_store/domain/restorer/adapters/restorer_repository_adapter.dart';
import 'package:flutter_file_store/infrastructure/core/graphql_service.dart';
import 'package:flutter_file_store/infrastructure/core/image_picker_service.dart';
import 'package:flutter/cupertino.dart';

class ResporerRepository implements IRestorerRepository {
  ResporerRepository({
    @required this.graphqlService,
    @required this.imagePickerService,
  }) : assert(graphqlService != null);

  GraphqlService graphqlService;
  ImagePickerService imagePickerService;
}
