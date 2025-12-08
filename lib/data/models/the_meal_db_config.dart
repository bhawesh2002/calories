class TheMealDbConfig {
  final bool enableCache;
  final Duration? refreshDuration;
  final bool forceRefreshOnEveryRequest;
  final int cacheSizeInMb;

  static const defaultRefreshDuration = Duration(hours: 24);

  int get cacheSizeInBytes => cacheSizeInMb * 1024 * 1024;

  const TheMealDbConfig({
    this.enableCache = true,
    this.refreshDuration = defaultRefreshDuration,
    this.forceRefreshOnEveryRequest = false,
    this.cacheSizeInMb = 10,
  });

  TheMealDbConfig copyWith({
    bool? enableCache,
    Duration? refreshDuration,
    bool? forceRefreshOnEveryRequest,
    int? cacheSizeInMb,
  }) {
    return TheMealDbConfig(
      enableCache: enableCache ?? this.enableCache,
      refreshDuration: refreshDuration ?? this.refreshDuration,
      forceRefreshOnEveryRequest:
          forceRefreshOnEveryRequest ?? this.forceRefreshOnEveryRequest,
      cacheSizeInMb: cacheSizeInMb ?? this.cacheSizeInMb,
    );
  }

  @override
  bool operator ==(covariant TheMealDbConfig other) {
    if (identical(this, other)) return true;

    return other.enableCache == enableCache &&
        other.refreshDuration == refreshDuration &&
        other.forceRefreshOnEveryRequest == forceRefreshOnEveryRequest &&
        other.cacheSizeInMb == cacheSizeInMb;
  }

  @override
  int get hashCode {
    return enableCache.hashCode ^
        refreshDuration.hashCode ^
        forceRefreshOnEveryRequest.hashCode ^
        cacheSizeInMb.hashCode;
  }

  @override
  String toString() {
    return 'TheMealDbConfig(enableCache: $enableCache, refreshDuration: $refreshDuration, forceRefreshOnEveryRequest: $forceRefreshOnEveryRequest, cacheSizeInMb: $cacheSizeInMb)';
  }
}
