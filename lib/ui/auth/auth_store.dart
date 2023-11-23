import 'package:mobx/mobx.dart';
import 'package:target/models/auth_data_model.dart';
import 'package:target/models/user_model.dart';
import 'package:target/repositories/auth_repository.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final AuthRepository repository;

  AuthStoreBase({required this.repository});

  @observable
  User? user;

  @observable
  bool loading = false;

  @observable
  String? errorMessage;

  @computed
  bool get isLogged => user != null;

  @action
  Future<void> login(AuthParams data) async {
    loading = true;
    final response = await repository.login(data);

    loading = false;
    response.fold(
      (error) => errorMessage = error,
      (user) => this.user = user,
    );
  }
}
