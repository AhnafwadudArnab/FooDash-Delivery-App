import 'package:flutter/material.dart';

import '../../Widgets/Big_Contents_models.dart';
import '../../utils/dimensions.dart';
import '../Login_Signup/sign_up.dart';
class Onboard extends StatefulWidget {

  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {

  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState(){
    _controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_,i){
                  return Padding(padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
                    child: Column(
                      children: [
                        Image.asset(contents[i].Image,height: 490,width: MediaQuery.of(context).size.width,fit:BoxFit.cover),
                        SizedBox(height: Dimension.height30),
                        Text(contents[i].title,style: TextStyle(
                          fontSize: Dimension.font26, // Using Dimension.font26 for font size
                          fontWeight: FontWeight.bold, // Example styling, customize as needed
                          color: Colors.black, // Example color, customize as needed
                        ),
                        ),
                        SizedBox(height: Dimension.height15),
                        Text(contents[i].description,style: TextStyle(
                          fontSize: Dimension.font15,
                          color: Colors.black,
                        ),),
                      ],
                    ),
                  );
                }
            ),
          ),
          Container(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              List.generate(contents.length, (index)=> buildDot(index,context),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              if(currentIndex==contents.length-1){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const SignUp()));
              }
              _controller.nextPage(duration: const Duration(microseconds: 100), curve: Curves.bounceIn);
            },
            child: Container(
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(Dimension.radius40),color: Colors.redAccent),
              height: 55,
              margin: const EdgeInsets.all(40.0),
              width: double.infinity,
              child:
              Center(
                child: Text(
                  currentIndex==contents.length-1?"Start":"Next",style: TextStyle(
                  fontSize: Dimension.font20, // Using Dimension.font26 for font size
                  fontWeight: FontWeight.bold, // Example styling, customize as needed
                  color: Colors.white, // Example color, customize as needed
                ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Container buildDot(int index,BuildContext context){
    return Container(
      height: Dimension.height10,
      width: currentIndex == index?18:7,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimension.radius6),color: Colors.black38,
      ),
    );
  }
}
