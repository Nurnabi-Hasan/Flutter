import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/models/task_status_count_model.dart';
import 'package:task_manager/data/models/task_status_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/widget/center-circular_progress_indicatore.dart';
import 'package:task_manager/ui/widget/showscakmessage.dart';
import 'package:task_manager/ui/widget/task_summary_screen.dart';

import '../widget/task_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
List <TaskModel> _newtaskList = [];
List <TaskStatusModel> _taskStatusCountList = [];

  bool _getaskCountListInprogress = false;
  bool _getNewtaskInprogress = false;

  @override
  void initState() {
    super.initState();
    _getNewTask();
    _gettaskStatusCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:RefreshIndicator(
        onRefresh: ()async{
          _getNewTask();
          _gettaskStatusCount();
        },
        child: Column(
          children: [
            Visibility(
                visible: !_getaskCountListInprogress,
                replacement: CenteredCircularProgressIndicator(),
                child: _buildSummarySection()),
            Visibility(
              visible: !_getNewtaskInprogress,
              replacement: CenteredCircularProgressIndicator(),
              child: Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Task_Card(taskModel: _newtaskList[index],
                      onRefreshList: _getNewTask,);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },
                    itemCount: _newtaskList.length),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapFAB,
        child: const Icon(Icons.add),
      ),

    );
  }

  Future<void> _getNewTask()async{
    _getNewtaskInprogress = true;
    setState(() {});
    NetworkResponse response =await NetworkCaller.getProduct(url: Urls.getNewProduct);
    _getNewtaskInprogress = false;
    setState(() {});

    if(response.isSuccess){
      final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData);
      _newtaskList = taskListModel.taskList ?? [];

    }else{
      showSnackMessage(context, response.errorMessage, true);
    }

  }

Future<void> _gettaskStatusCount()async{
  _getaskCountListInprogress = true;
  setState(() {});
  NetworkResponse response =await NetworkCaller.getProduct(url: Urls.taskStatusCount);
  _getaskCountListInprogress = false;
  setState(() {});

  if(response.isSuccess){
    final TaskStatusCountModel taskStatusCountModel = TaskStatusCountModel.fromJson(response.responseData);
    _taskStatusCountList = taskStatusCountModel.taskStatusCountList ?? [];

  }else{
    showSnackMessage(context, response.errorMessage, true);
  }

}


  Widget _buildSummarySection() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _getTaskSummaryCard()
          ),
        )
      ],
    );
  }
  List<TaskSummaryCard> _getTaskSummaryCard(){
    List<TaskSummaryCard> taskSummaryCardList = [];
    for(TaskStatusModel t in _taskStatusCountList){
      taskSummaryCardList.add(TaskSummaryCard(title: t.sId! , count: t.sum ?? 0));
    }


    return taskSummaryCardList;
}

  Future <void> _onTapFAB()async {
    bool? shouldRefresh= await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddNewTaskScreen(),
        ));
   if(shouldRefresh == true) {
     _getNewTask();
   }
  }
}
