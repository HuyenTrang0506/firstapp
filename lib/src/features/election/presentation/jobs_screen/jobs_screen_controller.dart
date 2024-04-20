import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voting_app/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:voting_app/src/features/election/data/jobs_repository.dart';
import 'package:voting_app/src/features/election/domain/job.dart';

part 'jobs_screen_controller.g.dart';

@riverpod
class JobsScreenController extends _$JobsScreenController {
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<void> deleteJob(Job job) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    if (currentUser == null) {
      throw AssertionError('User can\'t be null');
    }
    final repository = ref.read(jobsRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => repository.deleteJob(uid: currentUser.uid, jobId: job.id));
  }
}
