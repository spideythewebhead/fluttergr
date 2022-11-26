class RepoResult<T> {
  const RepoResult._();

  const factory RepoResult.data({
    required T data,
  }) = _RepoResultData<T>;

  const factory RepoResult.error({
    Object? error,
    StackTrace? stackTrace,
  }) = _RepoResultError<T>;
}
