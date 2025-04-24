import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resumebuilderapp/styles/app_constraints.dart';
import 'package:resumebuilderapp/styles/text_styles.dart';

import '../custom_widgets/heading_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isPasswordEightCharLong = false;
  bool hasPasswordOneDigit = false;
  bool hasSymbol = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  //row string like /n
  RegExp numericReg = RegExp(r'[0-9]');
  RegExp symbolReg = RegExp(r'[!@#$%^&*()<>.,]');
  RegExp lowerReg = RegExp(r'[a-z]');
  RegExp upperReg = RegExp(r'[A-Z]');


  void passValidator(String password)
  {
    setState(() {
      isPasswordEightCharLong = false;
      if(password.length > 8)
        {
          isPasswordEightCharLong = true;
        }
      hasPasswordOneDigit = false;
      if(numericReg.hasMatch(password))
        {
          hasPasswordOneDigit = true;
        }
      hasSymbol = false;
      if(symbolReg.hasMatch(password))
        {
          hasSymbol = true;

        }
      hasLowerCase = false;
      if(lowerReg.hasMatch(password))
        {
          hasLowerCase = true;
        }
      hasUpperCase = false;
      if(upperReg.hasMatch(password))
      {
        hasUpperCase = true;
      }
    });
  }

  String? validator(String? value)
  {
    if(value == null || value.isEmpty)
      {
        return "Password is Required";
      }
    passValidator(value);
    if(!isPasswordEightCharLong || !hasPasswordOneDigit || !hasUpperCase || !hasLowerCase || !hasLowerCase)
      {
       return "Password doent match password criteria";
      }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(AppStrings.registerText , style: appBarTextStyles),
        backgroundColor: Colors.black,

      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: Color.fromARGB(255, 15, 15, 15),
        padding: EdgeInsets.only(left: 10 , top: 10,right: 10),
        child: Form(
          key: formKey,
          child: Column(
               children: [
                Heading(heading: AppStrings.signUpText , subheading: AppStrings.signUpSubHeading,)
                ,
                 SizedBox(height: 20,),
                 TextFormField(
                   style: hintTextStyles,
                   validator: (value){
                     if(value !.isEmpty)
                       {
                         return "This field cant be null";
                       }
                     return null;
                     
                   },
                   controller: name,
                   // keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     prefixIcon: Icon(Icons.text_fields, color: Colors.white,),
                     hintText: "Enter Name",
                       labelStyle: labelTextStyles,
                       hintStyle: hintTextStyles,
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(16),
                       borderSide: BorderSide(
                         color: Colors.deepOrange,
                         width: 3
                       )
                     ),
                     focusedBorder:  OutlineInputBorder(
                         borderRadius: BorderRadius.circular(16),
                         borderSide: BorderSide(
                             color: Colors.deepOrange,
                             width: 3
                         )
                     )
                   ),
                  
                ),
                 SizedBox(height: 20,),
                 TextFormField(
                   onChanged: (value){
                     passValidator(value);
                   },
                   style: hintTextStyles,
                   validator: (value) => validator(value),
                   controller: password,
                   // keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                       prefixIcon: Icon(Icons.lock , color: Colors.white,),
                       labelStyle: labelTextStyles,
                       hintStyle: hintTextStyles,
                       hintText: "Enter Password",
                       labelText: "Password",
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(16),
                           borderSide: BorderSide(
                               color: Colors.deepOrange,
                               width: 3
                           )
                       ),
                     focusedBorder:  OutlineInputBorder(
                         borderRadius: BorderRadius.circular(16),
                         borderSide: BorderSide(
                             color: Colors.deepOrange,
                             width: 3
                         )
                     )
                   ),
          
                 ),
                 SizedBox(height: 20,),
                 CheckTile(isCheck: isPasswordEightCharLong , title: "Contains 8 char",),
                 SizedBox(height: 10,),
                 CheckTile(isCheck: hasSymbol , title: "Contains symbol",),
                 SizedBox(height: 10,),
                 CheckTile(isCheck: hasPasswordOneDigit , title: "Contains 1 digit",),
                 SizedBox(height: 10,),
                 CheckTile(isCheck: hasUpperCase , title: "Contains Upper Case",),
                 SizedBox(height: 10,),
                 CheckTile(isCheck: hasLowerCase , title: "Contains Lower Case",),
                 SizedBox(height: 80,),
                 FilledButton(
                     style:FilledButton.styleFrom(
                       backgroundColor: Colors.deepOrange,
                       minimumSize: Size(MediaQuery.sizeOf(context).width/2, 50)
                     ) ,
                     onPressed: (){
                       if(formKey.currentState!.validate()){
                         print("Strong Password Entered");
                       }
                     }, child: Text("Submit"))
               ],
          ),
        ),
      ),
    );
  }
}

class CheckTile extends StatelessWidget {
  const CheckTile({
    super.key,
    required this.isCheck,
    required this.title
  });

  final bool isCheck;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height:10),
        AnimatedContainer(duration: Duration(milliseconds: 800),
          width: 20,
            height: 20,
          decoration: BoxDecoration(
            color:  isCheck ? Colors.green : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: isCheck ? Colors.transparent : Colors.green
            ),

          ),
          child: Icon(Icons.check , size: 15, color: isCheck ? Colors.white: Colors.grey.shade500),

        ),
        SizedBox(height: 10),
        Text(title, style: labelTextStyles,)


      ],
    );
  }
}

