import 'package:dio/dio.dart';
import 'package:marvel_snap/domain/infra/http/http.dart';

class DioAdapter implements HttpService {
  final Dio service = Dio();
  @override
  Future request(
      {required String url,
      required RequestMethod method,
      Map<String, dynamic> queryParameters = const {},
      Map<String, dynamic> body = const {},
      Map<String, dynamic> headers = const {},
      List<Map<String, dynamic>> files = const []}) async {
    late final Map<String, dynamic> defaultHeaders;
    late final Future<Response>? futureResponse;

    if (headers.isNotEmpty) {
      defaultHeaders = headers;
    } else {
      defaultHeaders = {
        'Content-Type': 'application/json',
        'accept': 'application/json'
      };
    }

    Response response = Response(
      data: '',
      statusCode: 500,
      requestOptions: RequestOptions(
        path: url,
        headers: defaultHeaders,
      ),
    );

    try {
      futureResponse = _getResponse(
        method: method,
        url: url,
        queryParameters: queryParameters,
        options: Options(
          headers: defaultHeaders,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
        body: body,
      );

      response = await futureResponse.timeout(const Duration(seconds: 5));
    } catch (error) {
      throw HttpResponse.serverError;
    }
    return _handleResponse(response);
  }

  Future<Response<dynamic>> _getResponse({
    required RequestMethod method,
    required String url,
    Options? options,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
  }) {
    if (method == RequestMethod.get) {
      return service.get(url,
          queryParameters: queryParameters, options: options);
    } else if (method == RequestMethod.put) {
      return service.put(url, data: body, options: options);
    } else if (method == RequestMethod.post) {
      return service.post(url, data: body, options: options);
    } else if (method == RequestMethod.patch) {
      return service.patch(url, data: body, options: options);
    } else if (method == RequestMethod.delete) {
      return service.delete(url,
          queryParameters: queryParameters, options: options);
    } else {
      return service.get(url,
          queryParameters: queryParameters, options: options);
    }
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data.isEmpty ? {} : response.data as Map<String, dynamic>;
    } else if (response.statusCode == 204) {
      return {};
    } else if (response.statusCode == 400) {
      throw HttpResponse.badRequest;
    } else if (response.statusCode == 401) {
      throw HttpResponse.unauthorized;
    } else if (response.statusCode == 403) {
      throw HttpResponse.forbidden;
    } else if (response.statusCode == 404) {
      throw HttpResponse.notFound;
    } else if (response.statusCode == 422) {
      throw HttpResponse.invalidData;
    } else {
      throw HttpResponse.serverError;
    }
  }
}
