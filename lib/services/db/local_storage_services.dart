import 'package:hive_flutter/hive_flutter.dart';

import '../../model/db/local_storage_model.dart';

class DBServices {
  Box<LocalStore>? _dbBox;

  Future<void> openBox() async {
    _dbBox = await Hive.openBox<LocalStore>('weatherResult');
  }

  Future<void> closeBox() async {
    await _dbBox!.close();
  }


  Future<void> addResult(LocalStore results) async {
    if (_dbBox == null) {
      await openBox();
    }
    await _dbBox!.add(results);
  }

  Future<LocalStore> getResult() async {
    if (_dbBox == null) {
      await openBox();
    }

    return _dbBox!.values.first;
  }

  // Future<void> updateTodo(int index, LocalStore todo) async {
  //   if (_dbBox == null) {
  //     await openBox();
  //   }

  //   await _dbBox!.putAt(index, todo);
  //   print("updated");
  // }

  Future<void> deleteResult(int index) async {
    if (_dbBox == null) {
      await openBox();
    }

    await _dbBox!.deleteAt(index);
  }
}