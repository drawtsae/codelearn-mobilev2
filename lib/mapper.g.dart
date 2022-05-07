// GENERATED CODE - DO NOT MODIFY BY HAND
// Generated and consumed by 'simple_json' 

import 'package:simple_json_mapper/simple_json_mapper.dart';
import 'package:boilerplate/models/course/course.dart';
import 'package:boilerplate/models/course/course_list.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/models/post/post_list.dart';
import 'package:boilerplate/models/identity/token.dart';
import 'package:boilerplate/models/training/training_list.dart';
import 'package:boilerplate/models/user/user_info.dart';
import 'package:boilerplate/models/common_model/additional_field.dart';
import 'package:boilerplate/models/common_model/author.dart';
import 'package:boilerplate/models/lesson/lesson.dart';
import 'package:boilerplate/models/common_model/comment.dart';
import 'package:boilerplate/models/common_model/category.dart';
import 'package:boilerplate/models/tag/tag.dart';
import 'package:boilerplate/models/training/training.dart';

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


final _postMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => Post(
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
    tags: (json['tags'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Tag>(item)!).toList(),
    rateScore: mapper.applyDynamicFromJsonConverter(json['rateScore']),
    rateCount: mapper.applyDynamicFromJsonConverter(json['rateCount']),
  ),
  (CustomJsonMapper mapper, Post instance) => <String, dynamic>{
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
    'tags': instance.tags?.map((item) => mapper.serializeToMap(item)).toList(),
    'rateScore': mapper.applyDynamicFromInstanceConverter(instance.rateScore),
    'rateCount': mapper.applyDynamicFromInstanceConverter(instance.rateCount),
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


final _categoryMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => Category(
    id: mapper.applyDynamicFromJsonConverter(json['id']),
    parentId: mapper.applyDynamicFromJsonConverter(json['parentId']),
    categoryLevel: mapper.applyDynamicFromJsonConverter(json['categoryLevel']),
    code: mapper.applyDynamicFromJsonConverter(json['code']),
    name: mapper.applyDynamicFromJsonConverter(json['name']),
    subCategories: (json['subCategories'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<Category>(item)!).toList(),
  ),
  (CustomJsonMapper mapper, Category instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'parentId': mapper.applyDynamicFromInstanceConverter(instance.parentId),
    'categoryLevel': mapper.applyDynamicFromInstanceConverter(instance.categoryLevel),
    'code': mapper.applyDynamicFromInstanceConverter(instance.code),
    'name': mapper.applyDynamicFromInstanceConverter(instance.name),
    'subCategories': instance.subCategories?.map((item) => mapper.serializeToMap(item)).toList(),
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
    title: mapper.applyDynamicFromJsonConverter(json['title']),
    slug: mapper.applyDynamicFromJsonConverter(json['slug']),
    sortPriority: mapper.applyDynamicFromJsonConverter(json['sortPriority']),
    level: mapper.applyDynamicFromJsonConverter(json['level']),
    summary: mapper.applyDynamicFromJsonConverter(json['summary']),
    isActive: mapper.applyDynamicFromJsonConverter(json['isActive']),
    content: mapper.applyDynamicFromJsonConverter(json['content']),
    videoUrl: mapper.applyDynamicFromJsonConverter(json['videoUrl']),
    additionalFields: (json['additionalFields'] as List?)?.cast<Map<String, dynamic>>().map((item) => mapper.deserialize<AdditionalField>(item)!).toList(),
    authorId: mapper.applyDynamicFromJsonConverter(json['authorId']),
    author: mapper.deserialize<Author>(json['author'] as Map<String, dynamic>?),
  ),
  (CustomJsonMapper mapper, Training instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'title': mapper.applyDynamicFromInstanceConverter(instance.title),
    'slug': mapper.applyDynamicFromInstanceConverter(instance.slug),
    'sortPriority': mapper.applyDynamicFromInstanceConverter(instance.sortPriority),
    'level': mapper.applyDynamicFromInstanceConverter(instance.level),
    'summary': mapper.applyDynamicFromInstanceConverter(instance.summary),
    'isActive': mapper.applyDynamicFromInstanceConverter(instance.isActive),
    'content': mapper.applyDynamicFromInstanceConverter(instance.content),
    'videoUrl': mapper.applyDynamicFromInstanceConverter(instance.videoUrl),
    'additionalFields': instance.additionalFields?.map((item) => mapper.serializeToMap(item)).toList(),
    'authorId': mapper.applyDynamicFromInstanceConverter(instance.authorId),
    'author': mapper.serializeToMap(instance.author),
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

void init() {
  JsonMapper.register(_courseMapper);
  JsonMapper.register(_courselistMapper);
  JsonMapper.register(_postMapper);
  JsonMapper.register(_postlistMapper);
  JsonMapper.register(_tokenMapper);
  JsonMapper.register(_traininglistMapper);
  JsonMapper.register(_userinfoMapper);
  JsonMapper.register(_additionalfieldMapper);
  JsonMapper.register(_authorMapper);
  JsonMapper.register(_lessonMapper);
  JsonMapper.register(_commentMapper);
  JsonMapper.register(_categoryMapper);
  JsonMapper.register(_tagMapper);
  JsonMapper.register(_trainingMapper);
  JsonMapper.register(_userlevelMapper); 

  

  JsonMapper.registerListCast((value) => value?.cast<Course>().toList());
  JsonMapper.registerListCast((value) => value?.cast<CourseList>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Post>().toList());
  JsonMapper.registerListCast((value) => value?.cast<PostList>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Token>().toList());
  JsonMapper.registerListCast((value) => value?.cast<TrainingList>().toList());
  JsonMapper.registerListCast((value) => value?.cast<UserInfo>().toList());
  JsonMapper.registerListCast((value) => value?.cast<AdditionalField>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Author>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Lesson>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Comment>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Category>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Tag>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Training>().toList());
  JsonMapper.registerListCast((value) => value?.cast<UserLevel>().toList());
}
    