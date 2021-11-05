class Todo {
  String? title;
  bool isDone;

  Todo({this.title, this.isDone = false});

  factory Todo.fromJson(Map<String, dynamic> json) =>
      Todo(title: json['title'], isDone: json['isDone']);

  Map<String, dynamic> toJson() => {'title': title, 'isDone': isDone};
}