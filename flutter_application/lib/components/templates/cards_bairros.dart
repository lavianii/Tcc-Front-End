import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CardsBairros  extends StatelessWidget {


  const CardsBairros ({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       Padding(
         padding: const EdgeInsets.fromLTRB(0, 0,0, 10),
         child: Column(
           children: [
            Card( 
              color: Colors.amber, 
              child: Container(
              padding:const  EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                   const Text('Flutter - 2019'),

                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: const Alignment(0,0),
                          width: 300,
                          height: 50,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const  Color.fromARGB(255, 234, 10, 10)
                      ),
                          child: const Text('vilaMimosa'),
                    ),
                    
                  ],
                ),
              ),
            ),
           ],
         ),
       );
  }
}
