import 'package:flutter/material.dart';
import 'package:taskify/screens/task/widgets/add_task_sheet.dart';
import 'package:taskify/screens/task/widgets/task_filter_tabs.dart';
import 'package:taskify/screens/task/widgets/task_list_view.dart';
import 'package:taskify/screens/task/widgets/today_header.dart';

class TaskifyHomePage extends StatelessWidget {
  const TaskifyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FF),
      appBar: AppBar(
        title: const Text("Today's Tasks",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TodayHeader(),
          TaskFilterTabs(),
          SizedBox(height: 8),
          Expanded(child: TaskListView()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddTaskSheet(context),
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
