import 'package:intl/intl.dart';

class DateHelper {
  static DateTime getDateNow(){
    DateTime dateTime = DateTime.now();
    return dateTime;
  }

  static Future<String> getSimpleDateNowFormat() async{
    DateTime dateTime = DateTime.now();
    return DateFormat("yyyyMMdd").format(dateTime);
  }

  static Future<String> getDateNowFormatDash() async{
    DateTime dateTime = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String getDateFormatDash(DateTime date){
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String getDateNowTimeFormatDash(){
    DateTime dateTime = DateTime.now();
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }

  static String getDateTimeFormatDash(dateTime){
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }

  static String getDateTime5DaysBefore(){
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now().subtract(Duration(days: 5)));
  }

  static String getDate5DaysBefore(){
    return DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 5)));
  }

  static String formatNewDate(String date){
    return DateFormat('dd MMM yyyy').format(DateTime.parse(date));
  }
  static String formatBirthDate(String date){
    return DateFormat('dd MMMM yyyy').format(DateTime.parse(date));
  }

  static String getDateNowFormatSlice(){
    DateTime dateTime = DateTime.now();
    return DateFormat('yyyy/MM/dd').format(dateTime);
  }

  static void getRangeDateNowFormat(callback(String startDate, String endDate)){
    DateTime dateTime = DateTime.now();
    String formatDateNow = DateFormat('yyyy-MM-dd').format(dateTime);
    String startDate = formatDateNow + ' 00:00:00';
    String endDate = formatDateNow + ' 23:59:59';
    callback(startDate, endDate);
  }

  static String formatDatePromo(String date){
    return DateFormat('dd MMMM yyyy HH:mm').format(DateTime.parse(date));
  }

  static String formatDatePointPromo(String date){
    return DateFormat('dd MMMM yyyy').format(DateTime.parse(date));
  }

  static String formatDateCloseCashier(String date){
    return DateFormat('dd MMM yyyy, HH:mm').format(DateTime.parse(date));
  }


  static String formatTime(String date){
    return DateFormat('HH:mm').format(DateTime.parse(date));
  }


  static void getRangeDateFormat(DateTime startDateTime, DateTime endDateTime, callback(String startDate, String endDate) ){
    String formatStartDate = DateFormat('yyyy-MM-dd').format(startDateTime);
    String formatEndDate = DateFormat('yyyy-MM-dd').format(endDateTime);
    String startDate = formatStartDate + ' 00:00:00';
    String endDate = formatEndDate + ' 23:59:59';
    callback(startDate, endDate);
  }

  static String formatDateDay(String date){
    return DateFormat('E, dd MMM yyyy, HH:mm', 'id').format(DateTime.parse(date));
  }

  static String formatStartOfDayDash(DateTime dateTime) =>
      DateFormat('yyyy-MM-dd').format(dateTime) + ' 00:00:00';

  static String formatEndOfDayDash(DateTime dateTime) =>
      DateFormat('yyyy-MM-dd').format(dateTime) + ' 23:59:59';
}