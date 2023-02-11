abstract class Repository<T> {
  Future<T?> findById(int id);
}
