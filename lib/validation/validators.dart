String emailValidator(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern.toString());
  if (!regex.hasMatch(value)) {
    return 'Enter a valid email address';
  } else {
    return "";
  }
}

String nameValidator(String value) {
  if (value?.length == 0) {
    return 'Please enter a Name';
  }
  return "";
}
