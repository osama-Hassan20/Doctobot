
import 'package:doctobot_app_project/models/get_all_doctors_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';

import '../../layout/doc_app/cubit/cubit.dart';
import '../../models/get_all_nurses_model.dart';
import '../../shared/components/components.dart';
import 'nurses_info.dart';


class SearchScreenNurses extends StatelessWidget {
  var search;


  SearchScreenNurses({
    required this.search,

  });
  // String? search;

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();


          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // defaultFormField(
                    //   controller: searchController,
                    //   type: TextInputType.text,
                    //   validate: (String? value){
                    //     if(value!.isEmpty){
                    //       return 'enter text to search';
                    //     }else{
                    //       return null;
                    //     }
                    //   },
                    //   onSubmit: (text){
                    //     search = text;
                    //   },
                    //   label: 'Search',
                    //   prefix: Icons.search,
                    //   context: context
                    // ),
                    SizedBox(
                      height: 20,
                    ),

                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context,index) =>buildListAllNurses(DocCubit.get(context).allNursesModel!.data![index],context,index),
                          separatorBuilder: (context,index) =>Container(height: .5,color: Colors.black,),
                          itemCount: DocCubit.get(context).allNursesModel!.data!.length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );

  }
  Widget buildListAllNurses (DataN model,context,index ){
    if(model.name == search){
      return GestureDetector(
        onTap: (){
          navigateTo(context, NursesInfo( information: model,getAllDoctorsModel: DocCubit.get(context).allNursesModel!,i_ndex: index,));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: DocCubit.get(context).isDark ? HexColor('#434343').withOpacity(1) :Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width:MediaQuery.of(context).size.width *0.15 ,
                      height: 80,
                      decoration: BoxDecoration(

                        image:DecorationImage(
                          image:  NetworkImage('${model.image}'),
                        ) ,
                      ),

                    ),
                    SizedBox(width: 16,),
                    Container(
                      width: MediaQuery.of(context).size.width *0.35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${model.name}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: DocCubit.get(context).isDark ? HexColor('#FFFFFF').withOpacity(1) :HexColor('#292826').withOpacity(1),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,

                          ),

                        ],
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
                    )
                  ],

                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: DocCubit.get(context).isDark ?HexColor('#E2E2E2').withOpacity(.2) :HexColor('#E2E2E2').withOpacity(1),
                ),
                SizedBox(height: 10,),
                Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: TextStyle(
                    fontSize: 12,
                    color:DocCubit.get(context).isDark ?HexColor('#FFFFFF').withOpacity(.9) : HexColor('#707070'),
                  ),

                ),
              ],
            ),
          ),
        ),
      );
    }else{
      return Container();
    }

  }

}
