class JobModel {
  final String id;
  final String status; // "available", "inprogress", "done", "called"
  final String shopName;
  final String jobId;
  final DateTime date;
  final String imageUrl;

  JobModel({
    required this.id,
    required this.status,
    required this.shopName,
    required this.jobId,
    required this.date,
    required this.imageUrl,
  });
}
