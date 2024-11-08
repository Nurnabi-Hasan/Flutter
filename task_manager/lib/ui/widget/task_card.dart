import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widget/showscakmessage.dart';

import '../utils/app_color.dart';

class Task_Card extends StatefulWidget {
  const Task_Card({
    super.key,
    required this.taskModel,
    required this.onRefreshList,
  });

  final TaskModel taskModel;
  final VoidCallback onRefreshList;
  @override
  State<Task_Card> createState() => _Task_CardState();
}

class _Task_CardState extends State<Task_Card> {

  bool _chageStatusInprogress = false;
  bool _deleteTaskInprogress = false;

  String _selectedStatus = '';

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.taskModel.status!;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.taskModel.title ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(widget.taskModel.description ?? ''),
            Text(widget.taskModel.createdDate ?? ''),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _taskStatusChip(),
                Wrap(
                  children: [
                    IconButton(
                        onPressed: _onTapEditButton,
                        icon: const Icon(Icons.edit_note)),
                    IconButton(
                        onPressed: _onTapDeleteButton,
                        icon: const Icon(Icons.delete_outline)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onTapEditButton() {
    showDialog(
        context: context,
        builder: (contex) {
          return AlertDialog(
            title: const Text('Edit Task Status'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: ['New', 'Completed', 'Canceled', 'Progress'].map((e) {
                return ListTile(
                  onTap: () {
                    _changeStatus(e);
                    Navigator.pop(context);
                  },
                  title: Text(e),
                  selected: _selectedStatus == e,
                  trailing: _selectedStatus == e ? Icon(Icons.check_box) : null,
                );
              }).toList(),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
            ],
          );
        });
  }

  Future<void> _onTapDeleteButton() async {
    _chageStatusInprogress = true;
    setState(() {});

    NetworkResponse response = await NetworkCaller.getProduct(
        url: Urls.deleteTask(widget.taskModel.sId!));

    if(response.isSuccess){
      widget.onRefreshList();
    }else{
      _chageStatusInprogress= false;
      setState(() {});

      showSnackMessage(context, response.errorMessage);
    }


  }

  Widget _taskStatusChip() {
    return Chip(
      label:  Text(
        widget.taskModel.status!,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: AppColors.themeColor,
          )),
    );
  }

  Future<void> _changeStatus(String newStatus) async {
    _chageStatusInprogress = true;
    setState(() {});

    NetworkResponse response = await NetworkCaller.getProduct(
        url: Urls.updateTaskStatus(widget.taskModel.sId!, newStatus));

    if(response.isSuccess){
    widget.onRefreshList();
    }else{
      _chageStatusInprogress= false;
      setState(() {});

      showSnackMessage(context, response.errorMessage);
    }

  }
}
