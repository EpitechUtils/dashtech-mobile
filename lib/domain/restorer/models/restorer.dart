import 'package:freezed_annotation/freezed_annotation.dart';

part 'restorer.freezed.dart';

@freezed
abstract class Restorer implements _$Restorer {
  const factory Restorer({
    @required String id,
    String adeliNumber,
  }) = _Restorer;

  const Restorer._();
}
