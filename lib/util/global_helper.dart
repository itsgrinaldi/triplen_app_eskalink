import 'package:intl/intl.dart';

class GlobalHelper {
  static String formatDateToString(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(date); // <-- dd/MM 24H format

    var outputFormat = DateFormat('dd MMMM yyyy');
    var outputDate = outputFormat.format(inputDate);

    return outputDate;
  }

  static bool isEmpty(text){
    if(text == "" || text == null || text == "null"){
      return true;
    }else{
      return false;
    }
  }

  static bool isEmptyList(List<dynamic> list){
    if(list == null){
      return true;
    } else if (list.length == 0){
      return true;
    }else{
      return false;
    }
  }

  static String formatter(String number) {
    // TODO: implement format
    final format = new NumberFormat("#,##0.###", "en-US");
    int newNumber;
    String newValue = "0";
    try {
      newNumber = int.parse(GlobalHelper.formatNumberToString(number));
      newValue = format.format(newNumber);
    } catch(e){
      print(e);
    }

    return newValue;
  }

  static String formatNumberToString(String text, {String defaultValue = "0"}) {
    if(GlobalHelper.isEmpty(text)){
      return defaultValue;
    }
    return int.parse(double.parse(text).toStringAsFixed(0)).toString();
  }
}