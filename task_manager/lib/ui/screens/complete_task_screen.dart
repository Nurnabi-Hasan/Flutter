import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widget/center-circular_progress_indicatore.dart';
import 'package:task_manager/ui/widget/showscakmessage.dart';

import '../widget/task_card.dart';

class CompleteTaskScreen extends StatefulWidget {
  const CompleteTaskScreen({super.key});

  @override
  State<CompleteTaskScreen> createState() => _CompleteTaskScreenState();
}

class _CompleteTaskScreenState extends State<CompleteTaskScreen> {
  List<TaskModel> _completeTaskList =[];
  bool _getCompleteTaskInprogress = false;

  @override
  void initState() {
        super.initState();
        getCompleteTask();
  }


  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_getCompleteTaskInprogress,
      replacement: CenteredCircularProgressIndicator(),
      child: RefreshIndicator(
        onRefresh: () async{
      getCompleteTask();
      },
        child: ListView.separated(
          itemCount: _completeTaskList.length,
          itemBuilder: (context, index) {
          return  Task_Card(
              taskModel:_completeTaskList[index],
          onRefreshList: getCompleteTask,
          );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
        ),
      ),
    );
  }

  Future <void> getCompleteTask() async {

    _getCompleteTaskInprogress = true;
    setState(() {});

    NetworkResponse response = await NetworkCaller.getProduct(url:Urls.getCompleteProduct );
     _getCompleteTaskInprogress = false;
     setState(() {});

     if(response.isSuccess){
       final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData);
       _completeTaskList = taskListModel.taskList ?? [];
     }
     else{
       showSnackMessage(context, response.errorMessage, true);
     }

  }
}
