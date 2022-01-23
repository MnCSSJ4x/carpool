import 'package:carpool/LoginForm.dart';

import 'user.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference=FirebaseDatabase.instance.ref();

DatabaseReference saveData(User user)
{
	var id=databaseReference.child('/users').push();
	id.set({
		'emailid':user.emailId,
		'rollnum':user.rollNumber,
		'bookings': user.bookings.toList(),
		'posFlexibility': user.posFlexibility,
		'negFlexibility': user.negFlexibility,
		
	}).catchError((error)=>print('You got an error $error'));
	return id;
}
