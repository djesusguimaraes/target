import 'package:mobx/mobx.dart';
import 'package:target/services/storage_keys.dart';
import 'package:target/services/storage_service.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final StorageService storageService;

  HomeStoreBase({required this.storageService});

  String? record = '';

  @observable
  ObservableFuture<String?> recordFuture = emptyRecord;

  @computed
  bool get hasRecord =>
      recordFuture != emptyRecord &&
      recordFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<String> emptyRecord = ObservableFuture.value('');

  @action
  Future<void> saveRecord(String value) async {
    recordFuture = ObservableFuture.value(value);
    await storageService.saveString(StorageKeys.record, value);
  }

  @action
  Future<void> loadRecord() async {
    record = '';
    final response = storageService.getString(StorageKeys.record);

    recordFuture = ObservableFuture(response);

    record = await response;
  }
}
