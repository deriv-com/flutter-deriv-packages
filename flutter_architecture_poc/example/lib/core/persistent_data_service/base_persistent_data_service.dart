abstract class BasePersistentDataService {
  Future<void> delete(String key);

  Future<T?> read<T>(String key);

  Future<void> write<T>(String key, T value);
}
