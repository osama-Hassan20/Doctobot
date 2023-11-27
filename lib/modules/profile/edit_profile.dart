import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctobot_app_project/layout/doc_app/doc_layout.dart';
import 'package:doctobot_app_project/modules/profile/profile.dart';
import 'package:doctobot_app_project/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../../layout/doc_app/cubit/cubit.dart';
import '../../layout/doc_app/cubit/states.dart';
import '../../shared/components/components.dart';

class EditProfile extends StatelessWidget {
  var formKey =GlobalKey<FormState>();

  var nameController = TextEditingController();

  var bioController = TextEditingController();


  var emailController = TextEditingController();

  var ageController = TextEditingController();

  var genderController = TextEditingController();

  var BloodController = TextEditingController();

  var AddressController = TextEditingController();

  var phoneController = TextEditingController();
  bool enabled = true;

  @override

  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var modelProfile =DocCubit.get(context).getProfileModel!.data;
    return BlocConsumer<DocCubit, DocStates>(
      listener: (context, state){},
      builder: (context , state){
        // ageController.text = DocCubit.get(context).age;
        // var model = DocCubit.get(context).getProfileModel!.email!;
        // emailController.text = modelProfile!.email!;
        // nameController.text = modelProfile.name!;
        // phoneController.text = modelProfile.phone!;
        return ConditionalBuilder(
          condition: DocCubit.get(context).getProfileModel!.data != null,
          builder: (context) => Scaffold(
            appBar: AppBar(backgroundColor: Colors.white,),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 190,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image:DecorationImage(
                                  image: AssetImage('assets/images/download (2).png',),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: 0,
                              left: 15,
                              child: CircleAvatar(
                                radius: 31,
                                backgroundColor:HexColor('#F5F5F5'),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 16,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 45,
                                    backgroundImage: AssetImage('assets/images/people.png',),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: HexColor('#595CFF'),
                                        ),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          size: 20,
                                        ),
                                      )),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(height: 14,),
                      TextFormField(
                        enabled:enabled,
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        validator: (String? value){
                          if(value!.isEmpty){
                            return 'email must not be empty';
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'name',
                          hintText: '${DocCubit.get(context).getProfileModel!.data!.name}'
                        ),
                      ),
                      // Text('${modelProfile!.name}',
                      //   style: TextStyle(
                      //       color: HexColor('#292826'),
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.bold
                      //   ),
                      // ),
                      SizedBox(height: 5,),
                      Text('${modelProfile!.role}',
                        style: TextStyle(
                          color: HexColor('#A5A5A5'),
                          fontSize: 15,
                        ),
                      ),

                      SizedBox(height: 24,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Additional Information',
                            style: TextStyle(
                              color: HexColor('#707070'),
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 7,),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: HexColor('#FFFFFF'),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  // TextFormField(
                                  //   // enabled:true,
                                  //   controller: nameController,
                                  //   keyboardType: TextInputType.text,
                                  //   validator: (String? value){
                                  //     if(value!.isEmpty){
                                  //       return 'name must not be empty';
                                  //     }else{
                                  //       return null;
                                  //     }
                                  //   },
                                  //   decoration: InputDecoration(
                                  //     labelText: 'name',
                                  //
                                  //   ),
                                  // ),
                                  TextFormField(
                                    enabled:enabled,
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (String? value){
                                      if(value!.isEmpty){
                                        return 'email must not be empty';
                                      }else{
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Email Address',
                                        hintText: '${DocCubit.get(context).getProfileModel!.data!.email}'

                                    ),
                                  ),


                                  SizedBox(height: 12,),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: HexColor('#E2E2E2'),
                                  ),
                                  SizedBox(height: 12,),
                                  TextFormField(
                                    enabled:enabled,
                                    controller: ageController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: 'Age',
                                        hintText: '${DocCubit.get(context).age}'

                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  TextFormField(
                                    enabled:enabled,
                                    controller: BloodController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: 'Blood Type',
                                        hintText: '${DocCubit.get(context).blood_type}'

                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  TextFormField(
                                    enabled:enabled,
                                    controller: AddressController,
                                    keyboardType: TextInputType.text,

                                    decoration: InputDecoration(
                                      labelText: 'Address',
                                        hintText: '${DocCubit.get(context).address}'

                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  TextFormField(
                                    enabled:enabled,
                                    controller: phoneController,
                                    keyboardType: TextInputType.number,

                                    decoration: InputDecoration(
                                      labelText: 'Phone',
                                        hintText: '0110253978'

                                    ),
                                  ),
                                  SizedBox(height: 12,),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 39,),

                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: HexColor('#FFFFFF'),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(40),
                              child: TextFormField(
                                enabled:enabled,
                                maxLines: 5,
                                minLines: 1,
                                controller: bioController,
                                keyboardType: TextInputType.text,

                                decoration: InputDecoration(
                                  labelText: 'Chronic Diseases',
                                    hintText: '${DocCubit.get(context).bio}'

                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 39,),
                          defaultButton(
                              function: (){
                                if(formKey.currentState!.validate()){
                                  DocCubit.get(context).upDateProfileData(
                                    name: (nameController.toString().isEmpty)?modelProfile.name!:nameController.text,
                                    email: emailController.text,
                                    phone: (phoneController.toString().isEmpty)?modelProfile.name!:phoneController.text,
                                  );
                                  navigateTo(context, Profile());
                                  navigateAndFinish(context, DocLayout());
                                }

                              },
                              text: 'save',
                              width:101 ,
                              height: 30

                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
