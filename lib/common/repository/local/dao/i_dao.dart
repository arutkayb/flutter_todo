abstract class IDao<E> {
  Future<E?> create(E entity);

  Future<E?> read();

  Future<E?> update(E entity);

  Future<bool> delete(E entity);
}
