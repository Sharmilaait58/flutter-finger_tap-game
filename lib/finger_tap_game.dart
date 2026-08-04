import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home:Mainpage()
    ));
}
class Mainpage extends StatelessWidget{
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

        Container(
          color:Colors.blueAccent,
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          child:Center(
          child:MaterialButton(
          color:Colors.white,
          shape: CircleBorder(),
          height : 100,
          minWidth : 100,
          onPressed:(){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> Gamepage()));
          },
          child: Text("START"),
          ),
        ),
        ),
        
        Container(
          color:Colors.redAccent,
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          child: Center(
          child:MaterialButton(
          color:Colors.white,
          shape: CircleBorder(),
          height : 100,
          minWidth : 100,
          onPressed:(){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> Gamepage()));
          },
          child: Text("START"),
          ),
          ),
        ),
      ],
      )
    );
  }
}

class Gamepage extends StatefulWidget {
  const Gamepage({super.key});

  @override
  State<Gamepage> createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  double bluecardheight = 0;
  double redcardheight = 0;

  int PlayerAScore = 0;
  int PlayerBScore = 0;

  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    if(initialized == false)
    {
    bluecardheight = MediaQuery.of(context).size.height / 2;
    redcardheight =  MediaQuery.of(context).size.height / 2;

    initialized = true;
    }
    return Scaffold(
      body:Column(
        children: [
          MaterialButton(
            onPressed: (){
              setState((){
                bluecardheight = bluecardheight + 30;
                redcardheight = redcardheight - 30;

                PlayerBScore = PlayerBScore + 5;
              });

              double winningheight = MediaQuery.of(context).size.height - 60;

              if(bluecardheight > winningheight){
              Navigator.push(context,MaterialPageRoute(builder: (context)=> Resultpage(PlayerBScore, "b")));
              }


            },
            padding :EdgeInsets.zero,
            child: Container(
            color:Colors.blueAccent,
            height:bluecardheight,
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child:Row(
              children: [
                Expanded(child: Text("Player B",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                ),
                ),
              Text(PlayerBScore.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              ],
            ),
            ),
          ),
           MaterialButton(
            onPressed: (){
              setState((){
                redcardheight = redcardheight + 30;
                bluecardheight = bluecardheight - 30;

                PlayerAScore =  PlayerAScore + 5;
            }); 

             double winningheight = MediaQuery.of(context).size.height - 60;

              if(redcardheight > winningheight){
              Navigator.push(context,MaterialPageRoute(builder: (context)=> Resultpage(PlayerAScore,"a")));
              }
            },
            padding: EdgeInsets.zero,
             child: Container(
                       color:Colors.redAccent,
                       height: redcardheight,
                       width: double.infinity,
                       alignment: Alignment.bottomLeft,
                       padding: EdgeInsets.all(10),
                       child:Row(
              children: [
                Expanded(child: Text("Player A",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                ),
                ),
              Text(PlayerAScore.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
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
// ignore: must_be_immutable
class Resultpage extends StatelessWidget{

  int Score = 0;
  String Player = ""; 

  Resultpage(this.Score,this.Player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Player == "a" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Score.toString(),style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
        Text(Player == "a"? "Player A Won": "Player B Won",style: TextStyle(fontSize: 35),),
        MaterialButton(onPressed: (){
          Navigator.pop(context);
          Navigator.pop(context);
        },
          color:Colors.white,
          child: Text("Restart Game"),
           ),
      ],),
    ),
    );
  }
}
