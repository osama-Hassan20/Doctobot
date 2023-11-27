import 'package:doctobot_app_project/layout/doc_app/cubit/cubit.dart';
import 'package:doctobot_app_project/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;

  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: widget.messages[index]['isUserMessage']
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                20,
                              ),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(
                                widget.messages[index]['isUserMessage']
                                    ? 0
                                    : 20,
                              ),
                              topLeft: Radius.circular(widget.messages[index]
                                      ['isUserMessage']
                                  ? 20
                                  : 0),
                            ),
                            color: widget.messages[index]['isUserMessage']
                                ? DocCubit.get(context).isDark
                                    ? Colors.white
                                    : defaultColor.withOpacity(1)
                                : DocCubit.get(context).isDark
                                    ? Colors.white24.withOpacity(.5)
                                    : defaultColor.withOpacity(.1)),
                        constraints: BoxConstraints(maxWidth: w * 2 / 3),
                        child: Text(
                          widget.messages[index]['message'].text.text[0],
                          style: TextStyle(
                            color: widget.messages[index]['isUserMessage']
                                ? DocCubit.get(context).isDark
                                    ? Colors.black
                                    : Colors.white
                                : DocCubit.get(context).isDark
                                    ? Colors.black
                                    : Colors.black,
                          ),
                        )),
                  ],
                ),
              );
            },
            separatorBuilder: (_, i) =>
                Padding(padding: EdgeInsets.only(top: 10)),
            itemCount: widget.messages.length),
        SizedBox(
          height: 80,
        )
      ],
    );
  }
}
