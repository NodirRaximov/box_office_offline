class ProfAccauntData {
  int id;
  String? url;
  String? name;
  String? surname;
  String? lastname;
  String? position;
  String? reception;
  bool selectProf=false;
  String? timeWork;
  int queue;

  ProfAccauntData(
      {required this.id,
        this.url,
        this.name,
        this.surname,
        this.lastname,
        this.position,
        this.reception,
        required this.selectProf,
        this.timeWork,
        required this.queue});
}