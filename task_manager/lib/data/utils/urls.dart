class Urls {
  static const String _baseUrl = 'http://35.73.30.144:2005/api/v1';

  static const String Registration = '$_baseUrl/Registration';
  static const String Login = '$_baseUrl/Login';
  static const String addNewProduct = '$_baseUrl/createTask';
  static const String getNewProduct = '$_baseUrl/listTaskByStatus/New';
  static const String getCompleteProduct = '$_baseUrl/listTaskByStatus/Completed';
  static const String getProgressProduct = '$_baseUrl/listTaskByStatus/Progress';
  static const String getCancelledProduct = '$_baseUrl/listTaskByStatus/Canceled';
  static const String taskStatusCount = '$_baseUrl/taskStatusCount';

  static String updateTaskStatus(String taskID, String Status) =>
      '$_baseUrl/updateTaskStatus/$taskID/$Status';

  static String deleteTask(String taskID) =>
      '$_baseUrl/deleteTask/$taskID';

  static const String UpdateProfile = '$_baseUrl/ProfileUpdate';
  static  String VerifyEmail(String email) => '$_baseUrl/RecoverVerifyEmail/$email';
  static  String VerifyOTP(String email, String OTP) => '$_baseUrl/RecoverVerifyOtp/$email/$OTP';
  static const String SetPassword = '$_baseUrl/RecoverResetPassword';


}