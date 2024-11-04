sealed class FormValidator {
  static String _emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  static String? requireValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    final emailRegex = RegExp(_emailRegex);
    if (!emailRegex.hasMatch(value!)) {
      return 'Please enter valid email';
    }
    return null;
  }

  static String? requiredEmailValidator(String? value) {
    var result = requireValidator(value);
    if (result != null) return result;

    return emailValidator(value);
  }
}
