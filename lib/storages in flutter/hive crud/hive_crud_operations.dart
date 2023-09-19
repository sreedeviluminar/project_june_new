import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('to_do Box');
  runApp(MaterialApp(
    home: Hive_crud(),
  ));
}

class Hive_crud extends StatefulWidget {
  @override
  State<Hive_crud> createState() => _Hive_crudState();
}

class _Hive_crudState extends State<Hive_crud> {
  List<Map<String, dynamic>> task = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
      ),
      body: task.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: task.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                    title: const Text(""),
                    subtitle: const Text(""),
                    trailing: Wrap(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showTask(context, null),
        label: const Text('Create Task'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void showTask(BuildContext context, int? itemkey) {
    // itemkey issimilar to id in sqflite
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Task Name"),
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Task Content"),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child:
                        Text(itemkey == null ? 'Create Task' : 'Update Task'))
              ],
            ),
          );
        });
  }
}
