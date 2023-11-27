import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';

import '../../../layout/doc_app/cubit/cubit.dart';

// ignore: must_be_immutable
class InfoDetailsItem extends StatelessWidget {
  InfoDetailsItem({Key? key ,  this.nurse = false,required this.image, required this.name, required this.rating,  this.specialiaty,}) : super(key: key);

  String? image;
  String? name;
  String? specialiaty;
  int? rating;
  bool nurse;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width:MediaQuery.of(context).size.width *0.15 ,
          height: 80,
          decoration: BoxDecoration(

            image:DecorationImage(
              image:  NetworkImage(image!),
            ) ,
          ),

        ),


        SizedBox(width: size.width *0.04,),
        Container(
          width: size.width*0.37,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:DocCubit.get(context).isDark ? HexColor('#FFFFFF').withOpacity(1) : HexColor('#292826'),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,

              ),
              nurse ?
              Text(specialiaty!,
                style: TextStyle(
                  fontSize: 14,

                  color: DocCubit.get(context).isDark ?HexColor('#FFFFFF').withOpacity(.6) :HexColor('#707070'),
                ),
              ):Container(),
            ],
          ),
        ),
        Spacer(),
        Container(
          height: 54,
          width: size.width *0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: DocCubit.get(context).isDark ? HexColor('#434343').withOpacity(1) : HexColor('#FFFFFF'),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 3
            ),
            child: Column(
              children: [
                Text('${rating!}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:DocCubit.get(context).isDark ?HexColor('#FFFFFF').withOpacity(.9) : HexColor('#292826'),
                  ),
                ),
                FlutterRating(
                  rating: rating!.toDouble(),
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

    );
  }
}
