import 'package:intl/intl.dart';

/// format time
String duTimeLineFormat(DateTime dt) {
  var now = DateTime.now();
  var difference = now.difference(dt);
  if (difference.inMinutes < 60) {
    return "${difference.inMinutes} m ago";
  }
  // within 1 day
  if (difference.inHours < 24) {
    return "${difference.inHours} h ago";
  }
  // within 30 days
  else if (difference.inDays < 30) {
    return "${difference.inDays} d ago";
  }
  // MM-dd
  else if (difference.inDays < 365) {
    final dtFormat =  DateFormat('MM-dd');
    return dtFormat.format(dt);
  }
  // yyyy-MM-dd
  else {
    final dtFormat =  DateFormat('yyyy-MM-dd');
    var str = dtFormat.format(dt);
    return str;
  }
}
