



import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/cubit/stats.dart';

import '../shared/shared.dart';

class AppCubit extends Cubit<AppStats>{
  AppCubit() : super(InationalStats());

  static AppCubit get (context)=> BlocProvider.of(context);



  var Icon = Icons.edit;
  bool isshow = false;

  void printdata(){
    print('sdhddddddddddddddddddddddddd');
    print('${database}');
  }

  void updateDatabase(
  {
  required String status,
    required int id
}){
     database!.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) => {
          getDataBase(database),
          emit(UpdateToDatabase()),
     });

  }
  void deleteDatabase(
      {

        required int id
      }){
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) => {
      getDataBase(database),
      print('${value}'),
      emit(DeleteToDatabase()),
    }).catchError((error){
      print('rrrrrrrrrrrrrrrrrrrrrrrr ${error.toString()}');
    });

  }

  void createDatabase()  {
     openDatabase('Todo.db', version: 1,
        onCreate: (database, version) {
          print('data base created');
          database
              .execute(
              'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT, time TEXT,description TEXT ,status TEXT )')
              .then((value) => print('table created'))
              .catchError((error) {
            print('error when created table');
          });
        }, onOpen: (database) {
          getDataBase(database);
          print('database opened');
        }).then((value) {
          database=value;
          emit(CreateDatabase());});
  }

   insertToDatabase({required title,required time,required date,required description,required status})async {
      await database!.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO tasks(title,date,time,description,status) VALUES("$title","$date","$time","$description","$status")')
          .then((value) {
            printdata();
        print('$value data are inserted');
        emit(InsertToDatabase());
        getDataBase(database);
      }).catchError((error) {
        print('${error.toString()}');
      });
      return null;
    });
  }
   getDataBase(database){
    sporttasks=[];
    studytasks=[];
    datestasks=[];
    othertasks=[];

    return database.rawQuery('SELECT * FROM tasks').then((value)  {

      value.forEach((element) {
        if(element['status']=='sport')
          sporttasks.add(element);
        else if(element['status']=='study')
          studytasks.add(element);
        else if(element['status']=='dates')
          datestasks.add(element);
        else
          othertasks.add(element);
      });

      emit(GetDataBase());
    });
  }

  void changeBouttonCheet({required bool show, required IconData icon}){
    isshow=show;
    Icon=icon;
    emit(BottomSheetChange());
  }


}