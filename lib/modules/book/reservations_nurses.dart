import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctobot_app_project/models/get_all_doctors_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/doc_app/cubit/cubit.dart';
import '../../layout/doc_app/cubit/states.dart';
import '../../layout/doc_app/doc_layout.dart';
import '../../models/get_all_nurses_model.dart';
import '../../shared/components/components.dart';

class ReservationsNursesScreen extends StatelessWidget {
  DataN model_N ;
  String start ;
  String end ;
  String date ;


  ReservationsNursesScreen({
    required this.model_N,
    required this.start,
    required this.end,
    required this.date,

  });
  var formKey =GlobalKey<FormState>();
  var DoctornameController = TextEditingController();
  var startController = TextEditingController();
  var endController = TextEditingController();
  var phoneController = TextEditingController();
  var reservationPlaceController = TextEditingController();
  var totalController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DocCubit,DocStates>(
      listener: (context,state) {},
      builder: (context,state) {
        bool enabled = false;
        // var model = DocCubit.get(context).userModel;
        DoctornameController.text = '${model_N.name}';
        phoneController.text = '${model_N.contactNumber}';
        reservationPlaceController.text = '${model_N.address}';
        totalController.text = '${model_N.price}';
        startController.text = '${start}';
        endController.text = '${end}';
        // startController.text = model!.data!.email!;
        // endController.text = model!.data!.phone!;
        // phoneController.text = model!.data!.phone!;
        // reservationController.text = model!.data!.phone!;
        // totalController.text = model!.data!.phone!;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if(state is addNew_Doctors_Reservations_LoadingState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      enabled:enabled,
                      controller: DoctornameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Nurses Name',
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      enabled:enabled,
                      controller: startController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Start Date',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      enabled:enabled,
                      controller: endController,
                      keyboardType: TextInputType.emailAddress,

                      decoration: InputDecoration(
                        labelText: 'End date',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      enabled:enabled,
                      controller: phoneController,
                      keyboardType: TextInputType.emailAddress,

                      decoration: InputDecoration(
                        labelText: 'Phone Nurses',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // enabled:enabled,
                      controller: reservationPlaceController,
                      keyboardType: TextInputType.emailAddress,


                      decoration: InputDecoration(
                        labelText: 'Reservation Place',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      enabled:enabled,
                      controller: totalController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Total Paid',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),



                    defaultButton(
                      function:(){

                        navigateAndFinish(context, DocLayout());

                        },
                      text: 'verfiy',
                      isUpperCase: true,


                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
