import 'package:healthcare_app_doctor/modules/calendar/models/week_item.dart';
import 'package:healthcare_app_doctor/modules/calendar/utils/compare_date.dart';
/// [findCurrentWeekIndexByDate] return -1 when cannot match
int findCurrentWeekIndexByDate(DateTime dateTime, List<WeekItem> weeks) {
  int index = -1;
  bool matched = false;
  for (int i = 0; i < weeks.length; i++) {
    index++;
    for (int j = 0; j < weeks[i].days.length; j++) {
      if (compareDate(dateTime, weeks[i].days[j])) {
        matched = true;
        break;
      }
    }
    if (matched) {
      break;
    }
  }

  return matched ? index : -1;
}
