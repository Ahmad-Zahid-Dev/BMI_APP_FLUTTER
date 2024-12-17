import 'package:flutter/material.dart';
void main(){
  runApp(BmiApp());
}
//Start
//start
//start

class BmiApp extends StatefulWidget{
  @override
 State<StatefulWidget> createState() {
    return BmiAppState();
  }
}
class BmiAppState extends State<BmiApp>{
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result ="";
  var bgcolor = Colors.yellow[200];


  @override
  Widget build(BuildContext context){
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        
        
        appBar: AppBar(
          title: Center(child: Text("BMI Calculator")),
          backgroundColor: Colors.blue[700] ,
        ),

        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
              width: 300,
              
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text("BMI" , style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  SizedBox(height: 25,),
                  TextField(
                    //autofillHints:[AutofillHints.password] ,
                    autocorrect: false,
                    enableSuggestions: false,
                    autofocus: true,
                    controller: wtController,
                    
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.line_weight),
                      label: Text("Enter Your Weight in (Kg)"),
                       
                    ),
                  keyboardType: TextInputType.numberWithOptions(),
                  ),
                 SizedBox(height: 15,),
                  TextField(
                    autofocus: true,
                    controller: ftController,
                    //autofillHints:[AutofillHints.password] ,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.height_rounded),
                      label: Text("Enter Your Height in (Feet)"), 
                    ),
                  
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: inController,
                    autofocus: true,
                    //autofillHints:[AutofillHints.newPassword] ,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.height_outlined),
                      label: Text("Enter Your Height in (Inch)"), 
                    ),
                  
                  ),
                  SizedBox(height: 17,),
                  ElevatedButton(
                    child: Text("CALCULATE" , style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inc = inController.text.toString();
          
                      if(wt!= "" && ft!= "" && inc!="" ){
          
                        // BMI CALCULATION
                        var dwt = double.parse(wt);
                        var dft = double.parse(ft);
                        var dinc = double.parse(inc);
                        var tinch = (dft*12) + dinc;
                        var tcm = tinch*2.54;
                        var tmt = tcm/100;
                        var bmi = dwt/(tmt * tmt);
                        var msg = "";
                        if(bmi < 18.50){
                          msg = "You are UNDER WEIGHT !!";
                          bgcolor = Colors.blueGrey;
                        }else if (18.50 < bmi && bmi < 25.00){
                          msg = "You are NORMAL WEIGHT !! ";
                          bgcolor = Colors.green.shade400;
                        }else if (25.00 < bmi && bmi < 29.9){
                          msg = "You are OVER WEIGHT !! ";
                          bgcolor = Colors.orange.shade300;
                        }else if (29.9 < bmi && bmi < 34.9){
                          msg = "You are OBESE !! ";
                          bgcolor = Colors.red.shade200;
                        }else if  (34.9 < bmi){
                          msg = "You are EXTREMELY OBESE !! ";
                          bgcolor = Colors.red.shade400;
                        }
        
        
                        setState((){
                          result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
          
                        });
          
                      
                      }
                      else{
                        setState((){
                          result = "Please fill all the required blanks!!";
                        });
                    }
                    },
                  ),
                  SizedBox(height: 15 ,),
                  Text(result , style: TextStyle(fontSize:18 ,fontWeight: FontWeight.w500 ),)
                ],
              ),
            ),
          ),
        ),
      ),

    );

  }
}