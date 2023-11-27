import 'package:flutter/material.dart';

import '../../../layout/doc_app/cubit/cubit.dart';
import '../../../shared/components/widgets/build_list_all_available.dart';

class ListOfAllDoctors extends StatelessWidget {
  const ListOfAllDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.separated(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => Build_List_all_Available(
        model:DocCubit.get(context).allDoctorsModel!.data![index],
        context: context,
        index: index,),
      separatorBuilder: (context, index) => SizedBox(
        height: size.height * 0.03,
      ),
      itemCount:
      DocCubit.get(context).allDoctorsModel!.data!.length,
    );
  }
}
