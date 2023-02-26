import '../../../domain/infra/infra.dart';
import '../../http/dio_adapter.dart';

HttpService dioAdapterFactory() => DioAdapter();
