import 'package:intl/intl.dart';

const FORMAT_DATE_YYMMDD_HHMSS = "yyyy-MM-dd hh:mm:ss";
const FORMAT_DATE_DDMMYY = "dd-MM-yyyy hh:mm:ss";
const FORMAT_DATE_DOT_DDMM_YYYY = "dd.MM.yyyy";

convertTimedMy({String time, String originFormat = FORMAT_DATE_YYMMDD_HHMSS, String outputFormat = FORMAT_DATE_DDMMYY}) {
  DateFormat dateFormat = DateFormat(originFormat);
  DateTime strToDateTime = dateFormat.parse(time);
  var formatter = new DateFormat(outputFormat);
  String formattedDate = formatter.format(strToDateTime);

  return formattedDate.toString();
}
