// Validor functions for the form fields

// Email validator
String? emailValidator(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern.toString());
  //  Returns null if the email is valid
  if (!regex.hasMatch(value)) {
    return 'Enter a valid email address';
  } else {
    return null;
  }
}

// Name Validator TODO: Create it a dynamic function that can validate any basic field
String? nameValidator(String value) {
  if (value.isEmpty) {
    return 'Please enter a Name';
  }
  return null;
}
