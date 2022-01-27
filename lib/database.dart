import 'package:carpool/LoginForm.dart';

import 'user.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference=FirebaseDatabase.instance.ref();

DatabaseReference saveData(User user)
{
	var id=databaseReference.child('/users').push();
	id.set(user.toJson()).catchError((error)=>print('You got an error $error'));
	return id;
}

void updateDatabase(User user,DatabaseReference id)
{
  id.update(user.toJson());
}
