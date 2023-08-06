abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data);

  getGetApiParamResponse(String url, String endpoint, Map<String,String> queryParams);
}