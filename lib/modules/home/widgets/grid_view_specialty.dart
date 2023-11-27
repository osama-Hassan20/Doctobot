import 'package:flutter/material.dart';

import '../../../layout/doc_app/cubit/cubit.dart';
import 'build_specialty_item.dart';

class GridViewSpecialty extends StatelessWidget {
  const GridViewSpecialty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio:.7,
      children: List.generate(
        // 14,
        DocCubit.get(context).allCategoriesModel!.data!.length,
            (index) =>BuildSpecialtyItem(model:DocCubit.get(context).allCategoriesModel!.data![index],context: context,index: index) ,
      ),
    );
  }
}
