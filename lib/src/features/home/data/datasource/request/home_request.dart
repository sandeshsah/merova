class HomeRequest {
  final String userId;

  HomeRequest({required this.userId});

  Map<String, dynamic> toJson() => {
    'user_id': userId,
  };
}
