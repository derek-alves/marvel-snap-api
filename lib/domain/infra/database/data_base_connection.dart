abstract class DatabaseConnection<T> {
  Future<T> createConnection();
  Future<T> get connection;
}
