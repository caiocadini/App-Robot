import 'package:flutter/material.dart';
enum Calendar { sunday, monday, tuesday, wednesday, thursday, friday, saturday }

class SegmentedButtonSingleChoice extends StatefulWidget {
  final List<dynamic> values;
  final int selected;

  const SegmentedButtonSingleChoice({
    required this.values,
    this.selected = 0,
    super.key
  });

  @override
  State<SegmentedButtonSingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SegmentedButtonSingleChoice> {
  Calendar calendarView = Calendar.monday;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.monday,
            label: Text('Segunda'),
            icon: Icon(Icons.calendar_today)),
        ButtonSegment<Calendar>(
            value: Calendar.tuesday,
            label: Text('Terça'),
            icon: Icon(Icons.calendar_today_outlined)),
        ButtonSegment<Calendar>(
            value: Calendar.wednesday,
            label: Text('Quarta'),
            icon: Icon(Icons.calendar_today_rounded)),
        ButtonSegment<Calendar>(
            value: Calendar.thursday,
            label: Text('Quinta'),
            icon: Icon(Icons.calendar_today_sharp)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
      },
    );
  }
}
