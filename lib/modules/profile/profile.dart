import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctobot_app_project/modules/profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../../layout/doc_app/cubit/cubit.dart';
import '../../layout/doc_app/cubit/states.dart';
import '../../shared/components/components.dart';



var nameController = TextEditingController();

var emailController = TextEditingController();

var ageController = TextEditingController();

var genderController = TextEditingController();

var BloodController = TextEditingController();

var AddressController = TextEditingController();

var phoneController = TextEditingController();
var bioController = TextEditingController();

class Profile extends StatelessWidget {
  bool enabled = false;


  @override

  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return BlocConsumer<DocCubit, DocStates>(
      listener: (context, state){},
      builder: (context , state){
        var modelProfile =DocCubit.get(context).getProfileModel!.data!;
        ageController.text = DocCubit.get(context).age;
        genderController.text = 'Mall';
        BloodController.text = DocCubit.get(context).blood_type;
        AddressController.text = DocCubit.get(context).address;
        bioController.text = DocCubit.get(context).bio;
       emailController.text = DocCubit.get(context).getProfileModel!.data!.email!;
       nameController.text = DocCubit.get(context).getProfileModel!.data!.name!;
       phoneController.text ='01102587789';
        return ConditionalBuilder(
          condition: DocCubit.get(context).getProfileModel!.data != null,
          builder: (context) => Scaffold(
            appBar: AppBar(backgroundColor: Colors.white,),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
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
                              image:DecorationImage(//
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

                              ],
                            ),
                          ),



                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: defaultButton(
                                    function: (){
                                      enabled = true;
                                      navigateTo(context, EditProfile());
                                    },
                                    text: 'Edit Profile',
                                    width:101 ,
                                    height: 30

                                ),

                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 14,),
                    Text('${modelProfile.name}',
                      style: TextStyle(
                          color: HexColor('#292826'),
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text('${modelProfile.role}',
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
                              ),
                                ),

                                SizedBox(height: 12,),
                                TextFormField(
                                  enabled:enabled,
                                  controller: ageController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (String? value){
                                    if(value!.isEmpty){
                                      return 'age must not be empty';
                                    }else{
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Age',
                                  ),
                                ),
                                SizedBox(height: 12,),
                                TextFormField(
                                  enabled:enabled,
                                  controller: genderController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (String? value){
                                    if(value!.isEmpty){
                                      return 'gender must not be empty';
                                    }else{
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Gender',
                                  ),
                                ),
                                SizedBox(height: 12,),
                                TextFormField(
                                  enabled:enabled,
                                  controller: BloodController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (String? value){
                                    if(value!.isEmpty){
                                      return 'Blood must not be empty';
                                    }else{
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Blood Type',
                                  ),
                                ),
                                SizedBox(height: 12,),
                                TextFormField(
                                  enabled:enabled,
                                  controller: AddressController,
                                  keyboardType: TextInputType.text,
                                  validator: (String? value){
                                    if(value!.isEmpty){
                                      return 'address must not be empty';
                                    }else{
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Address',
                                  ),
                                ),
                                SizedBox(height: 12,),
                                TextFormField(
                                  enabled:enabled,
                                  controller: phoneController,
                                  keyboardType: TextInputType.number,
                                  validator: (String? value){
                                    if(value!.isEmpty){
                                      return 'phone must not be empty';
                                    }else{
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Phone',
                                  ),
                                ),
                                SizedBox(height: 12,),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 39,),
                        Text('Chronic Diseases',
                          style: TextStyle(
                            color: HexColor('#707070'),
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor('#FFFFFF'),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child:

                            Text('${bioController.text}',
                              style: TextStyle(
                                fontSize: 20,
                                color: HexColor('#707070'),

                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        // defaultButton(
                        //     function: (){
                        //
                        //       if(formKey.currentState!.validate()){
                        //         DocCubit.get(context).upDateProfileData(
                        //           name: nameController.text,
                        //           email: emailController.text,
                        //           phone: phoneController.text,
                        //         );
                        //       }
                        //       // navigateTo(context, Profile());
                        //     },
                        //     text: 'save',
                        //     width:101 ,
                        //     height: 30
                        //
                        // ),
                      ],
                    ),
                  ],
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
