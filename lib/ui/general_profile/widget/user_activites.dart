import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class UserActivity extends StatelessWidget {
  final List<DateTime> dateActivities;
  UserActivity({
    Key? key,
    required this.dateActivities,
  }) : super(key: key);

  /// Using a [LinkedHashMap] is highly recommended if you decide to use a map.

  List<dynamic> _getEventsForDay(DateTime day, Map<DateTime, List<bool>> e) {
    // Implementation example
    return e[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final _kEventSource = Map.fromIterable(dateActivities,
        key: (item) => item as DateTime,
        value: (item) => List.generate(1, (index) => true));
    final kEvents = LinkedHashMap<DateTime, List<bool>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_kEventSource);

    var now = new DateTime.now();
    // Find the last day of the month.
    var lastDayDateTime = (now.month < 12)
        ? new DateTime(now.year, now.month + 1, 0)
        : new DateTime(now.year + 1, 1, 0);
    // Find the first day of the month.
    var firstDayDateTime = DateTime(now.year, now.month, 0);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "ACTIVITIES",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: firstDayDateTime,
              lastDay: lastDayDateTime,
              eventLoader: (day) => _getEventsForDay(day, kEvents),
              rangeSelectionMode: RangeSelectionMode.disabled,
              headerStyle: HeaderStyle(
                leftChevronVisible: false,
                rightChevronVisible: false,
                formatButtonVisible: false,
                titleCentered: true,
              ))
        ],
      ),
    );
  }
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}
