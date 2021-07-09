import 'package:intl/intl.dart';

final dateFormatter = DateFormat('yyyy-MM-dd');
final timeFormatter = DateFormat('HH:mm:ss');

DateTime fromGraphQLDateTimeToDartDateTime(String date) => DateTime.parse(date);
String fromDartDateTimeToGraphQLDateTime(DateTime date) => dateFormatter.format(date);
