


class Strings {
  static Strings? _instance;

  Strings._();

  static Strings get instance => _instance ??= Strings._();


  //=================================================Error Strings ==========================//
  String errorFailed = "Failed";
  String errorUnknownError = "Unknown Error";
  String errorUnknownErrorMsg = "Try after some time";
  String errorNetwork = "Network Error";
  String errorInvalidPhoneNo = "Network Error";
  String errorEmptyFields = "Empty Fields";
  String errorSmallPassword = "Password is too Short!";
  String errorInvalidFields = "Invalid Data";
  String errorValidationFailed= "Validation Fail";
  String errorEmptyFieldsMsg = "Complete All Fields";
  String passFieldsMsg = "Password and Confirm Password do not Match";


}
