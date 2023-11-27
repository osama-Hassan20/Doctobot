import 'package:flutter/material.dart';

import '../../../modules/doctors/search_dr_screen.dart';
import '../components.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var doctorsSearchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: defaultFormField(
          context: context,
          controller: doctorsSearchController,
          type: TextInputType.text,
          validate: (String? value){
            if(value!.isEmpty){
              return 'enter text to search';
            }else{
              return null;
            }
          },
          label: 'Search',
          prefix: Icons.search,
          underLine: true,
          onSubmit: (text){
            print(text.isEmpty);
            (text.isEmpty)? print(''):navigateTo(context, SearchScreenDoctors(search:text ,)) ;
          }
      ),
    );
  }
}
