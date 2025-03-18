import 'dart:async';

import 'package:recipe_app/domain/repository/bookmark_repository.dart';

class MockBookmartRepositoryImpl implements BookmarkRepository {
  final _ids = <int>{2, 4};
  final _controller = StreamController<Set<int>>.broadcast();

  MockBookmartRepositoryImpl() {
    _controller.add(_ids);
  }

  @override
  Future<void> clear() async {
    _ids.clear();
  }

  @override
  Future<List<int>> getBookmarkIds() async {
    return _ids.toList();
  }

  @override
  Future<void> save(int id) async {
    _ids.add(id);
    _controller.add(_ids);
  }

  @override
  Future<void> toggle(int id) async {
    if (_ids.contains(id)) {
      await unSave(id);
    } else {
      await save(id);
    }
    _controller.add(_ids);
  }

  @override
  Future<void> unSave(int id) async {
    _ids.remove(id);
    _controller.add(_ids);
  }

  @override
  Stream<Set<int>> bookmarkIdsStream() {
    return _controller.stream;
  }
}
