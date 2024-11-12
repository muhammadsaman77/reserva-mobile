class CacheClient {
  final Map<String, dynamic> _cache = {};

  void write<T>({required String key, required T value}) {
      _cache[key] = value;

  }

  T? read<T>({required String key}) {

      return _cache[key] as T?;

  }
}