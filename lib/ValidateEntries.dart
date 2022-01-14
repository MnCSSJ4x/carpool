import 'package:string_validator/string_validator.dart';

bool validate_userid(String orgid, String userid) {
  if (userid.contains(orgid)) {
    return true;
  }

  return false;
}

bool validate_rollnum(String rollnum) {
  return isAlphanumeric(rollnum);
}
