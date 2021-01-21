import 'dart:io';

import 'package:flutter_file_store/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:flutter_file_store/domain/auth/failures/auth_failure.dart';
import 'package:flutter_file_store/domain/auth/models/auth_profile.dart';
import 'package:flutter_file_store/domain/core/failures/base_failure.dart';
import 'package:flutter_file_store/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:flutter_file_store/infrastructure/auth/dto/auth_profile_token_dto.dart';
import 'package:flutter_file_store/infrastructure/auth/graphql/auth_mutations.dart';
import 'package:flutter_file_store/infrastructure/core/graphql_service.dart';
import 'package:flutter_file_store/infrastructure/core/token_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class PlanningRepository implements IPlanningRepository {
  PlanningRepository({
    @required this.graphqlService,
  }) : assert(graphqlService != null);

  GraphqlService graphqlService;

  // Get activities list for the week dashboard
  @override
  Future<Either<BaseFailure, bool>> getDashActivitiesList() async {
    final QueryResult result = await graphqlService.client.mutate(
      MutationOptions(
        documentNode: gql(authRegisterDeviceMutation),
      ),
    );

    return right(!result.hasException);
  }
}
