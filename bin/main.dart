import 'package:marvel_snap/infra/env/env.dart';
import 'package:marvel_snap/infra/factory/factory.dart';
import 'package:marvel_snap/infra/server/server.dart';
import 'package:shelf/shelf.dart';

void main(List<String> arguments) async {
  var cascadeHandler = Cascade()
      .add(
        cardRouterFactory().getHandler(),
      )
      .handler;
  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
  );
}
