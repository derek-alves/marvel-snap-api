import 'package:marvel_snap/domain/infra/infra.dart';
import 'package:marvel_snap/infra/http/dio_adapter.dart';

HttpService dioAdapterFactory() => DioAdapter();
