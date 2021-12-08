import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mobclinic/components/laft_moth_widget.dart';
import 'package:mobclinic/components/text/text-title_screen.dart';
import 'package:mobclinic/components/text/text_filter.dart';
import 'package:mobclinic/global/global_colors.dart';
import 'package:mobclinic/models/event_model.dart';
import 'package:mobclinic/screens/pre_service/utils.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class PreServiceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PreServiceScreenState();
}

class _PreServiceScreenState extends State<PreServiceScreen> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  String _textLeft = DateFormat.MMMM('pt_BR').format(DateTime.utc(
      DateTime.now().year,
      DateTime.now().month - 1 <= 0 ? 12 : DateTime.now().month - 1));
  String _textRigth = DateFormat.MMMM('pt_BR').format(DateTime.utc(
      DateTime.now().year,
      DateTime.now().month + 1 > 12 ? 1 : DateTime.now().month + 1));

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

//Eventos no dia
  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Global.white,
        iconTheme: IconThemeData(
          color: Global.primary_color,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.chevron_left_sharp,
            size: 35,
          ),
        ),
        title: TextTitleScreen('Pré-atendimento'),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            daysOfWeekVisible: false,
            locale: 'pt_BR',
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            availableCalendarFormats: const {CalendarFormat.month: 'Month'},
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onPageChanged: (focusedDay) {
              //Menor que janeiro
              if (focusedDay.month - 1 <= 0) {
                DateTime nDateLeft = DateTime.utc(focusedDay.year, 12);
                String dateFormated =
                    DateFormat.MMMM('pt_BR').format(nDateLeft);
                setState(() {
                  _textLeft = dateFormated;
                });
              }
              //Maior que desembro
              if (focusedDay.month + 1 > 12) {
                DateTime nDateRigth = DateTime.utc(focusedDay.year, 1);
                String dateFormated =
                    DateFormat.MMMM('pt_BR').format(nDateRigth);
                setState(() {
                  _textRigth = dateFormated;
                });
              }
              if (focusedDay.month - 1 > 0) {
                DateTime nDateLeft =
                    DateTime.utc(focusedDay.year, focusedDay.month - 1);
                String dateFormated =
                    DateFormat.MMMM('pt_BR').format(nDateLeft);
                setState(() {
                  _textLeft = dateFormated;
                });
              }
              if (focusedDay.month + 1 <= 12) {
                DateTime nDateRigth =
                    DateTime.utc(focusedDay.year, focusedDay.month + 1);
                String dateFormated =
                    DateFormat.MMMM('pt_BR').format(nDateRigth);
                setState(() {
                  _textRigth = dateFormated;
                });
              }

              _focusedDay = focusedDay;
            },
            headerStyle: HeaderStyle(
              leftChevronIcon: Text(_textLeft),
              rightChevronIcon: Text(_textRigth),
              titleCentered: true,
              formatButtonVisible: false,
              titleTextFormatter: (date, locale) {
                String dateFormated = DateFormat.yMMMM(locale).format(date);
                return dateFormated[0].toUpperCase() +
                    dateFormated.substring(1);
              },
              titleTextStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            calendarStyle: CalendarStyle(
                markerSizeScale: 0.1,
                outsideDaysVisible: true,
                cellPadding: EdgeInsets.all(8),
                markerDecoration: BoxDecoration(
                  color: Global.green,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Color.fromRGBO(47, 128, 237, 0.4),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                    color: Global.primary_color, shape: BoxShape.circle)),
          ),
          const SizedBox(height: 22),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Row(
              children: [
                TextFilter(
                  textFilterName: 'Marcações',
                  color: Global.primary_color,
                ),
                TextFilter(
                    textFilterName: 'Confirmado',
                    color: Global.text_secundary_color),
                TextFilter(
                    textFilterName: 'Pendente',
                    color: Global.text_secundary_color),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Expanded(
              child: ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          onTap: () => print('${value[index]}'),
                          title: Text('${value[index]}'),
                        ),
                      );
                    }),
              );
            },
          ))
        ],
      ),
    );
  }
}
