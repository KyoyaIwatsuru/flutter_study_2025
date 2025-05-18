import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study_2025/todos/app/todo_manager.dart';
import 'package:flutter_study_2025/todos/app/todos_state.dart';
import 'package:flutter_study_2025/todos/model/entities/todo.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile({
    required this.todo,
    super.key,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        final newTodo = todo.copyWith(isDone: !todo.isDone);
        ref.read(todoManagerProvider).update(newTodo);
        ref.invalidate(todosStateProvider);
      },
      leading: CircleAvatar(
        radius: 4,
        backgroundColor: todo.category.color,
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text('${todo.date} ${todo.time}'),
      trailing: Checkbox(
        value: todo.isDone,
        onChanged: (value) {},
      ),
    );
  }
}
