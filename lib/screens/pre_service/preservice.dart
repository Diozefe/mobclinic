import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mobclinic/components/cards/cardProcedures_widget.dart';
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
      floatingActionButton: FloatingActionButton(
          backgroundColor: Global.primary_color,
          foregroundColor: Global.white,
          child: Icon(Icons.add),
          onPressed: () {}),
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
            child: ListView.builder(
              itemCount: _selectedEvents.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 18, right: 18),
                  child: Card(
                    shape: BorderDirectional(
                      start: BorderSide(
                        width: 7,
                        color: Global.status_card_pending,
                      ),
                    ),
                    semanticContainer: false,
                    color: Global.card_pending,
                    borderOnForeground: true,
                    child: ListTile(
                      horizontalTitleGap: 0,
                      minLeadingWidth: 0,
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.only(left: 7),
                      trailing: Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: PopupMenuButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.more_vert_sharp),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry>[
                            PopupMenuItem(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text('Apagar'),
                                onTap: () {},
                              ),
                            ),
                            PopupMenuItem(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text('Editar Marcação'),
                              ),
                            ),
                            PopupMenuItem(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text('Editar Observação'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      title: Container(
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.only(top: 6, bottom: 6, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  key: Key(index.toString()),
                                  children: [
                                    Text(
                                      '${DateTime.now().hour}:00 - ',
                                    ),
                                    Icon(
                                      Icons.query_builder_sharp,
                                      size: 16,
                                    ),
                                    Text(' 60min'),
                                  ],
                                ),
                              ),
                              Text(
                                'Quéle Rodrigues',
                                style: TextStyle(
                                  color: Global.text_primary_color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 67,
                                      alignment: Alignment.center,
                                      child: Text('Corporal'),
                                      decoration: BoxDecoration(
                                        color: Global.procedure_color_corporal,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Massagem Modeladora',
                                      style: TextStyle(
                                        color: Global.text_secundary_color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                child: Text(
                                  'Observação: A cliente pediu para confirmar 1 dia antes do atendimento.',
                                  style: TextStyle(
                                    color: Global.text_secundary_color,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
