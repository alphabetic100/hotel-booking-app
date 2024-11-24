bool emailValidationChecker(String value) {
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return value.isNotEmpty && emailRegex.hasMatch(value);
}

bool passwordValidationChecker(String value) {
  if (value.length < 8) return false;
  return true;
}
