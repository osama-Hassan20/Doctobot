import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctobot_app_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';

import '../../layout/doc_app/cubit/cubit.dart';
import '../../models/get_all_category_model.dart';
import '../../models/get_all_doctors_model.dart';
import 'doctor_info.dart';

class DoctorsCategoryScreen extends StatelessWidget {
  var i_ndex;
  DataCategories infoDataCategories;

  DoctorsCategoryScreen({
    required this.i_ndex,
    required this.infoDataCategories,
  });
  @override
  Widget build(BuildContext context) {
    var doctorsSearchController = TextEditingController();
    var size = MediaQuery.of(context).size;
    var busy = DocCubit.get(context).allDoctorsModel!.paginationResult!.limit!.toInt() - DocCubit.get(context).allDoctorsModel!.results!.toInt();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(

          children: [

            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height*0.028,
                horizontal: size.width*0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('All doctors are in the specialty of',
                  style: TextStyle(
                    fontWeight: FontWeight.w900
                  ),
                  ),
                  Text('${DocCubit.get(context).allCategoriesModel!.data![i_ndex].name}',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.red
                  ),
                  ),
                  SizedBox(height: 20,),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index) =>buildListAllDoctors(DocCubit.get(context).allDoctorsModel!.data![index],context,index),
                    separatorBuilder: (context,index) =>SizedBox(height: size.height *0.03,),
                    itemCount: DocCubit.get(context).allDoctorsModel!.data!.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildListAllDoctors (Data model,context,index ) {

    if(DocCubit.get(context).allCategoriesModel!.data![i_ndex].name == model.specialiaty){
      return GestureDetector(
        onTap: (){
          navigateTo(context, DoctorInfo( information: model,getAllDoctorsModel: DocCubit.get(context).allDoctorsModel!,i_ndex:index ,));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: DocCubit.get(context).isDark ? HexColor('#434343').withOpacity(1) :Colors.white,

          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [

                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Image(
                          image: NetworkImage('${model.image}'),
                          fit: BoxFit.cover,
                        ),
                      ),

                    ),
                    SizedBox(width: 5,),
                    Text(
                      '${model.name}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: DocCubit.get(context).isDark ? HexColor('#FFFFFF').withOpacity(1) :HexColor('#292826').withOpacity(1),

                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: DocCubit.get(context).isDark ? HexColor('#434343').withOpacity(1) :Colors.white,
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8
                        ),
                        child: Column(
                          children: [
                            Text('${model.rating}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color:DocCubit.get(context).isDark ?HexColor('#FFFFFF').withOpacity(.9) : HexColor('#292826'),
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
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: DocCubit.get(context).isDark ?HexColor('#E2E2E2').withOpacity(.2) :HexColor('#E2E2E2').withOpacity(1),

                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      '${model.contactNumber}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: DocCubit.get(context).isDark ?HexColor('#E2E2E2').withOpacity(.8) :HexColor('#707070').withOpacity(1),


                      ),
                    ),
                    Spacer(),
                    Text(
                      '${model.specialiaty}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: DocCubit.get(context).isDark ?HexColor('#E2E2E2').withOpacity(.8) :HexColor('#292826').withOpacity(1),

                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }else{
      return Container();
    }




}}
