abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data);

  getGetApiParamResponse(String url, Map<String,String> queryParams);
}