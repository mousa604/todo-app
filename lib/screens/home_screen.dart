import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/cubit/cubit.dart';
import 'package:todo_app/cubit/stats.dart';
import 'package:todo_app/screens/sport_screen.dart';


class Texts{
  String? name;
  String? massage;
  Texts({this.name,this.massage});
}

class Home extends StatelessWidget {
  var titlecontriller = TextEditingController();
  var timecontriller = TextEditingController();
  var datecontriller = TextEditingController();
  var descriptioncontriller = TextEditingController();
  var typecontriller = TextEditingController();

  final _ScafflodKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  List<Texts> texts =[
     Texts(name:'Sport',massage:'Keeb Going To Be Fit And Helther'),
     Texts(name:'Study',massage:'You Do It For Yourself'),
     Texts(name:'Dates',massage:'Respect your Dates To Be Respected'),
     Texts(name:'Other',massage:'......'),
  ];

  void removeDataFromTextFealid(){
    titlecontriller.text='';
    timecontriller.text='';
    datecontriller.text='';
    descriptioncontriller.text='';
    typecontriller.text='';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> AppCubit()..createDatabase()..printdata(),
      child: BlocConsumer<AppCubit,AppStats>(
        listener: (context,state){
      if(state is InsertToDatabase){
        Navigator.pop(context);
        }
      },
        builder: (context,state){
          AppCubit cubit =AppCubit.get(context);
          cubit.printdata();

          return Scaffold(
            key:_ScafflodKey ,
            backgroundColor:  const Color(0xff483728),
            appBar: AppBar(
              backgroundColor: const Color(0xff483728),
              elevation: 0,
              title:  Text('Notes',style: GoogleFonts.lato(fontSize:30 ,fontWeight: FontWeight.bold),),
            ),

            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Sport('Sport')),
                              );
                            },
                            child: Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                Container(
                                  height: 250,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xffa37d5c),
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.only(top:100),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text('Keeb Going To Be Fit And Helther',
                                            style:GoogleFonts.lato(color: Colors.white,fontSize: 20) ,),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Container(
                                    height: 30,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff815731),
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Center(child: Text('Sport',style: GoogleFonts.lato(color: Colors.white,fontSize: 20),)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Sport('Study')),
                              );
                            },
                            child: Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                Container(
                                  height: 250,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xffa37d5c),
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.only(top:100,left: 10),
                                    child: Text('You Do It For Yourself',
                                      style:GoogleFonts.lato(color: Colors.white,fontSize: 20) ,),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Container(
                                    height: 30,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff815731),
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Center(child: Text('Study',style: GoogleFonts.lato(color: Colors.white,fontSize: 20),)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Sport('Dates')),
                              );
                            },
                            child: Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                Container(
                                  height: 250,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xffa37d5c),
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.only(top:100,left: 10),
                                    child: Text('Respect your Dates To Be Respected',
                                      style:GoogleFonts.lato(color: Colors.white,fontSize: 20) ,),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Container(
                                    height: 30,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff815731),
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Center(child: Text('Dates',style: GoogleFonts.lato(color: Colors.white,fontSize: 20),)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Sport('Other')),
                              );
                            },
                            child: Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                Container(
                                  height: 250,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xffa37d5c),
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.only(top:100,left: 10),
                                    child: Text('.......',
                                      style:GoogleFonts.lato(color: Colors.white,fontSize: 20) ,),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Container(
                                    height: 30,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff815731),
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Center(child: Text('Other',style: GoogleFonts.lato(color: Colors.white,fontSize: 20),)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),



                  ],
                ),
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FloatingActionButton(
                backgroundColor: const Color(0xffbd7c42),
                onPressed: () {
                  if (cubit.isshow) {
                    if(_formKey.currentState!.validate()){
                      cubit.insertToDatabase(title: titlecontriller.text, time: timecontriller.text, date: datecontriller.text,description: descriptioncontriller.text,status: typecontriller.text);
                      removeDataFromTextFealid();

                    }

                  }
                  else {
                    _ScafflodKey.currentState!.showBottomSheet(

                          (context) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      style: const TextStyle(color: Color(0xff8a4e1e)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'enter title pleas';
                                        }
                                      },
                                      controller: titlecontriller,
                                      decoration: const InputDecoration(
                                        iconColor: Colors.red,
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xff483728))
                                          ),
                                           focusedBorder: OutlineInputBorder(
                                               borderSide: BorderSide(color: Color(0xffa37d5c))
                                           ) ,


                                          labelText: 'tile',
                                          labelStyle: TextStyle(color: Color(0xffa37d5c)),
                                          prefixIcon: Icon(
                                            Icons.title,
                                            color: Color(0xffa37d5c),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      style: const TextStyle(color: Color(0xff8a4e1e)),
                                      onTap: () {
                                        showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                            .then((value) => timecontriller.text =
                                            value!.format(context));
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'enter time pleas';
                                        }
                                      },
                                      controller: timecontriller,
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xff483728))
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xffa37d5c))
                                          ) ,
                                          border: OutlineInputBorder(),
                                          labelText: 'time',
                                          labelStyle: TextStyle(color: Color(0xffa37d5c)),
                                          prefixIcon: Icon(
                                            Icons.watch_later_outlined,
                                              color: Color(0xffa37d5c)
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      style: const TextStyle(color: Color(0xff8a4e1e)),
                                      onTap: (){
                                        showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.parse('2022-10-10'))
                                            .then((value) {
                                          datecontriller.text=DateFormat.yMMMd().format(value!);
                                        });
                                      },
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return 'date must be not empty';
                                        }else
                                          return null;
                                      },
                                      controller: datecontriller,
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff483728))
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xffa37d5c))
                                        ) ,
                                        labelText: 'Date',
                                        labelStyle: TextStyle(color: Color(0xffa37d5c)),
                                        prefixIcon: Icon(Icons.date_range,color: Color(0xffa37d5c)),
                                        border:OutlineInputBorder(),

                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      style: const TextStyle(color: Color(0xff8a4e1e)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'enter description pleas';
                                        }

                                      },
                                      controller: descriptioncontriller,
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xff483728))
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xffa37d5c))
                                          ) ,
                                          border: OutlineInputBorder(),
                                          labelText: 'description',
                                          labelStyle: TextStyle(color: Color(0xffa37d5c)),
                                          prefixIcon: Icon(
                                            Icons.description,
                                              color: Color(0xffa37d5c)
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      style: const TextStyle(color: Color(0xff8a4e1e)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'enter description pleas';
                                        }
                                      },
                                      controller: typecontriller,
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xff483728))
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xffa37d5c))
                                          ) ,
                                          border: OutlineInputBorder(),
                                          labelText: 'type',
                                          labelStyle: TextStyle(color: Color(0xffa37d5c)),
                                          prefixIcon: Icon(
                                              Icons.more_horiz,
                                              color: Color(0xffa37d5c)
                                          )),
                                    ),
                                  ],
                                ))
                        ],
                      ),
                          ),
                    ).closed.then((value) => {
                      cubit.changeBouttonCheet(show: false, icon: Icons.edit)
                    });
                    cubit.changeBouttonCheet(show: true, icon: Icons.add);

                  }
                },
                child: Icon(cubit.Icon),
              ),
            ),

          );
        },

      ),
    );
  }
}

 Widget builtCart(Texts model)=> InkWell(
   onTap: (){},
   child: Stack(
     alignment: AlignmentDirectional.topCenter,
     children: [
       Container(
         height: 250,
         width: 200,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           color: const Color(0xffa37d5c),
         ),
         child:  Padding(
           padding: const EdgeInsets.only(top:100,left: 10),
           child: Text('${model.massage}',
             style:GoogleFonts.lato(color: Colors.white,fontSize: 20) ,),
         ),
       ),
       Padding(
         padding: const EdgeInsets.only(top: 30),
         child: Container(
           height: 30,
           width: 150,
           decoration: BoxDecoration(
             color: const Color(0xff815731),
             borderRadius: BorderRadius.circular(15)
           ),
           child: Center(child: Text('${model.name}',style: GoogleFonts.lato(color: Colors.white,fontSize: 20),)),
         ),
       )
     ],
   ),
 );