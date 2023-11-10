class WidgetNode {
  final String type;
  final List<WidgetNode> children;
  final String hint;
  final String id;

  WidgetNode({
    required this.type,
    this.children = const [],
    this.hint = '',
    this.id = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      "type": type,
      "children": children.map((child) => child.toJson()).toList(),
      "hint": hint,
      "id": id,
    };
    return json;
  }
}