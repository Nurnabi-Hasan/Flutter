import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widget/center-circular_progress_indicatore.dart';
import 'package:task_manager/ui/widget/showscakmessage.dart';

import '../widget/task_card.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {

  List <TaskModel> _cancelledTaskList=[];
  bool _getCancelledTaskInprogress = false;

  @override
  void initState() {
        super.initState();
        getCanceledTask();
  }

  Widget build(BuildContext context) {
    return Visibility(
      visible: !_getCancelledTaskInprogress,
      replacement: CenteredCircularProgressIndicator(),
      child: RefreshIndicator(
        onRefresh: () async{
          getCanceledTask();
        },
        child: ListView.separated(
            itemCount: _cancelledTaskList.length,
                itemBuilder: (context, index) {
               return Task_Card(
                   taskModel: _cancelledTaskList[index],
               onRefreshList: getCanceledTask,
               );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
               ),
      ),
    );
  }

  Future <void> getCanceledTask() async {

    _getCancelledTaskInprogress= true;
    setState(() {});

    NetworkResponse response =await NetworkCaller.getProduct(url: Urls.getCancelledProduct);
    _getCancelledTaskInprogress = false;
    setState(() {});

    if(response.isSuccess){
      TaskListModel taskListModel = TaskListModel.fromJson(response.responseData);
      _cancelledTaskList = taskListModel.taskList ?? [];

    }else{
      showSnackMessage(context,response.errorMessage, true);
    }
  }

}
