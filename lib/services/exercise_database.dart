import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/models/exercise.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {

  final String category;

  DatabaseService({ this.category });

  //collection reference
  final CollectionReference exerciseCollection = FirebaseFirestore.instance
      .collection('exercises');

  Future updateExercises(String categoryName, String exercise1, String exercise2, String exercise3, String exercise4, String exercise5, String exercise6, String exercise7, String exercise8, String exercise9, String exercise10) async{
    return await exerciseCollection.doc(category);
  }

  //exercise list from snapshot
  List<Exercise> _exerciseListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) => Exercise(
        name: doc["name"]?? '',
    )
    ).toList();
  }

  //exercise data from snapshot
  Exercise _exerciseDataFromSnapshot(DocumentSnapshot snapshot){
    return Exercise(
      /*name: snapshot.get("name"),
      exercise1: snapshot.data(),
      exercise2: snapshot.data(),
      exercise3: snapshot.data(),
      exercise4: snapshot.data(),
      exercise5: snapshot.data(),
      exercise6: snapshot.data()['exercise6'],
      exercise7: snapshot.data()['exercise7'],
      exercise8: snapshot.data()['exercise8'],
      exercise9: snapshot.data()['exercise9'],
      exercise10: snapshot.data()['exercise10']*/
    );
  }

  //get exercise stream
  Stream<List<Exercise>> get exercises {
    return exerciseCollection.snapshots()
      .map(_exerciseListFromSnapshot);
}

  //get exercise doc stream
  Stream<Exercise> get exerciseData {
    return exerciseCollection.doc(category).snapshots()
        .map(_exerciseDataFromSnapshot);
}

}