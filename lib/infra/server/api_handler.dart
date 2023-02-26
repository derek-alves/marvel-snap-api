import 'package:shelf/shelf.dart';

abstract class ApiHandler {
  Handler getHandler();

  Handler createHandler({
    required Handler handler,
  }) {
    var pipeline = Pipeline();

    return pipeline.addHandler(handler);
  }
}
