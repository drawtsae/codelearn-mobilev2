// GENERATED CODE - DO NOT MODIFY BY HAND
// Generated and consumed by 'simple_json' 

import 'package:simple_json_mapper/simple_json_mapper.dart';
import 'package:boilerplate/models/category/category.dart';
import 'package:boilerplate/models/category/category_list.dart';
import 'package:boilerplate/models/course/course.dart';
import 'package:boilerplate/models/course/course_list.dart';
import 'package:boilerplate/models/identity/token.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/models/post/post_list.dart';
import 'package:boilerplate/models/training/training_list.dart';
import 'package:boilerplate/models/user/user_info.dart';
import 'package:boilerplate/models/common_model/additional_field.dart';
import 'package:boilerplate/models/common_model/author.dart';
import 'package:boilerplate/models/lesson/lesson.dart';
import 'package:boilerplate/models/common_model/comment.dart';
import 'package:boilerplate/models/tag/tag.dart';
import 'package:boilerplate/models/training/training.dart';
import 'package:boilerplate/models/test_case/testcase.dart';

final _categoryMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => Category(
    id: mapper.applyDynamicFromJsonConverter(json['id']),
    parentId: mapper.applyDynamicFromJsonConverter(json['parentId']),
    categoryLevel: mapper.applyDynamicFromJsonConverter(json['categoryLevel']),
    code: mapper.applyDynamicFromJsonConverter(json['code']),
    name: mapper.applyDynamicFromJsonConverter(json['name']),
  ),
  (CustomJsonMapper mapper, Category instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'parentId': mapper.applyDynamicFromInstanceConverter(instance.parentId),
    'categoryLevel': mapper.applyDynamicFromInstanceConverter(instance.categoryLevel),
    'code': mapper.applyDynamicFromInstanceConverter(instance.code),
    'name': mapper.applyDynamicFromInstanceConverter(instance.name),
  },
);


final _categorylistMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => CategoryList(
    data: (json['data'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Category>(item)!).toList(),
  ),
  (CustomJsonMapper mapper, CategoryList instance) => <String, dynamic>{
    'data': instance.data?.map((item) => mapper.serializeToMap(item)).toList(),
  },
);


final _courseMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => Course(
    id: mapper.applyDynamicFromJsonConverter(json['id']),
    title: mapper.applyDynamicFromJsonConverter(json['title']),
    slug: mapper.applyDynamicFromJsonConverter(json['slug']),
    sortPriority: mapper.applyDynamicFromJsonConverter(json['sortPriority']),
    summary: mapper.applyDynamicFromJsonConverter(json['summary']),
    viewCount: mapper.applyDynamicFromJsonConverter(json['viewCount']),
    voteCount: mapper.applyDynamicFromJsonConverter(json['voteCount']),
    isActive: mapper.applyDynamicFromJsonConverter(json['isActive']),
    isComplete: mapper.applyDynamicFromJsonConverter(json['isComplete']),
    imageUrl: mapper.applyDynamicFromJsonConverter(json['imageUrl']),
    content: mapper.applyDynamicFromJsonConverter(json['content']),
    enrolled: mapper.applyDynamicFromJsonConverter(json['enrolled']),
    enrolledCount: mapper.applyDynamicFromJsonConverter(json['enrolledCount']),
    additionalFields: (json['additionalFields'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<AdditionalField>(item)!).toList(),
    createdBy: mapper.applyDynamicFromJsonConverter(json['createdBy']),
    createdAt: mapper.applyDynamicFromJsonConverter(json['createdAt']),
    lastModifiedBy: mapper.applyDynamicFromJsonConverter(json['lastModifiedBy']),
    lastModifiedAt: mapper.applyDynamicFromJsonConverter(json['lastModifiedAt']),
    author: mapper.deserialize<Author>(json['author'] as Map<String, dynamic>?),
    lessons: (json['lessons'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Lesson>(item)!).toList(),
    comments: (json['comments'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Comment>(item)!).toList(),
    categories: (json['categories'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Category>(item)!).toList(),
    rateScore: mapper.applyDynamicFromJsonConverter(json['rateScore']),
    rateCount: mapper.applyDynamicFromJsonConverter(json['rateCount']),
  ),
  (CustomJsonMapper mapper, Course instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'title': mapper.applyDynamicFromInstanceConverter(instance.title),
    'slug': mapper.applyDynamicFromInstanceConverter(instance.slug),
    'sortPriority': mapper.applyDynamicFromInstanceConverter(instance.sortPriority),
    'summary': mapper.applyDynamicFromInstanceConverter(instance.summary),
    'viewCount': mapper.applyDynamicFromInstanceConverter(instance.viewCount),
    'voteCount': mapper.applyDynamicFromInstanceConverter(instance.voteCount),
    'isActive': mapper.applyDynamicFromInstanceConverter(instance.isActive),
    'isComplete': mapper.applyDynamicFromInstanceConverter(instance.isComplete),
    'imageUrl': mapper.applyDynamicFromInstanceConverter(instance.imageUrl),
    'content': mapper.applyDynamicFromInstanceConverter(instance.content),
    'enrolled': mapper.applyDynamicFromInstanceConverter(instance.enrolled),
    'enrolledCount': mapper.applyDynamicFromInstanceConverter(instance.enrolledCount),
    'additionalFields': instance.additionalFields?.map((item) => mapper.serializeToMap(item)).toList(),
    'createdBy': mapper.applyDynamicFromInstanceConverter(instance.createdBy),
    'createdAt': mapper.applyDynamicFromInstanceConverter(instance.createdAt),
    'lastModifiedBy': mapper.applyDynamicFromInstanceConverter(instance.lastModifiedBy),
    'lastModifiedAt': mapper.applyDynamicFromInstanceConverter(instance.lastModifiedAt),
    'author': mapper.serializeToMap(instance.author),
    'lessons': instance.lessons?.map((item) => mapper.serializeToMap(item)).toList(),
    'comments': instance.comments?.map((item) => mapper.serializeToMap(item)).toList(),
    'categories': instance.categories?.map((item) => mapper.serializeToMap(item)).toList(),
    'rateScore': mapper.applyDynamicFromInstanceConverter(instance.rateScore),
    'rateCount': mapper.applyDynamicFromInstanceConverter(instance.rateCount),
  },
);


final _courselistMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => CourseList(
    data: (json['data'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Course>(item)!).toList(),
    page: mapper.applyDynamicFromJsonConverter(json['page']),
    totalCount: mapper.applyDynamicFromJsonConverter(json['totalCount']),
    hasPreviousPage: mapper.applyDynamicFromJsonConverter(json['hasPreviousPage']),
    hasNextPage: mapper.applyDynamicFromJsonConverter(json['hasNextPage']),
  ),
  (CustomJsonMapper mapper, CourseList instance) => <String, dynamic>{
    'data': instance.data?.map((item) => mapper.serializeToMap(item)).toList(),
    'page': mapper.applyDynamicFromInstanceConverter(instance.page),
    'totalCount': mapper.applyDynamicFromInstanceConverter(instance.totalCount),
    'hasPreviousPage': mapper.applyDynamicFromInstanceConverter(instance.hasPreviousPage),
    'hasNextPage': mapper.applyDynamicFromInstanceConverter(instance.hasNextPage),
  },
);


final _tokenMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => Token(
    id: mapper.applyDynamicFromJsonConverter(json['id']),
    userName: mapper.applyDynamicFromJsonConverter(json['userName']),
    email: mapper.applyDynamicFromJsonConverter(json['email']),
    jwToken: mapper.applyDynamicFromJsonConverter(json['jwToken']),
    roles: (json['roles'] as List?)?.cast<String>().map((item) => mapper.applyDynamicFromJsonConverter<String>(item)!).toList(),
  ),
  (CustomJsonMapper mapper, Token instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'userName': mapper.applyDynamicFromInstanceConverter(instance.userName),
    'email': mapper.applyDynamicFromInstanceConverter(instance.email),
    'jwToken': mapper.applyDynamicFromInstanceConverter(instance.jwToken),
    'roles': mapper.applyDynamicFromInstanceConverter(instance.roles),
  },
);


final _postMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => Post(
    id: mapper.applyDynamicFromJsonConverter(json['id']),
    createdBy: mapper.applyDynamicFromJsonConverter(json['createdBy']),
    createdAt: mapper.applyDynamicFromJsonConverter(json['createdAt']),
    lastModifiedBy: mapper.applyDynamicFromJsonConverter(json['lastModifiedBy']),
    lastModifiedAt: mapper.applyDynamicFromJsonConverter(json['lastModifiedAt']),
    title: mapper.applyDynamicFromJsonConverter(json['title']),
    slug: mapper.applyDynamicFromJsonConverter(json['slug']),
    summary: mapper.applyDynamicFromJsonConverter(json['summary']),
    viewCount: mapper.applyDynamicFromJsonConverter(json['viewCount']),
    sortPriority: mapper.applyDynamicFromJsonConverter(json['sortPriority']),
    content: mapper.applyDynamicFromJsonConverter(json['content']),
    authorId: mapper.applyDynamicFromJsonConverter(json['authorId']),
    isNews: mapper.applyDynamicFromJsonConverter(json['isNews']),
    isActive: mapper.applyDynamicFromJsonConverter(json['isActive']),
    imageUrl: mapper.applyDynamicFromJsonConverter(json['imageUrl']),
    additionalFields: (json['additionalFields'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<AdditionalField>(item)!).toList(),
    voteStatus: mapper.applyDynamicFromJsonConverter(json['voteStatus']),
    voteCount: mapper.applyDynamicFromJsonConverter(json['voteCount']),
    author: mapper.deserialize<Author>(json['author'] as Map<String, dynamic>?),
    categories: (json['categories'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Category>(item)!).toList(),
    tags: (json['tags'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Tag>(item)!).toList(),
    comments: (json['comments'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Comment>(item)!).toList(),
    commentCount: mapper.applyDynamicFromJsonConverter(json['commentCount']),
  ),
  (CustomJsonMapper mapper, Post instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'createdBy': mapper.applyDynamicFromInstanceConverter(instance.createdBy),
    'createdAt': mapper.applyDynamicFromInstanceConverter(instance.createdAt),
    'lastModifiedBy': mapper.applyDynamicFromInstanceConverter(instance.lastModifiedBy),
    'lastModifiedAt': mapper.applyDynamicFromInstanceConverter(instance.lastModifiedAt),
    'title': mapper.applyDynamicFromInstanceConverter(instance.title),
    'slug': mapper.applyDynamicFromInstanceConverter(instance.slug),
    'summary': mapper.applyDynamicFromInstanceConverter(instance.summary),
    'viewCount': mapper.applyDynamicFromInstanceConverter(instance.viewCount),
    'sortPriority': mapper.applyDynamicFromInstanceConverter(instance.sortPriority),
    'content': mapper.applyDynamicFromInstanceConverter(instance.content),
    'authorId': mapper.applyDynamicFromInstanceConverter(instance.authorId),
    'isNews': mapper.applyDynamicFromInstanceConverter(instance.isNews),
    'isActive': mapper.applyDynamicFromInstanceConverter(instance.isActive),
    'imageUrl': mapper.applyDynamicFromInstanceConverter(instance.imageUrl),
    'additionalFields': instance.additionalFields?.map((item) => mapper.serializeToMap(item)).toList(),
    'voteStatus': mapper.applyDynamicFromInstanceConverter(instance.voteStatus),
    'voteCount': mapper.applyDynamicFromInstanceConverter(instance.voteCount),
    'author': mapper.serializeToMap(instance.author),
    'categories': instance.categories?.map((item) => mapper.serializeToMap(item)).toList(),
    'tags': instance.tags?.map((item) => mapper.serializeToMap(item)).toList(),
    'comments': instance.comments?.map((item) => mapper.serializeToMap(item)).toList(),
    'commentCount': mapper.applyDynamicFromInstanceConverter(instance.commentCount),
  },
);


final _postlistMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => PostList(
    data: (json['data'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Post>(item)!).toList(),
    page: mapper.applyDynamicFromJsonConverter(json['page']),
    totalCount: mapper.applyDynamicFromJsonConverter(json['totalCount']),
    hasPreviousPage: mapper.applyDynamicFromJsonConverter(json['hasPreviousPage']),
    hasNextPage: mapper.applyDynamicFromJsonConverter(json['hasNextPage']),
  ),
  (CustomJsonMapper mapper, PostList instance) => <String, dynamic>{
    'data': instance.data?.map((item) => mapper.serializeToMap(item)).toList(),
    'page': mapper.applyDynamicFromInstanceConverter(instance.page),
    'totalCount': mapper.applyDynamicFromInstanceConverter(instance.totalCount),
    'hasPreviousPage': mapper.applyDynamicFromInstanceConverter(instance.hasPreviousPage),
    'hasNextPage': mapper.applyDynamicFromInstanceConverter(instance.hasNextPage),
  },
);


final _traininglistMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => TrainingList(
    data: (json['data'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Training>(item)!).toList(),
    page: mapper.applyDynamicFromJsonConverter(json['page']),
    totalCount: mapper.applyDynamicFromJsonConverter(json['totalCount']),
    hasPreviousPage: mapper.applyDynamicFromJsonConverter(json['hasPreviousPage']),
    hasNextPage: mapper.applyDynamicFromJsonConverter(json['hasNextPage']),
  ),
  (CustomJsonMapper mapper, TrainingList instance) => <String, dynamic>{
    'data': instance.data?.map((item) => mapper.serializeToMap(item)).toList(),
    'page': mapper.applyDynamicFromInstanceConverter(instance.page),
    'totalCount': mapper.applyDynamicFromInstanceConverter(instance.totalCount),
    'hasPreviousPage': mapper.applyDynamicFromInstanceConverter(instance.hasPreviousPage),
    'hasNextPage': mapper.applyDynamicFromInstanceConverter(instance.hasNextPage),
  },
);


final _userinfoMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => UserInfo(
    id: mapper.applyDynamicFromJsonConverter(json['id']),
    firstName: mapper.applyDynamicFromJsonConverter(json['firstName']),
    lastName: mapper.applyDynamicFromJsonConverter(json['lastName']),
    email: mapper.applyDynamicFromJsonConverter(json['email']),
    phoneNumber: mapper.applyDynamicFromJsonConverter(json['phoneNumber']),
    bio: mapper.applyDynamicFromJsonConverter(json['bio']),
    profilePicture: mapper.applyDynamicFromJsonConverter(json['profilePicture']),
    memberType: mapper.applyDynamicFromJsonConverter(json['memberType']),
    memberTier: mapper.applyDynamicFromJsonConverter(json['memberTier']),
    gender: mapper.applyDynamicFromJsonConverter(json['gender']),
    exp: mapper.applyDynamicFromJsonConverter(json['exp']),
    courseProcess: mapper.applyDynamicFromJsonConverter(json['courseProcess']),
    additionalFields: mapper.applyDynamicFromJsonConverter(json['additionalFields']),
    userLevel: mapper.deserialize<UserLevel>(json['userLevel'] as Map<String, dynamic>?),
    userTrainings: mapper.deserialize<UserTrainings>(json['userTrainings'] as Map<String, dynamic>?),
    userCourses: (json['userCourses'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Course>(item)!).toList(),
    certificates: (json['certificates'] as List?)?.cast<String>().map((item) => mapper.applyDynamicFromJsonConverter<String>(item)!).toList(),
    roles: (json['roles'] as List?)?.cast<String>().map((item) => mapper.applyDynamicFromJsonConverter<String>(item)!).toList(),
  ),
  (CustomJsonMapper mapper, UserInfo instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'firstName': mapper.applyDynamicFromInstanceConverter(instance.firstName),
    'lastName': mapper.applyDynamicFromInstanceConverter(instance.lastName),
    'email': mapper.applyDynamicFromInstanceConverter(instance.email),
    'phoneNumber': mapper.applyDynamicFromInstanceConverter(instance.phoneNumber),
    'bio': mapper.applyDynamicFromInstanceConverter(instance.bio),
    'profilePicture': mapper.applyDynamicFromInstanceConverter(instance.profilePicture),
    'memberType': mapper.applyDynamicFromInstanceConverter(instance.memberType),
    'memberTier': mapper.applyDynamicFromInstanceConverter(instance.memberTier),
    'gender': mapper.applyDynamicFromInstanceConverter(instance.gender),
    'exp': mapper.applyDynamicFromInstanceConverter(instance.exp),
    'courseProcess': mapper.applyDynamicFromInstanceConverter(instance.courseProcess),
    'additionalFields': mapper.applyDynamicFromInstanceConverter(instance.additionalFields),
    'userLevel': mapper.serializeToMap(instance.userLevel),
    'userTrainings': mapper.serializeToMap(instance.userTrainings),
    'userCourses': instance.userCourses?.map((item) => mapper.serializeToMap(item)).toList(),
    'certificates': mapper.applyDynamicFromInstanceConverter(instance.certificates),
    'roles': mapper.applyDynamicFromInstanceConverter(instance.roles),
  },
);


final _additionalfieldMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => AdditionalField(
    code: mapper.applyDynamicFromJsonConverter(json['code']),
    value: mapper.applyDynamicFromJsonConverter(json['value']),
  ),
  (CustomJsonMapper mapper, AdditionalField instance) => <String, dynamic>{
    'code': mapper.applyDynamicFromInstanceConverter(instance.code),
    'value': mapper.applyDynamicFromInstanceConverter(instance.value),
  },
);


final _authorMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => Author(
    id: mapper.applyDynamicFromJsonConverter(json['id']),
    firstName: mapper.applyDynamicFromJsonConverter(json['firstName']),
    lastName: mapper.applyDynamicFromJsonConverter(json['lastName']),
    profilePicture: mapper.applyDynamicFromJsonConverter(json['profilePicture']),
    memberType: mapper.applyDynamicFromJsonConverter(json['memberType']),
    memberTier: mapper.applyDynamicFromJsonConverter(json['memberTier']),
    gender: mapper.applyDynamicFromJsonConverter(json['gender']),
    additionalFields: mapper.applyDynamicFromJsonConverter(json['additionalFields']),
    exp: mapper.applyDynamicFromJsonConverter(json['exp']),
  ),
  (CustomJsonMapper mapper, Author instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'firstName': mapper.applyDynamicFromInstanceConverter(instance.firstName),
    'lastName': mapper.applyDynamicFromInstanceConverter(instance.lastName),
    'profilePicture': mapper.applyDynamicFromInstanceConverter(instance.profilePicture),
    'memberType': mapper.applyDynamicFromInstanceConverter(instance.memberType),
    'memberTier': mapper.applyDynamicFromInstanceConverter(instance.memberTier),
    'gender': mapper.applyDynamicFromInstanceConverter(instance.gender),
    'additionalFields': mapper.applyDynamicFromInstanceConverter(instance.additionalFields),
    'exp': mapper.applyDynamicFromInstanceConverter(instance.exp),
  },
);


final _lessonMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => Lesson(
    id: mapper.applyDynamicFromJsonConverter(json['id']),
    title: mapper.applyDynamicFromJsonConverter(json['title']),
    slug: mapper.applyDynamicFromJsonConverter(json['slug']),
    summary: mapper.applyDynamicFromJsonConverter(json['summary']),
    sortPriority: mapper.applyDynamicFromJsonConverter(json['sortPriority']),
    lessonLevel: mapper.applyDynamicFromJsonConverter(json['lessonLevel']),
    isComplete: mapper.applyDynamicFromJsonConverter(json['isComplete']),
    isActive: mapper.applyDynamicFromJsonConverter(json['isActive']),
    level: mapper.applyDynamicFromJsonConverter(json['level']),
  ),
  (CustomJsonMapper mapper, Lesson instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'title': mapper.applyDynamicFromInstanceConverter(instance.title),
    'slug': mapper.applyDynamicFromInstanceConverter(instance.slug),
    'summary': mapper.applyDynamicFromInstanceConverter(instance.summary),
    'sortPriority': mapper.applyDynamicFromInstanceConverter(instance.sortPriority),
    'lessonLevel': mapper.applyDynamicFromInstanceConverter(instance.lessonLevel),
    'isComplete': mapper.applyDynamicFromInstanceConverter(instance.isComplete),
    'isActive': mapper.applyDynamicFromInstanceConverter(instance.isActive),
    'level': mapper.applyDynamicFromInstanceConverter(instance.level),
  },
);


final _commentMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => Comment(
    id: mapper.applyDynamicFromJsonConverter(json['id']),
    parentId: mapper.applyDynamicFromJsonConverter(json['parentId']),
    commentLevel: mapper.applyDynamicFromJsonConverter(json['commentLevel']),
    isActive: mapper.applyDynamicFromJsonConverter(json['isActive']),
    content: mapper.applyDynamicFromJsonConverter(json['content']),
    authorId: mapper.applyDynamicFromJsonConverter(json['authorId']),
    author: mapper.deserialize<Author>(json['author'] as Map<String, dynamic>?),
    createdAt: mapper.applyDynamicFromJsonConverter(json['createdAt']),
    comments: (json['comments'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Comment>(item)!).toList(),
  ),
  (CustomJsonMapper mapper, Comment instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'parentId': mapper.applyDynamicFromInstanceConverter(instance.parentId),
    'commentLevel': mapper.applyDynamicFromInstanceConverter(instance.commentLevel),
    'isActive': mapper.applyDynamicFromInstanceConverter(instance.isActive),
    'content': mapper.applyDynamicFromInstanceConverter(instance.content),
    'authorId': mapper.applyDynamicFromInstanceConverter(instance.authorId),
    'author': mapper.serializeToMap(instance.author),
    'createdAt': mapper.applyDynamicFromInstanceConverter(instance.createdAt),
    'comments': instance.comments?.map((item) => mapper.serializeToMap(item)).toList(),
  },
);


final _tagMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => Tag(
    id: mapper.applyDynamicFromJsonConverter(json['id']),
    code: mapper.applyDynamicFromJsonConverter(json['code']),
    name: mapper.applyDynamicFromJsonConverter(json['name']),
    color: mapper.applyDynamicFromJsonConverter(json['color']),
  ),
  (CustomJsonMapper mapper, Tag instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'code': mapper.applyDynamicFromInstanceConverter(instance.code),
    'name': mapper.applyDynamicFromInstanceConverter(instance.name),
    'color': mapper.applyDynamicFromInstanceConverter(instance.color),
  },
);


final _trainingMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => Training(
    id: mapper.applyDynamicFromJsonConverter(json['id']),
    createdBy: mapper.applyDynamicFromJsonConverter(json['createdBy']),
    createdAt: mapper.applyDynamicFromJsonConverter(json['createdAt']),
    lastModifiedBy: mapper.applyDynamicFromJsonConverter(json['lastModifiedBy']),
    lastModifiedAt: mapper.applyDynamicFromJsonConverter(json['lastModifiedAt']),
    title: mapper.applyDynamicFromJsonConverter(json['title']),
    slug: mapper.applyDynamicFromJsonConverter(json['slug']),
    sortPriority: mapper.applyDynamicFromJsonConverter(json['sortPriority']),
    level: mapper.applyDynamicFromJsonConverter(json['level']),
    summary: mapper.applyDynamicFromJsonConverter(json['summary']),
    isActive: mapper.applyDynamicFromJsonConverter(json['isActive']),
    content: mapper.applyDynamicFromJsonConverter(json['content']),
    videoUrl: mapper.applyDynamicFromJsonConverter(json['videoUrl']),
    tags: (json['tags'] as List?)?.cast<String>().map((item) => mapper.applyDynamicFromJsonConverter<String>(item)!).toList(),
    author: mapper.deserialize<Author>(json['author'] as Map<String, dynamic>?),
    testCases: (json['testCases'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<TestCase>(item)!).toList(),
    comments: (json['comments'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Comment>(item)!).toList(),
    isCompleted: mapper.applyDynamicFromJsonConverter(json['isCompleted']),
    userJoinCount: mapper.applyDynamicFromJsonConverter(json['userJoinCount']),
    userCompletedCount: mapper.applyDynamicFromJsonConverter(json['userCompletedCount']),
  ),
  (CustomJsonMapper mapper, Training instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'createdBy': mapper.applyDynamicFromInstanceConverter(instance.createdBy),
    'createdAt': mapper.applyDynamicFromInstanceConverter(instance.createdAt),
    'lastModifiedBy': mapper.applyDynamicFromInstanceConverter(instance.lastModifiedBy),
    'lastModifiedAt': mapper.applyDynamicFromInstanceConverter(instance.lastModifiedAt),
    'title': mapper.applyDynamicFromInstanceConverter(instance.title),
    'slug': mapper.applyDynamicFromInstanceConverter(instance.slug),
    'sortPriority': mapper.applyDynamicFromInstanceConverter(instance.sortPriority),
    'level': mapper.applyDynamicFromInstanceConverter(instance.level),
    'summary': mapper.applyDynamicFromInstanceConverter(instance.summary),
    'isActive': mapper.applyDynamicFromInstanceConverter(instance.isActive),
    'content': mapper.applyDynamicFromInstanceConverter(instance.content),
    'videoUrl': mapper.applyDynamicFromInstanceConverter(instance.videoUrl),
    'tags': mapper.applyDynamicFromInstanceConverter(instance.tags),
    'author': mapper.serializeToMap(instance.author),
    'testCases': instance.testCases?.map((item) => mapper.serializeToMap(item)).toList(),
    'comments': instance.comments?.map((item) => mapper.serializeToMap(item)).toList(),
    'isCompleted': mapper.applyDynamicFromInstanceConverter(instance.isCompleted),
    'userJoinCount': mapper.applyDynamicFromInstanceConverter(instance.userJoinCount),
    'userCompletedCount': mapper.applyDynamicFromInstanceConverter(instance.userCompletedCount),
  },
);


final _userlevelMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => UserLevel(
    current: mapper.applyDynamicFromJsonConverter(json['current']),
    next: mapper.applyDynamicFromJsonConverter(json['next']),
    percent: mapper.applyDynamicFromJsonConverter(json['percent']),
    rank: mapper.applyDynamicFromJsonConverter(json['rank']),
  ),
  (CustomJsonMapper mapper, UserLevel instance) => <String, dynamic>{
    'current': mapper.applyDynamicFromInstanceConverter(instance.current),
    'next': mapper.applyDynamicFromInstanceConverter(instance.next),
    'percent': mapper.applyDynamicFromInstanceConverter(instance.percent),
    'rank': mapper.applyDynamicFromInstanceConverter(instance.rank),
  },
);


final _usertrainingsMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => UserTrainings(
    contributes: mapper.applyDynamicFromJsonConverter(json['contributes']),
    completedEasy: mapper.applyDynamicFromJsonConverter(json['completedEasy']),
    completedMedium: mapper.applyDynamicFromJsonConverter(json['completedMedium']),
    completedDifficult: mapper.applyDynamicFromJsonConverter(json['completedDifficult']),
  ),
  (CustomJsonMapper mapper, UserTrainings instance) => <String, dynamic>{
    'contributes': mapper.applyDynamicFromInstanceConverter(instance.contributes),
    'completedEasy': mapper.applyDynamicFromInstanceConverter(instance.completedEasy),
    'completedMedium': mapper.applyDynamicFromInstanceConverter(instance.completedMedium),
    'completedDifficult': mapper.applyDynamicFromInstanceConverter(instance.completedDifficult),
  },
);


final _testcaseMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => TestCase(
    id: mapper.applyDynamicFromJsonConverter(json['id']),
    lessonId: mapper.applyDynamicFromJsonConverter(json['lessonId']),
    sortPriority: mapper.applyDynamicFromJsonConverter(json['sortPriority']),
    inputData: mapper.applyDynamicFromJsonConverter(json['inputData']),
    expectedOutput: mapper.applyDynamicFromJsonConverter(json['expectedOutput']),
    timeLimit: mapper.applyDynamicFromJsonConverter(json['timeLimit']),
    isActive: mapper.applyDynamicFromJsonConverter(json['isActive']),
  ),
  (CustomJsonMapper mapper, TestCase instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'lessonId': mapper.applyDynamicFromInstanceConverter(instance.lessonId),
    'sortPriority': mapper.applyDynamicFromInstanceConverter(instance.sortPriority),
    'inputData': mapper.applyDynamicFromInstanceConverter(instance.inputData),
    'expectedOutput': mapper.applyDynamicFromInstanceConverter(instance.expectedOutput),
    'timeLimit': mapper.applyDynamicFromInstanceConverter(instance.timeLimit),
    'isActive': mapper.applyDynamicFromInstanceConverter(instance.isActive),
  },
);

void init() {
  JsonMapper.register(_categoryMapper);
  JsonMapper.register(_categorylistMapper);
  JsonMapper.register(_courseMapper);
  JsonMapper.register(_courselistMapper);
  JsonMapper.register(_tokenMapper);
  JsonMapper.register(_postMapper);
  JsonMapper.register(_postlistMapper);
  JsonMapper.register(_traininglistMapper);
  JsonMapper.register(_userinfoMapper);
  JsonMapper.register(_additionalfieldMapper);
  JsonMapper.register(_authorMapper);
  JsonMapper.register(_lessonMapper);
  JsonMapper.register(_commentMapper);
  JsonMapper.register(_tagMapper);
  JsonMapper.register(_trainingMapper);
  JsonMapper.register(_userlevelMapper);
  JsonMapper.register(_usertrainingsMapper);
  JsonMapper.register(_testcaseMapper); 

  

  JsonMapper.registerListCast((value) => value?.cast<Category>().toList());
  JsonMapper.registerListCast((value) => value?.cast<CategoryList>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Course>().toList());
  JsonMapper.registerListCast((value) => value?.cast<CourseList>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Token>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Post>().toList());
  JsonMapper.registerListCast((value) => value?.cast<PostList>().toList());
  JsonMapper.registerListCast((value) => value?.cast<TrainingList>().toList());
  JsonMapper.registerListCast((value) => value?.cast<UserInfo>().toList());
  JsonMapper.registerListCast((value) => value?.cast<AdditionalField>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Author>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Lesson>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Comment>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Tag>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Training>().toList());
  JsonMapper.registerListCast((value) => value?.cast<UserLevel>().toList());
  JsonMapper.registerListCast((value) => value?.cast<UserTrainings>().toList());
  JsonMapper.registerListCast((value) => value?.cast<TestCase>().toList());
}
    