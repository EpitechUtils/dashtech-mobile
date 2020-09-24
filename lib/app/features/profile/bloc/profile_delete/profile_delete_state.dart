import 'package:super_enum/super_enum.dart';

part 'profile_delete_state.g.dart';

@superEnum
enum _ProfileDeleteState {
  @object
  Init,
  @object
  Loading,
  @object
  DeleteSuccess,
  @Data(fields: [
    DataField<String>('message'),
  ])
  DeleteError,
}
