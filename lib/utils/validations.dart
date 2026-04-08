class Validators{
  // Email Validation
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email is required";
    }
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  // Password validation
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 8) {
      return "Minimum 8 characters required";
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "At least one uppercase letter required";
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "At least one lowercase letter required";
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      return "At least one number required";
    }

    if (!RegExp(r'[@$!%*?&#]').hasMatch(value)) {
      return "At least one special character required";
    }

    return null;
  }
}