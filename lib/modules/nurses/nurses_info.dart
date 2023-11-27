import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import '../../layout/doc_app/cubit/cubit.dart';
import '../../models/get_all_nurses_model.dart';
import '../../shared/components/components.dart';
import '../../shared/components/widgets/build_list_all_available.dart';
import '../../shared/components/widgets/card_info.dart';
import '../../shared/components/widgets/info_details_item.dart';
import '../../shared/components/widgets/text_title_reviews.dart';
import '../book/book_nurses.dart';

// ignore: must_be_immutable
class NursesInfo extends StatelessWidget {
   DataN information ;
   var i_ndex;
   GetAllNursesModel getAllDoctorsModel;


   NursesInfo({
    required this.information,
    required this.getAllDoctorsModel,
    required this.i_ndex,

  });


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: HexColor('#F5F5F5'),
      appBar: AppBar(
        backgroundColor:DocCubit.get(context).isDark ? HexColor('333739') : HexColor('#FFFFFF'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(size.width *0.05),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoDetailsItem(
                    image: information.image,
                    name: information.name,
                    rating: information.rating,
                  ),

                  const SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: DocCubit.get(context).isDark ? HexColor('#434343').withOpacity(1) : HexColor('#FFFFFF'),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${information.shift} Shift',
                            style: TextStyle(
                              fontSize: 16,
                              color: DocCubit.get(context).isDark ?HexColor('#FFFFFF').withOpacity(.9) :HexColor('#292826'),
                            ),

                          ),
                          const SizedBox(height: 11,),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: DocCubit.get(context).isDark ?HexColor('#E2E2E2').withOpacity(.2) :HexColor('#E2E2E2').withOpacity(1),
                          ),
                          const SizedBox(height: 12,),
                          CardInfo(
                            text: '${information.address}',
                            icon: Icons.location_on_sharp,
                          ),
                          CardInfo(
                            text: '${information.contactNumber}',
                            icon: Icons.call,
                          ),
                          CardInfo(
                            text: '${information.email}',
                            icon: Icons.mail_lock,
                          ),
                          CardInfo(
                            text: '${information.price}',
                            icon: Icons.monetization_on,
                          ),
                          const SizedBox(height: 12,),
                          Text('Mr ${information.name} work at ${information.shift}. He is ${information.age} years old and he is experienced for more than ${information.experienceYears} years.\n You could contact Dr.${information.name} book now the appointment that suits you easily',
                            style: TextStyle(
                              fontSize: 12,
                              color:DocCubit.get(context).isDark ?HexColor('#FFFFFF').withOpacity(.9) : HexColor('#707070'),
                            ),

                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24,),
                  defaultButton(
                      function:(){
                        DocCubit.get(context).Sid = information.sId!;
                        navigateTo(context, BookNurses(model_N: information,));
                      },
                      text: 'Book Now',
                      fontSize: 17,

                      isUpperCase: true,
                      background: HexColor('#595CFF')

                  ),
                  const  SizedBox(height: 24,),
                  TextTitleReviews(),
                  const  SizedBox(height: 7,),



                  ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index) =>index == i_ndex
                        ? Container()
                        : Build_List_all_Available(
                        model: DocCubit.get(context)
                            .allNursesModel!
                            .data![index],
                        context: context,
                        index: index,
                      nurse: true,
                    ),
                    separatorBuilder: (context,index) => SizedBox(height: size.height *0.03,),
                    itemCount: DocCubit.get(context).allNursesModel!.data!.length,
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
