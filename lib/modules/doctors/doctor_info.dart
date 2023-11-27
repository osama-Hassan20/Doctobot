import 'package:doctobot_app_project/models/get_all_doctors_model.dart';
import 'package:doctobot_app_project/shared/components/widgets/card_info.dart';
import 'package:doctobot_app_project/shared/components/widgets/info_details_item.dart';
import 'package:doctobot_app_project/shared/components/widgets/text_title_reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../layout/doc_app/cubit/cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/components/widgets/build_list_all_available.dart';
import '../../shared/components/widgets/launch_url.dart';
import '../book/book_dr.dart';

// ignore: must_be_immutable
class DoctorInfo extends StatelessWidget {
  Data information;

  var i_ndex;
  GetAllDoctorsModel getAllDoctorsModel;

  DoctorInfo({
    required this.information,
    required this.getAllDoctorsModel,
    required this.i_ndex,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: HexColor('#F5F5F5'),
      appBar: AppBar(
        backgroundColor: DocCubit.get(context).isDark
            ? HexColor('333739')
            : HexColor('#FFFFFF'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoDetailsItem(
                    image: information.image,
                    name: information.name,
                    rating: information.rating,
                    specialiaty: information.specialiaty,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: DocCubit.get(context).isDark
                          ? HexColor('#434343').withOpacity(1)
                          : HexColor('#FFFFFF'),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          Text(
                            'Dr ${information.name} specialises at ${information.specialiaty}. He is ${information.age} years old and he is experienced for more than ${information.experienceYears} years.\n You could contact Dr.${information.name} book now the appointment that suits you easily',
                            style: TextStyle(
                              fontSize: 12,
                              color: DocCubit.get(context).isDark
                                  ? HexColor('#FFFFFF').withOpacity(.9)
                                  : HexColor('#707070'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: DocCubit.get(context).isDark
                          ? HexColor('#434343').withOpacity(1)
                          : HexColor('#FFFFFF'),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'You can contact Dr. ${information.name} at',
                              style: TextStyle(
                                color: DocCubit.get(context).isDark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    whatsApp(whats: information.whatsapp);
                                  },
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/whats_app.png'),
                                    fit: BoxFit.cover,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    callingDr(tel: information.contactNumber);
                                  },
                                  child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: DocCubit.get(context)
                                              .isDark
                                          ? HexColor('#E2E2E2').withOpacity(.5)
                                          : HexColor('#595CFF')
                                              .withOpacity(0.10),
                                      child: Icon(
                                        Icons.call,
                                        size: 24,
                                        color: HexColor('#595CFF'),
                                      )),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    launchUrl(emailLaunchUri(
                                        email: information.email));
                                  },
                                  child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: DocCubit.get(context)
                                              .isDark
                                          ? HexColor('#E2E2E2').withOpacity(.5)
                                          : HexColor('#595CFF')
                                              .withOpacity(0.10),
                                      child: Icon(
                                        Icons.mail,
                                        size: 24,
                                        color: HexColor('#595CFF'),
                                      )),
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  defaultButton(
                      function: () {
                        DocCubit.get(context).Sid = information.sId!;
                        navigateTo(
                            context,
                            BookDoctors(
                              model_Dr: information,
                            ));
                      },
                      text: 'Book Now',
                      fontSize: 17,
                      isUpperCase: true,
                      background: HexColor('#595CFF')),
                  SizedBox(
                    height: 24,
                  ),
                  TextTitleReviews(),
                  SizedBox(
                    height: 7,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => index == i_ndex
                        ? Container()
                        : Build_List_all_Available(
                            model: DocCubit.get(context)
                                .allDoctorsModel!
                                .data![index],
                            context: context,
                            index: index),
                    separatorBuilder: (context, index) => SizedBox(
                      height: size.height * 0.03,
                    ),
                    itemCount:
                        DocCubit.get(context).allDoctorsModel!.data!.length,
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
