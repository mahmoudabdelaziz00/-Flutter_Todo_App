class NoteModel {
  final String title;
  final String subTitle;
  final String date;
  final bool isDone;
  final String id;

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    this.isDone = false,
    this.id = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subTitle': subTitle,
      'date': date,
      'isDone': isDone,
    };
  }

  factory NoteModel.fromDocument(String id, Map<String, dynamic> data) {
    return NoteModel(
      id: id,
      title: data['title'] ?? '',
      subTitle: data['subTitle'] ?? '',
      date: data['date'] ?? '',
      isDone: data['isDone'] ?? false,
    );
  }
}
