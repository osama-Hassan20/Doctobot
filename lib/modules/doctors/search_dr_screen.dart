import 'package:flutter/material.dart';
import '../../layout/doc_app/cubit/cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/components/widgets/build_list_all_available.dart';

// ignore: must_be_immutable
class SearchScreenDoctors extends StatelessWidget {
  var search;

  SearchScreenDoctors({
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (DocCubit.get(context).allDoctorsModel!.data![index].name == search) {
                    return Build_List_all_Available(
                      model:
                      DocCubit.get(context).allDoctorsModel!.data![index],
                      context: context,
                      index: index,
                    );
                  }else{
                    return null;
                  }
                },
                separatorBuilder: (context, index) => Container(
                  height: .5,
                  color: Colors.black,
                ),
                itemCount:
                    DocCubit.get(context).allDoctorsModel!.data!.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
