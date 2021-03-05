import 'package:date_format/date_format.dart';

class DateUtil {
  static String getFormatTime(DateTime mDate) {
    String timestamp =
        "${mDate.month.toString().padLeft(2, '0')}-${mDate.day.toString().padLeft(2, '0')}";
    return timestamp;
  }

  static String getFormatTime2(DateTime mDate) {
    String timestamp = "${mDate.month.toString()}-${mDate.day.toString()}" +
        "  " +
        "${mDate.hour.toString().padLeft(2, '0')}:${mDate.minute.toString().padLeft(2, '0')}";
    return timestamp;
  }

  static String getFormatTime3(DateTime mDate) {
    String timestamp = "" +
        "${mDate.year.toString()}-${mDate.month.toString()}-${mDate.day.toString()}" +
        "  " +
        "${mDate.hour.toString().padLeft(2, '0')}:${mDate.minute.toString().padLeft(2, '0')}";
    return timestamp;
  }

  //秒转换为分钟:秒
  static String getFormatTime4(int mSecond) {
    var d = Duration(seconds: mSecond);
    print(d.abs().inMinutes);
    return d.abs().inMinutes.toString() +
        ":" +
        (mSecond - d.abs().inMinutes * 60).toString().padLeft(2, '0');
  }

  static String getToday(){
    DateTime dateTime= DateTime.now();

    return formatDate(dateTime ,['yyyy', '-', 'mm', '-', 'dd']);
  }

   static String getOffDays(String firstDay) {
    int dayOff;

//    Date now = new Date(System.currentTimeMillis());
//    Date old = new Date(timeMills);
//    dayOff = getGapCount(old, now);
//    return dayOff + "";

//    var d7 = new DateTime(2019, 6, 20, 15, 20);
//    var difference = d7.difference(d6);

    var now = new DateTime.now();
     var  befor= DateTime.parse(firstDay);
     print("dayoff-before"+befor.toString());
     var difference=now.difference(befor);
     return difference.inDays.toString();
  }

}
