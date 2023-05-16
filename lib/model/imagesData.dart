class ImagesData {
  int id;
  String url;
  String title;
  String subtitle;
  String subtitle2;
  String img;
  String data;
  int queue;
  String status;
  double price;
  int counts;
  int? doctorId;
  bool brandOrService;
  bool rowresult;

  ImagesData({required this.id,
    required this.url,
    required this.title,
    required this.subtitle,
    required this.subtitle2,
    required this.img,
    required this.price,
    required this.data,
    required this.queue,
    required this.status,
    this.doctorId,
    required this.rowresult,
    required this.brandOrService,
    required this.counts});
}