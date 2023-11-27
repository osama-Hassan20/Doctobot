import 'package:doctobot_app_project/models/get_all_doctors_model.dart';
import 'package:doctobot_app_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';
import '../../../layout/doc_app/cubit/cubit.dart';
import '../../../modules/doctors/doctor_info.dart';
import '../../../modules/nurses/nurses_info.dart';


// ignore: must_be_immutable
class Build_List_all_Available extends StatelessWidget {
  Build_List_all_Available({Key? key ,this.nurse = false,required this.model,required this.context,required this.index,}) : super(key: key);
  dynamic model;
  BuildContext context;
  int index;
  bool nurse;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nurse ?
        navigateTo(
            context,
          NursesInfo(
            information: model,
            getAllDoctorsModel: DocCubit.get(context).allNursesModel!,
        i_ndex: index,
        ),)
        :navigateTo(
            context,
            DoctorInfo(
              information: model,
              getAllDoctorsModel: DocCubit.get(context).allDoctorsModel!,
              i_ndex: index,
            ),);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: DocCubit.get(context).isDark
              ? HexColor('#434343').withOpacity(1)
              : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${model.image}'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${model.name}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: DocCubit.get(context).isDark
                          ? HexColor('#FFFFFF').withOpacity(1)
                          : HexColor('#292826').withOpacity(1),
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: DocCubit.get(context).isDark
                          ? HexColor('#434343').withOpacity(1)
                          : Colors.white,
                    ),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Column(
                        children: [
                          Text(
                            '${model.rating}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: DocCubit.get(context).isDark
                                  ? HexColor('#FFFFFF').withOpacity(.9)
                                  : HexColor('#292826'),
                            ),
                          ),
                          FlutterRating(
                            rating: model.rating!.toDouble(),
                            borderColor: Colors.grey,
                            color: HexColor('#DCD74A'),
                            size: 15,
                            onRatingChanged: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: DocCubit.get(context).isDark
                    ? HexColor('#E2E2E2').withOpacity(.2)
                    : HexColor('#E2E2E2').withOpacity(1),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '${model.contactNumber}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: DocCubit.get(context).isDark
                          ? HexColor('#E2E2E2').withOpacity(.8)
                          : HexColor('#707070').withOpacity(1),
                    ),
                  ),
                  Spacer(),
                  nurse ?
                  Text(
                    '${model.experienceYears} years experience',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: DocCubit.get(context).isDark
                          ? HexColor('#E2E2E2').withOpacity(.8)
                          : HexColor('#292826').withOpacity(1),
                    ),
                  )
                  :Text(
                    '${model.specialiaty}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: DocCubit.get(context).isDark
                          ? HexColor('#E2E2E2').withOpacity(.8)
                          : HexColor('#292826').withOpacity(1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
