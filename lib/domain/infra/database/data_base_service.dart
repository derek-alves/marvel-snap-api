abstract class DatabaseService<T> {
  Future<T> createConnection();
  Future<T> get connection;
}
