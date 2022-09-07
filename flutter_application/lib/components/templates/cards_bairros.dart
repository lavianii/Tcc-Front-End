import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';

class CardsBairros  extends StatelessWidget {

 final String textSuperior;
 final String textInferior;

final int colorSuperior;
final int colorInferior;

 final double paddingSuperior;
 final double width;
 final double height;
 final double borderRadius;

 
  const CardsBairros ({Key? key, required this.textSuperior, required this.colorInferior, required this.colorSuperior,
  required this.textInferior, required this.paddingSuperior, required this.width,required this.height,
  required this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

         //coluna que contem o card
          Column(
           children: [

            //Parte superior do card
            Card(
              elevation: 10, 
              shadowColor: Colors.black87,
              color: Color(colorSuperior), 
              child: Container(
              padding: EdgeInsets.only(top:  paddingSuperior),
              child: Column(
                  children: [
                    Text(
                      textSuperior,
                      style: const  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:  17,
                            ),
                      ),
 
                  //parte inferior do card
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      alignment: const Alignment(0,0),
                      width: width,
                      height: height,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                        color: Color(colorInferior),
                        
                      ),

                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StarButton(
                              isStarred: false,
                              iconSize: 35,
                              iconColor: Colors.yellow,
                              valueChanged: (_isStarred) {
                              print('Is Favourite $_isStarred)');
                            },
                        ),
                          ),
                         Text(
                          textInferior,
                          style: const  TextStyle(
                            fontSize:  15,
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
           ]
         );
  }
}
