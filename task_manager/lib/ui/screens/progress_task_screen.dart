import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widget/center-circular_progress_indicatore.dart';
import 'package:task_manager/ui/widget/showscakmessage.dart';

import '../widget/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {

  List <TaskModel> _progressTaskList=[];
  bool _getprogressTaskInprogress = false;

  @override
  void initState() {
    super.initState();
    getProgressTask();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_getprogressTaskInprogress,
      replacement: const CenteredCircularProgressIndicator(),
      child: RefreshIndicator(
        onRefresh: ()async{
      getProgressTask();
      },
        child: ListView.separated(
          itemCount: _progressTaskList.length,
          itemBuilder: (context, index) {
           return  Task_Card(taskModel: _progressTaskList[index],
           onRefreshList: getProgressTask,);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
        ),
      ),
    );
  }

  Future <void> getProgressTask()async{
    _getprogressTaskInprogress = true;
    setState(() {});

    NetworkResponse response =await NetworkCaller.getProduct(url: Urls.getProgressProduct);
    _getprogressTaskInprogress = false;
    setState(() {});

    if(response.isSuccess){
      final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData);
      _progressTaskList = taskListModel.taskList ?? [];

    }else{
      showSnackMessage(context, response.errorMessage, true);
    }
  }


}
