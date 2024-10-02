import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'small_text.dart';
class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String lastHalf;
  bool HiddenText = true;
  double TextHeight = Dimension.screenHeight/4.86;//(973.33/200)
  @override
  void initState(){
    super.initState();
    if(widget.text.length>TextHeight){
      firstHalf = widget.text.substring(0,TextHeight.toInt());
      lastHalf = widget.text.substring(TextHeight.toInt()+1,widget.text.length);
    }
    else{
      firstHalf = widget.text;
      lastHalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: lastHalf.isEmpty?SmallText(color:AppColor.paraColor,size:Dimension.font17,text: firstHalf):Column(
        children: [
          SmallText(height:1.8,color:AppColor.paraColor,size:Dimension.font15,text: HiddenText?("$firstHalf. . ."):(firstHalf+lastHalf)),
          InkWell(
            onTap: (){
              setState(() {
                HiddenText = !HiddenText;
              });
            },
            child:
            Row(
              children: [
                const SmallText(text: "Show more",color: AppColor.mainColor,),
                Icon(HiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColor.mainColor,),
              ],
            ),
          )
        ],

      ),
    );
  }
}
