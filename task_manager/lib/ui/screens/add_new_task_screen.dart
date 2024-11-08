import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widget/center-circular_progress_indicatore.dart';
import 'package:task_manager/ui/widget/showscakmessage.dart';
import 'package:task_manager/ui/widget/tm_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {

  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _addNewTaskInprogress = false;
  bool _shouldRefreshPreviousPage = false;
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,onPopInvoked: (didpop){
        if(didpop){
          return;
        }
        Navigator.pop(context,_shouldRefreshPreviousPage);
    },

      child: Scaffold(
        appBar: const TM_App_Bar(),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50,),

                Text('Add New Task', style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),),

                const SizedBox(height: 24),

                Form(
                  key: _formKey,

                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _titleTEController,
                        decoration: const InputDecoration(
                            hintText: 'Title'
                        ),
                        validator: (String? value){
                          if(value?.isEmpty ?? true){
                            return 'Enter Title..!';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16,),

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _descriptionTEController,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Description',
                        ),
                        validator: (String? value){
                          if(value?.isEmpty ?? true){
                            return 'Enter Description..!';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                Visibility(
                  visible: !_addNewTaskInprogress,
                  replacement: const CenteredCircularProgressIndicator(),
                  child: ElevatedButton(
                    onPressed: _onTapAddButton,
                    child: const Text('Add'),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapAddButton(){
    if(_formKey.currentState!.validate()){
      addNewTask();
    }
  }

  Future <void> addNewTask() async{
    _addNewTaskInprogress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "title":_titleTEController.text,
      "description": _descriptionTEController.text,
      "status":"New"
    };

    NetworkResponse response = await NetworkCaller.postProduct(url:Urls.addNewProduct,body:requestBody);

    _addNewTaskInprogress = false;
    setState(() {});

    if(response.isSuccess){
      _shouldRefreshPreviousPage = true;
      clearTextFields();
      showSnackMessage(context, 'Task Added Successfully');
    }else {
      showSnackMessage(context, response.errorMessage, true);
    }
    
    
  }

  void clearTextFields(){
    _titleTEController.clear();
    _descriptionTEController.clear();
  }
  
}
