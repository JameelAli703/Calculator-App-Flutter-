import 'package:calculator_app/components/my_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'constants.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
var userInput = '';
var answer = '';
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(title: Center(child: Text('Calculator', style: TextStyle(color: Colors.blue),)), backgroundColor: Colors.white,),
      backgroundColor: Colors.black,
      body: SafeArea(
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child:
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                            Text(userInput.toString(), style: TextStyle(fontSize: 30, color: Colors.white),),
                            SizedBox(height: 15,),
                            Text(answer.toString(), style: TextStyle(fontSize: 30, color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children:  [
                            MyButton(title: 'AC', onPress: (){
                              userInput = '';
                              answer = '';
                              setState(() {

                              });
                            },),
                            MyButton(title: '+/-', onPress: (){
                              userInput  += '+/-';
                              setState((){
                              });
                            }),
                            MyButton(title: '%', onPress: (){
                              userInput  += '%';
                              setState((){
                              });
                            }),
                            MyButton(title: '/',color: orangeColor, onPress: (){
                              userInput  += '/';
                              setState((){
                              });
                            }),
                          ],
                        ),
                        Row(
                          children:  [
                            MyButton(title: '7', onPress: (){
                              userInput  += '7';
                              setState((){
                              });
                            },),
                            MyButton(title: '8', onPress: (){
                              userInput += '8';
                              setState((){
                              });
                            }),
                            MyButton(title: '9', onPress: (){
                              userInput += '9';
                              setState((){
                              });
                            }),
                            MyButton(title: 'x',color: orangeColor, onPress: (){
                              userInput  += 'x';
                              setState((){
                              });
                            }),
                          ],
                        ),
                        Row(
                          children:  [
                            MyButton(title: '4', onPress: (){
                              userInput += '4';
                              setState((){
                              });
                            },),
                            MyButton(title: '5', onPress: (){
                              userInput += '5';
                              setState((){
                              });
                            }),
                            MyButton(title: '6', onPress: (){
                              userInput += '6';
                              setState((){
                              });
                            }),
                            MyButton(title: '-',color: orangeColor, onPress: (){
                              userInput  += '-';
                              setState((){
                              });
                            }),
                          ],
                        ),
                        Row(
                          children:  [
                            MyButton(title: '1', onPress: (){
                              userInput += '1';
                              setState((){
                              });
                            },),
                            MyButton(title: '2', onPress: (){
                              userInput += '2';
                              setState((){
                              });
                            }),
                            MyButton(title: '3', onPress: (){
                              userInput += '3';
                              setState((){
                              });
                            }),
                            MyButton(title: '+',color: orangeColor, onPress: (){
                              userInput  += '+';
                              setState((){
                              });
                            }),
                          ],
                        ),
                        Row(
                          children:  [
                            MyButton(title: '0', onPress: (){
                              userInput += '0';
                              setState((){
                              });
                            },),
                            MyButton(title: '.', onPress: (){
                              userInput += '.';
                              setState((){
                              });
                            }),
                            MyButton(title: 'DEL', onPress: (){
                              userInput = userInput.substring(0, userInput.length-1);
                              setState(() {
                              });
                            }),
                            MyButton(title: '=',color: orangeColor, onPress: (){
                              equalPress();
                              setState((){
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress (){
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}





