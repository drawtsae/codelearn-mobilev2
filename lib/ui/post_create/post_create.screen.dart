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
import '../../widgets/empty_app_bar_widget.dart';
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
  Future<void> onSubmitPost() async {
    _formKey.currentState!.save();
    await _keyEditor.currentState?.getText();
    final content = await _keyEditor.currentState?.getText();

    if (_formKey.currentState!.validate() && !_contentIsNull) {
      final formValues = _formKey.currentState!.value;

      String categoryId = formValues["category"];
      String title = formValues["title"];
      String slug = title;
      String summary = content!;

      try {
        await _postRepository
            .createPost(title, slug, summary, content, [categoryId]);
        Navigator.of(context).pop();
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Your transaction was successful!",
        );
      } catch (err) {}
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
        appBar: EmptyAppBar(),
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
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => onSubmitPost(),
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
