import 'package:boilerplate/models/category/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_summernote/flutter_summernote.dart';
import 'package:cool_alert/cool_alert.dart';

import '../../data/category_repository.dart';
import '../../data/network/apis/category_api.dart';
import '../../data/network/apis/post_api.dart';
import '../../data/post_repository.dart';
import '../../di/components/service_locator.dart';
import '../../models/category/category_list.dart';
import 'post_create.constants.dart';

class PostCreateScreen extends StatefulWidget {
  const PostCreateScreen({Key? key}) : super(key: key);

  @override
  State<PostCreateScreen> createState() => _PostCreateScreenState();
}

class _PostCreateScreenState extends State<PostCreateScreen> {
  late CategoryRepository _categoryRepository;
  late PostRepository _postRepository;

  // Defines state
  List<Category> _categories = EMPTY_CATEGORY_LIST;
  var genderOptions = ["Option 1", "Option 2", "Option 3"];
  bool _contentIsNull = false;
  GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
  final _formKey = GlobalKey<FormBuilderState>();

  void handleValidateSummerNote(content) {
    this.setState(() {
      _contentIsNull = ["", null, false, 0].contains(content);
    });
  }

  // Actions
  Future<void> getCategories() async {
    CategoryList? res = await _categoryRepository.getCategories();
    setState(() {
      _categories = res!.data!;
    });
  }

  // Actions
  Future<void> createPost(
      {String? title, String? content, String? categoryId}) async {
    final summary = content;
    bool res = await _postRepository
        .createPost(title!, title, summary!, content!, [categoryId!]);
    if (res) {
      Navigator.of(context).pop();
      CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: "Your transaction was successful!",
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _categoryRepository = CategoryRepository(getIt<CategoryAPI>());
    _postRepository = PostRepository(getIt<PostApi>());
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: <Widget>[
              Text("Create post"),
              FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'title',
                      decoration: const InputDecoration(
                        labelText: 'Post title',
                      ),
                      onChanged: null,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: "Please input your title"),
                      ]),
                    ),
                    FormBuilderDropdown(
                      name: 'category',
                      decoration: const InputDecoration(
                        labelText: 'Category',
                      ),
                      // initialValue: 'Male',
                      allowClear: true,
                      hint: const Text('-- Select category'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: "Please choose category")
                      ]),
                      items: _categories
                          .map((category) => DropdownMenuItem(
                                value: category.id,
                                child: Text(category.name.toString()),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: FlutterSummernote(
                    showBottomToolbar: false,
                    hint: "...Sharing your post",
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
                    visible: _contentIsNull,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        color: Theme.of(context).colorScheme.secondary,
                        child: const Text(
                          "Reset",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _formKey.currentState!.reset();
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: MaterialButton(
                        color: Theme.of(context).colorScheme.secondary,
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          _formKey.currentState!.save();
                          await _keyEditor.currentState?.getText();
                          final content =
                              await _keyEditor.currentState?.getText();
                          if (_formKey.currentState!.validate() &&
                              !_contentIsNull) {
                            //Submit here
                            String categoryId =
                                _formKey.currentState!.value["category"];
                            String title =
                                _formKey.currentState!.value["title"];
                            final test = _formKey.currentState!.value["title"];
                            await createPost(
                                title: title,
                                content: content,
                                categoryId: categoryId);
                            print(_formKey.currentState!.value["title"]);
                            print(content);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
