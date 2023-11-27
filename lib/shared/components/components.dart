import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../layout/doc_app/cubit/cubit.dart';
import '../styles/colors.dart';

Widget defaultButton ({
  double? width ,
  double height = 40,
  Color background = defaultColor,
  bool isUpperCase = false,
  required VoidCallback function,
  required String text,
  double fontSize = 12

}) =>
    Container(

      width: width != null? width:double.infinity,
      height: height,

      child: MaterialButton(
        onPressed: function ,
        child: Text(
          isUpperCase ? text.toUpperCase(): text,
          style: TextStyle(
            color: Colors.white,
            fontSize:fontSize
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: HexColor('#595CFF'),
      ),
    ) ;



//******************************************************************************



Widget defaultTextButton({
  required VoidCallback? function,
  required String text,
})=>TextButton(
  onPressed: function,
  child: Text(text,
  style: TextStyle(
    color: HexColor('#595CFF')
  ),
  ),


);


//******************************************************************************
Widget socialButton({
  GestureTapCallback? onTap,
  String? text,
  //String? image,
  Color? txtColor,
  Color? btnColor,

})=>GestureDetector(
  onTap: onTap,
  child: Container(
    height: 40,
    width: double.infinity,

    decoration: BoxDecoration(
      color: btnColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image.asset(
        //   'assets/images/${image}',
        //   height: 20,
        //   width: 26,
        // ),
        Text(
          '${text}',
          style: TextStyle(
            color: txtColor,
            fontSize: 15
          ),

        ),
      ],
    ),
  ),
);
//******************************************************************************
//******************************************************************************



Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  bool isPassword = false ,
  ValueChanged? onChanged,
  GestureTapCallback? onTap,
  FormFieldValidator<String>? validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
  bool underLine = true,
  required var context,
}) =>
    TextFormField(

      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted:onSubmit,
      onChanged: onChanged,
      validator:validate,
      onTap: onTap,
      enabled: isClickable,
      style: TextStyle(
        fontSize: 18,
        color: DocCubit.get(context).isDark ? HexColor('#FFFFFF').withOpacity(1) : HexColor('#292826'),


      ),

      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: DocCubit.get(context).isDark ? Colors.white: Colors.black.withOpacity(.5),
        ),


        labelText: label,

        prefixIcon: Icon(
          prefix,
          color:DocCubit.get(context).isDark ? Colors.white: Colors.black.withOpacity(.5),

        ),
        suffixIcon: suffix !=null ? IconButton(
          onPressed:  suffixPressed,

          icon: Icon(
            suffix,
            color:DocCubit.get(context).isDark ? Colors.white: Colors.black.withOpacity(.5),

          ),
        ) :null,
        border: underLine?   UnderlineInputBorder() : InputBorder.none,
        
      ),
    );



//******************************************************************************



void navigateTo(context ,widget ) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget ,
  ),
);



//******************************************************************************



void navigateAndFinish(context ,widget ) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget ,
  ),
      (route) {
    return false;
  },
);



//******************************************************************************



void ShowToast({
  required String text,
  required ToastState state,
}) => Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor:chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastState {SUCCESS , ERROR , WORNING}

Color? chooseToastColor (ToastState state)
{
  Color color;
  switch(state)
  {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WORNING:
      color = Colors.amber;
      break;
  }
  return color;
}



//******************************************************************************



