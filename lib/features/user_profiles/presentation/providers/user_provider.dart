import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/user_remote_data_source.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/entities/user.dart';
import 'package:http/http.dart' as http;

final userRemoteDataSourceProvider = Provider((ref) => 
  UserRemoteDataSourceImpl(client: http.Client()));

final userRepositoryProvider = Provider((ref) => 
  UserRepositoryImpl(
    remoteDataSource: ref.watch(userRemoteDataSourceProvider)
  ));

final usersProvider = StateNotifierProvider<UserNotifier, AsyncValue<List<User>>>((ref) {
  return UserNotifier(ref.watch(userRepositoryProvider));
});

final likedUsersProvider = Provider<Set<String>>((ref) {
  final usersAsync = ref.watch(usersProvider);
  return usersAsync.when(
    data: (users) => users.where((user) => user.isLiked).map((user) => user.id).toSet(),
    loading: () => {},
    error: (_, __) => {},
  );
});

class UserNotifier extends StateNotifier<AsyncValue<List<User>>> {
  final UserRepositoryImpl repository;

  UserNotifier(this.repository) : super(const AsyncValue.loading()) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    state = const AsyncValue.loading();
    final result = await repository.getUsers();
    result.fold(
      (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
      (users) => state = AsyncValue.data(users),
    );
  }

  Future<void> toggleLike(String userId) async {
    state.whenData((users) {
      final updatedUsers = users.map((user) {
        if (user.id == userId) {
          return user.copyWith(isLiked: !user.isLiked);
        }
        return user;
      }).toList();
      state = AsyncValue.data(updatedUsers);
    });
  }

  Future<void> filterByCountry(String country) async {
    state = const AsyncValue.loading();
    final result = await repository.getUsersByCountry(country);
    result.fold(
      (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
      (users) => state = AsyncValue.data(users),
    );
  }
}