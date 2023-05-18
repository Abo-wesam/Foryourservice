import 'package:flutter/material.dart';

import '../../helper/constant.dart';

class Ongoing extends StatelessWidget {
  const Ongoing({super.key});

  @override
  Widget build(BuildContext context) {
    final double hightScreen = hightscreenSize(context);
    final widthScreen = widthscreenSize(context);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kTextLigthColor,

          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))

      ),
      width: widthScreen,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ), //BoxDecoration
                    ), //Container
                  ), //Flexible
                  SizedBox(
                    width: 20,
                  ), //SizedBox
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ) //BoxDecoration
                    ), //Container
                  ) //Flexible
                ], //<Widget>[]
                mainAxisAlignment: MainAxisAlignment.center,
              ), //Row
            ),

            SizedBox(height: 20,),



            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ), //BoxDecoration
                    ), //Container
                  ), //Flexible
                  SizedBox(
                    width: 20,
                  ), //SizedBox
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ) //BoxDecoration
                    ), //Container
                  ) //Flexible
                ], //<Widget>[]
                mainAxisAlignment: MainAxisAlignment.center,
              ), //Row
            ),
          ],


        ),
      ),
    );
  }
}
