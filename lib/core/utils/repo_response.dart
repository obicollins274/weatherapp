import 'package:equatable/equatable.dart';

import 'api.dart';

class RepoResp<T> {
  final bool success;
  final T? serializer;
  final APIException? error;

  RepoResp({required this.success, this.serializer, this.error});
  @override
  String toString() {
    return {
      "success": success.toString(),
      "serializer": serializer.toString(),
      "error": error?.toString(),
    }.toString();
  }
}

class SubmissionError extends Equatable {
  final String? error;

  const SubmissionError([this.error]);

  @override
  List<Object?> get props => [error];
}
