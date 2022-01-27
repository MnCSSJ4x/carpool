import 'package:firebase_database/firebase_database.dart';
import 'database.dart';

class User
{
	late String emailId;
	late DatabaseReference _id;
	late String rollNumber;
	late String date;//baadme chnge krna hai ise
	late String time;
	late int posFlexibility=30,negFlexibility=30;//in minutes
  Set bookings={};

  	void addUserToDatabase(String emailId, rollNumber)
	{
		this.emailId = emailId;
		this.rollNumber = rollNumber;
		_id=saveData(this);
	}
	User(this.emailId, this.rollNumber);
	String getId() { return _id.toString();}
	void addBooking(String date)
	{
		bookings.add(date);
	}


}

