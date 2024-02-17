import 'package:ecommerceapp/core/resources/data_state.dart';
import 'package:ecommerceapp/domain/entities/user.dart';

abstract class UserRepository {
  Future<DataState<List<UserEntity>>> loginWithEmailandPassword();
}
