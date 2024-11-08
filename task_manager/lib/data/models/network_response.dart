class NetworkResponse {
  final bool isSuccess;
  final int ResponseCode;
  dynamic responseData;
  String errorMessage;

  NetworkResponse(
      {required this.isSuccess,
      required this.ResponseCode,
      this.responseData,
      this.errorMessage = 'Something Went Wrong!'});
}
