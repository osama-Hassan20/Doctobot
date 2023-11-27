import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctobot_app_project/modules/book/reservations_dr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../layout/doc_app/cubit/cubit.dart';
import '../../layout/doc_app/cubit/states.dart';
import '../../models/get_all_doctors_model.dart';
import '../../shared/components/components.dart';

// ignore: must_be_immutable
class BookDoctors extends StatefulWidget {
  Data model_Dr;

  BookDoctors({
    required this.model_Dr,
  });

  @override
  State<BookDoctors> createState() => _BookDoctorsState();
}

class _BookDoctorsState extends State<BookDoctors> {
  var formKey = GlobalKey<FormState>();

  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  TimeOfDay dateNow = TimeOfDay.now();

  TimeOfDay startDate1 = TimeOfDay(hour: 8, minute: 00);
  TimeOfDay startDate2 = TimeOfDay(hour: 8, minute: 25);
  TimeOfDay startDate3 = TimeOfDay(hour: 9, minute: 00);
  TimeOfDay startDate4 = TimeOfDay(hour: 9, minute: 20);
  TimeOfDay startDate5 = TimeOfDay(hour: 10, minute: 10);
  TimeOfDay startDate6 = TimeOfDay(hour: 10, minute: 40);

  TimeOfDay endDate1 = TimeOfDay(hour: 8, minute: 25);
  TimeOfDay endDate2 = TimeOfDay(hour: 8, minute: 50);
  TimeOfDay endDate3 = TimeOfDay(hour: 9, minute: 20);
  TimeOfDay endDate4 = TimeOfDay(hour: 9, minute: 50);
  TimeOfDay endDate5 = TimeOfDay(hour: 10, minute: 35);
  TimeOfDay endDate6 = TimeOfDay(hour: 10, minute: 55);

  bool isSelect1 = false;
  bool isSelect2 = false;
  bool isSelect3 = false;
  bool isSelect4 = false;
  bool isSelect5 = false;
  bool isSelect6 = false;

  @override
  Widget build(BuildContext context) {
    String date = today.toString().split(' ')[0];
    String startAt = isSelect1
        ? '${startDate1.format(context).toString()}'
        : isSelect2
            ? '${startDate2.format(context).toString()}'
            : isSelect3
                ? '${startDate3.format(context).toString()}'
                : isSelect4
                    ? '${startDate4.format(context).toString()}'
                    : isSelect5
                        ? '${startDate5.format(context).toString()}'
                        : '${startDate6.format(context).toString()}';
    String endAt = isSelect1
        ? '${endDate1.format(context).toString()}'
        : isSelect2
            ? '${endDate2.format(context).toString()}'
            : isSelect3
                ? '${endDate3.format(context).toString()}'
                : isSelect4
                    ? '${endDate4.format(context).toString()}'
                    : isSelect5
                        ? '${endDate5.format(context).toString()}'
                        : '${endDate6.format(context).toString()}';
    String doctor_id = '${widget.model_Dr.sId}';

    var size = MediaQuery.of(context).size;
    Color unSelectColor = DocCubit.get(context).isDark
        ? HexColor('#434343').withOpacity(1)
        : HexColor('#FFFFFF');
    return BlocConsumer<DocCubit, DocStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          String? month;
          String? weekday = "Sunday";
          if (today.month.toString() == '1') {
            month = 'January';
          } else if (today.month.toString() == '2') {
            month = 'February ';
          } else if (today.month.toString() == '3') {
            month = 'March';
          } else if (today.month.toString() == '4') {
            month = 'April';
          } else if (today.month.toString() == '5') {
            month = 'May';
          } else if (today.month.toString() == '6') {
            month = 'June';
          } else if (today.month.toString() == '7') {
            month = 'July';
          } else if (today.month.toString() == '8') {
            month = 'August';
          } else if (today.month.toString() == '9') {
            month = 'September';
          } else if (today.month.toString() == '10') {
            month = 'October';
          } else if (today.month.toString() == '11') {
            month = 'November';
          } else if (today.month.toString() == '12') {
            month = 'December';
          }

          //
          if (today.weekday.toString() == '1') {
            weekday = "Monday";
          } else if (today.weekday.toString() == '2') {
            weekday = 'Tuesday';
          } else if (today.weekday.toString() == '3') {
            weekday = 'Wednesday';
          } else if (today.weekday.toString() == '4') {
            weekday = 'Thursday';
          } else if (today.weekday.toString() == '5') {
            weekday = 'Friday';
          } else if (today.weekday.toString() == '6') {
            weekday = 'Saturday';
          } else if (today.weekday.toString() == '7') {
            weekday = 'Sunday';
          }

          var day = today.day.toInt();
          return Scaffold(
            appBar: AppBar(
              title: Text('Book a doctor'),
              backgroundColor: DocCubit.get(context).isDark
                  ? HexColor('333739')
                  : HexColor('#FFFFFF'),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .05, vertical: 20),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    key: formKey,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //#FFFFFF

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: DocCubit.get(context).isDark
                              ? HexColor('333739')
                              : HexColor('#FFFFFF'),
                        ),
                        child: TableCalendar(
                          locale: 'en_US',
                          rowHeight: 43,
                          headerStyle: HeaderStyle(
                            titleTextStyle: TextStyle(
                              color: DocCubit.get(context).isDark
                                  ? HexColor('#FFFFFF').withOpacity(.9)
                                  : null,
                            ),
                            formatButtonVisible: false,
                            leftChevronIcon: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: HexColor('#595CFF'),
                              ),
                              child: Icon(
                                Icons.chevron_left,
                                color: HexColor('#FCFCFC'),
                              ),
                            ),
                            rightChevronIcon: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: HexColor('#595CFF'),
                              ),
                              child: Icon(
                                Icons.chevron_right,
                                color: HexColor('#FCFCFC'),
                              ),
                            ),
                            titleCentered: true,
                          ),
                          availableGestures: AvailableGestures.all,
                          selectedDayPredicate: (day) => isSameDay(day, today),
                          focusedDay: today,
                          firstDay: DateTime.utc(2022, 10, 16),
                          lastDay: DateTime.utc(2024, 3, 14),
                          onDaySelected: _onDaySelected,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Select Date',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: DocCubit.get(context).isDark
                              ? HexColor('#FFFFFF').withOpacity(1)
                              : HexColor('#707070').withOpacity(1),
                        ),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelect1 = true;
                                isSelect2 = false;
                                isSelect3 = false;
                                isSelect4 = false;
                                isSelect5 = false;
                                isSelect6 = false;
                              });
                            },
                            child: Container(
                              // height: 80,
                              width: size.width * .425,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelect1
                                    ? HexColor('#595CFF')
                                    : unSelectColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'start: ${startDate1.format(context).toString()}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: isSelect1
                                            ? HexColor('#FFFFFF')
                                            : Colors.black.withOpacity(.6),
                                      ),
                                    ),
                                    Text(
                                      'end: ${endDate1.format(context).toString()}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: isSelect1
                                            ? HexColor('#FFFFFF')
                                            : Colors.black.withOpacity(.6),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Available',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: isSelect1
                                            ? HexColor('#FFFFFF')
                                            : Colors.black.withOpacity(.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            // height: 80,
                            width: size.width * .425,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isSelect2
                                  ? HexColor('#595CFF')
                                  : unSelectColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                children: [
                                  Text(
                                    'start: ${startDate2.format(context).toString()}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: DocCubit.get(context).isDark
                                          ? HexColor('#E2E2E2').withOpacity(.2)
                                          : HexColor('#C5C5C5').withOpacity(1),
                                    ),
                                  ),
                                  Text(
                                    'end: ${endDate2.format(context).toString()}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: DocCubit.get(context).isDark
                                          ? HexColor('#E2E2E2').withOpacity(.2)
                                          : HexColor('#C5C5C5').withOpacity(1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Busy',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: DocCubit.get(context).isDark
                                          ? HexColor('#E2E2E2').withOpacity(.2)
                                          : HexColor('#C5C5C5').withOpacity(1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelect1 = false;
                                isSelect2 = false;
                                isSelect3 = true;
                                isSelect4 = false;
                                isSelect5 = false;
                                isSelect6 = false;
                              });
                            },
                            child: Container(
                              // height: 80,
                              width: size.width * .425,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelect3
                                    ? HexColor('#595CFF')
                                    : unSelectColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'start: ${startDate3.format(context).toString()}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: isSelect3
                                            ? HexColor('#FFFFFF')
                                            : Colors.black.withOpacity(.6),
                                      ),
                                    ),
                                    Text(
                                      'end: ${endDate3.format(context).toString()}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: isSelect3
                                            ? HexColor('#FFFFFF')
                                            : Colors.black.withOpacity(.6),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Available',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: isSelect3
                                            ? HexColor('#FFFFFF')
                                            : Colors.black.withOpacity(.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelect1 = false;
                                isSelect2 = false;
                                isSelect3 = false;
                                isSelect4 = true;
                                isSelect5 = false;
                                isSelect6 = false;
                              });
                            },
                            child: Container(
                              // height: 70,
                              width: size.width * .425,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelect4
                                    ? HexColor('#595CFF')
                                    : unSelectColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'start: ${startDate4.format(context).toString()}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: isSelect4
                                            ? HexColor('#FFFFFF')
                                            : Colors.black.withOpacity(.6),
                                      ),
                                    ),
                                    Text(
                                      'end: ${endDate4.format(context).toString()}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: isSelect4
                                            ? HexColor('#FFFFFF')
                                            : Colors.black.withOpacity(.6),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Available',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: isSelect4
                                            ? HexColor('#FFFFFF')
                                            : Colors.black.withOpacity(.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            // height: 80,
                            width: size.width * .425,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isSelect5
                                  ? HexColor('#595CFF')
                                  : unSelectColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                children: [
                                  Text(
                                    'start: ${startDate5.format(context).toString()}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: DocCubit.get(context).isDark
                                          ? HexColor('#E2E2E2').withOpacity(.2)
                                          : HexColor('#C5C5C5').withOpacity(1),
                                    ),
                                  ),
                                  Text(
                                    'end: ${endDate5.format(context).toString()}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: DocCubit.get(context).isDark
                                          ? HexColor('#E2E2E2').withOpacity(.2)
                                          : HexColor('#C5C5C5').withOpacity(1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Busy',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: DocCubit.get(context).isDark
                                          ? HexColor('#E2E2E2').withOpacity(.2)
                                          : HexColor('#C5C5C5').withOpacity(1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelect1 = false;
                                isSelect2 = false;
                                isSelect3 = false;
                                isSelect4 = false;
                                isSelect5 = false;
                                isSelect6 = true;
                              });
                            },
                            child: Container(
                              // height: 70,
                              width: size.width * .425,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelect6
                                    ? HexColor('#595CFF')
                                    : unSelectColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'start: ${startDate6.format(context).toString()}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: DocCubit.get(context).isDark
                                            ? HexColor('#E2E2E2')
                                                .withOpacity(.2)
                                            : Colors.black.withOpacity(.6),
                                      ),
                                    ),
                                    Text(
                                      'end: ${endDate6.format(context).toString()}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: DocCubit.get(context).isDark
                                            ? HexColor('#E2E2E2')
                                                .withOpacity(.2)
                                            : Colors.black.withOpacity(.6),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Available',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: isSelect6
                                            ? HexColor('#FFFFFF')
                                            : Colors.black.withOpacity(.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: ConditionalBuilder(
                          condition: state
                              is! addNew_Doctors_Reservations_LoadingState,
                          builder: (context) => defaultButton(
                              function: () {
                                DocCubit.get(context).addDoctorsCalender(
                                  weekday: '${weekday}',
                                  month: '${month}',
                                  day: day,
                                  startAt: startAt,
                                  endAt: endAt,
                                  status: 'Avilable',
                                  doctor: doctor_id,
                                );
                                navigateTo(
                                    context,
                                    ReservationsDrScreen(
                                      date: date,
                                      model_Dr: widget.model_Dr,
                                      start: startAt,
                                      end: endAt,
                                    ));
                              },
                              text: 'Book Now',
                              fontSize: 17,
                              isUpperCase: true,
                              background: HexColor('#595CFF')),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
