import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/cubit/stats.dart';

import '../cubit/cubit.dart';
import '../shared/shared.dart';
import '../shared/shared.dart';

class Sport extends StatelessWidget {

String tybe;
Sport(this.tybe);



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit()..printdata(),
      child: BlocConsumer<AppCubit,AppStats>(
        listener: (context,state){ },
        builder: (context,state){
        List tasks=sporttasks;
        if(tybe=='Sport')
          tasks=sporttasks;
        else if(tybe=='Study')
          tasks=studytasks;
        else if(tybe=='Dates')
          tasks=datestasks;
        else
          tasks=othertasks;

          AppCubit cubit =AppCubit.get(context);
          return Scaffold(
            backgroundColor:  Color(0xff483728),
            appBar: AppBar(
              backgroundColor: Color(0xff483728),
              elevation: 0,
              title:  Text('$tybe Notes',style: GoogleFonts.lato(fontSize:30 ,fontWeight: FontWeight.bold),),
              leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){Navigator.pop(context);},),
            ),

            body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>Column(
                      children: [
                        Stack(


                          children: [
                            Container(
                              height: 180,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Color(0xffa37d5c),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child:Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(

                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Text('${tasks[index]['title']}',style: GoogleFonts.lato(fontSize:30 ,fontWeight: FontWeight.bold,color: Colors.white),)),
                                        Spacer(),
                                        IconButton(onPressed: (){
                                          AppCubit.get(context).deleteDatabase(id:tasks[index]['id']);
                                        }, icon: Icon(Icons.delete,color: Color(0xff483729),)
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 18,),
                                    Row(

                                      children: [
                                        Text('Time : ${tasks[index]['time']}',style: GoogleFonts.lato(fontSize:20 ,fontWeight: FontWeight.bold,color: Colors.white),),
                                        SizedBox(width: 30,),

                                        Expanded(child: Text('${tasks[index]['date']}',style: GoogleFonts.lato(fontSize:20 ,fontWeight: FontWeight.bold,color: Colors.white),)),


                                      ],
                                    ),

                                    SizedBox(height: 18,),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Row(
                                          children: [
                                            Text('Description :',style: GoogleFonts.lato(fontSize:20 ,fontWeight: FontWeight.bold,color: Colors.white),),
                                            Spacer(),


                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                          child: Text('${tasks[index]['description']}',style: GoogleFonts.lato(fontSize:15 ,fontWeight: FontWeight.bold,color: Colors.white),maxLines: 3,overflow: TextOverflow.ellipsis,),
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                              ) ,
                            ),


                          ],
                        ),
                      ],
                    ),
                    separatorBuilder: (context,index)=>SizedBox(height: 20,),
                    itemCount: tasks.length)
            ),

          );
        },
      ),
    );
  }
}
