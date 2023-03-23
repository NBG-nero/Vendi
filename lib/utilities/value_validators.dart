class ValueValidator {
  validateName(String name) {
    return isEmptyName(name) ?? limit(name, min: 2);
  }

  validateEmail(String email) {
    if (!RegExp(
            r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$")
        .hasMatch(email)) {
      return 'Enter a valid Email Address';
    }
    return null;
  }

  validatePassword(String password) {
    if (password.split('').length <= 5 &&
        !RegExp(r"/^(?=.[A-Za-z])(?=.[!@#$&])(?=.[0-9]).{8,}$")
            .hasMatch(password)) {
      // return 'Password not Strong enough ';
      return 'Must be atleast 5 and contain alpha numeric characters, numbers and symbols';
    }
    return null;
  }

  validatePhoneNum(String phoneNum) {
    if (phoneNum.length < 10) {
      return 'Enter a valid Phone Number';
    }
    return null;
  }

  validateCat(String category) {
    if (category.isEmpty) {
      return 'Enter Category Name';
    }
  }
   validateMainCat(String mainCat) {
    if (mainCat.isEmpty) {
      return 'Enter Main Category Name';
    }
  }

  String? isEmpty(value) {
    if (value.isEmpty) {
      return 'Empty field';
    }
    return null;
  }

  String? isEmptyName(value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  String optValidator(value) {
    return isEmpty(value) ?? validatePhoneNum(value);
  }

  String? isNumeric(val) {
    bool valid(val) => double.tryParse(val) != null;
    if (!valid(val)) {
      return 'all digits must be numeric';
    }
    return null;
  }

  String? limit(value, {int min = 0, int max = 0}) {
    if (min != 0 && value.length < min) {
      return '$min minimun characters';
    } else if (max != 0 && value.length > max) {
      return '$max maximum characters';
    }
    return null;
  }

  String? otp(value) {
    return isEmpty(value) ?? isNumeric(value) ?? limit(value, min: 2);
  }
}
