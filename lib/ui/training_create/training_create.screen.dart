import 'package:boilerplate/data/network/apis/training_api.dart';
import 'package:boilerplate/data/training_repository.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_summernote/flutter_summernote.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../constants/common.dart';
import '../../constants/short_validate.dart';
import '../../di/components/service_locator.dart';
import '../../widgets/empty_app_bar_widget.dart';
import '../../constants/style.dart';
import '../post_create/post_create.constants.dart';
import 'training_create.constants.dart';

class TrainingCreateScreen extends StatefulWidget {
  const TrainingCreateScreen({Key? key}) : super(key: key);

  @override
  State<TrainingCreateScreen> createState() => _TrainingCreateScreenState();
}

class _TrainingCreateScreenState extends State<TrainingCreateScreen> {
  late TrainingRepository _trainingRepository;
  final GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool _summerNoteContentIsNull = false;

  // handler
  void handleValidateSummerNote(content) {
    this.setState(() {
      _summerNoteContentIsNull = EMPTY_THINGS.contains(content);
    });
  }

  void onSubmitTraining() async {
    _formKey.currentState!.save();
    await _keyEditor.currentState?.getText();
    final content = await _keyEditor.currentState?.getText();
    final validateCondition =
        _formKey.currentState!.validate() && !_summerNoteContentIsNull;

    if (validateCondition) {
      final formValues = _formKey.currentState!.value;

      String title = formValues["title"];
      String slug = title;
      String summary = formValues["summary"];
      String level = formValues["level"];
      String videoUrl = formValues["videoUrl"];
      String tags = formValues["tags"];
      String in1 = formValues["in1"];
      String out1 = formValues["out1"];
      String in2 = formValues["in2"];
      String out2 = formValues["out2"];
      String in3 = formValues["in3"];
      String out3 = formValues["out3"];

      try {
        _trainingRepository.createTraining(title, slug, summary, level,
            content!, videoUrl, tags, in1, out1, in2, out2, in3, out3);
        Navigator.of(context).pop();
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Create training successfully!",
        );
      } catch (err) {}
    }
  }

  @override
  void initState() {
    super.initState();
    _trainingRepository = TrainingRepository(getIt<TrainingAPI>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EmptyAppBar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: PADDING_CONTENT_STYLES,
          child: Column(children: <Widget>[
            Text(
              'Create Training',
              style: TITLE_STYLES,
            ),
            FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'title',
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      validator: VALIDATE_REQUIRED,
                    ),
                    FormBuilderDropdown(
                      name: 'level',
                      decoration: InputDecoration(
                        labelText: 'Level',
                      ),
                      hint: Text('-- Click to select'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: "Please input this field")
                      ]),
                      items: LEVELS
                          .map((level) => DropdownMenuItem(
                                value: level,
                                child: Text('$level'),
                              ))
                          .toList(),
                    ),
                    FormBuilderTextField(
                      name: 'summary',
                      decoration: const InputDecoration(
                        labelText: 'Summary',
                      ),
                      validator: VALIDATE_REQUIRED,
                    ),
                    FormBuilderTextField(
                      name: 'videoUrl',
                      decoration: const InputDecoration(
                        labelText: 'Video URL',
                      ),
                      validator: VALIDATE_REQUIRED,
                    ),
                    FormBuilderTextField(
                      name: 'tags',
                      decoration: const InputDecoration(
                        labelText: 'Tags',
                      ),
                      validator: VALIDATE_REQUIRED,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Flexible(
                          child: FormBuilderTextField(
                            name: 'in1',
                            decoration: const InputDecoration(
                              labelText: 'Input TC1',
                            ),
                            validator: VALIDATE_REQUIRED,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        new Flexible(
                          child: FormBuilderTextField(
                            name: 'out1',
                            decoration: const InputDecoration(
                              labelText: 'Output TC1',
                            ),
                            validator: VALIDATE_REQUIRED,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Flexible(
                          child: FormBuilderTextField(
                            name: 'in2',
                            decoration: const InputDecoration(
                              labelText: 'Input TC2',
                            ),
                            validator: VALIDATE_REQUIRED,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        new Flexible(
                          child: FormBuilderTextField(
                            name: 'out2',
                            decoration: const InputDecoration(
                              labelText: 'Output TC2',
                            ),
                            validator: VALIDATE_REQUIRED,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Flexible(
                          child: FormBuilderTextField(
                            name: 'in3',
                            decoration: const InputDecoration(
                              labelText: 'Input TC3',
                            ),
                            validator: VALIDATE_REQUIRED,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        new Flexible(
                          child: FormBuilderTextField(
                            name: 'out3',
                            decoration: const InputDecoration(
                              labelText: 'Output TC3',
                            ),
                            validator: VALIDATE_REQUIRED,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: FlutterSummernote(
                  showBottomToolbar: false,
                  hint: "...Sharing content of this training",
                  key: _keyEditor,
                  height: 400,
                  customToolbar: SUMMER_NOTE_CONFIG,
                  returnContent: handleValidateSummerNote),
            ),
            Row(
              children: [
                Visibility(
                  child: Text(
                    "*This field is required",
                    style: TextStyle(color: Colors.red),
                  ),
                  visible: _summerNoteContentIsNull,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                        color: Theme.of(context).colorScheme.secondary,
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => onSubmitTraining()),
                  ),
                ],
              ),
            ),
          ]),
        )));
  }
}
