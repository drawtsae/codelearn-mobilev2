import 'package:flutter/material.dart';

import '../../models/lesson/lesson.dart';

class Levels {
  static const EASY = "easy";
  static const MEDIUM = "medium";
  static const HARD = "hard";
}

const Map<String, Color> LevelColors = const {
  Levels.EASY: Colors.green,
  Levels.MEDIUM: Colors.blue,
  Levels.HARD: Colors.deepOrange
};

const Map<String, LinearGradient> GradientLevels = const {
  Levels.EASY: LinearGradient(
    colors: [
      Colors.greenAccent,
      Colors.green,
    ],
  ),
  Levels.MEDIUM: LinearGradient(
    colors: [
      Colors.blueAccent,
      Colors.blue,
    ],
  ),
  Levels.HARD: LinearGradient(
    colors: [
      Colors.deepOrangeAccent,
      Colors.deepOrange,
    ],
  )
};

const Map<String, Icon> IconLevels = const {
  Levels.EASY: Icon(
    Icons.audiotrack_rounded,
    color: Colors.green,
    size: 30.0,
  ),
  Levels.MEDIUM: Icon(
    Icons.category_rounded,
    color: Colors.blue,
    size: 30.0,
  ),
  Levels.HARD: Icon(
    Icons.whatshot_rounded,
    color: Colors.deepOrange,
    size: 30.0,
  ),
};

final List<Lesson> trainingBaseData = [
  new Lesson(
      id: "this-is-id",
      title: "Training 1",
      slug: "training-1",
      summary: "This is a summary from training",
      level: "hard"),
  new Lesson(
      id: "this-is-id",
      title: "Training 2",
      slug: "training-2",
      summary: "This is a summary from training",
      level: "medium"),
  new Lesson(
      id: "this-is-id",
      title: "Training 3",
      slug: "training-3",
      summary: "This is a summary from training",
      level: "easy"),
  new Lesson(
      id: "this-is-id",
      title: "Training 3",
      slug: "training-3",
      summary: "This is a summary from training",
      level: "easy"),
  new Lesson(
      id: "this-is-id",
      title: "Training 3",
      slug: "training-3",
      summary: "This is a summary from training",
      level: "easy"),
  new Lesson(
      id: "this-is-id",
      title: "Training 3",
      slug: "training-3",
      summary: "This is a summary from training",
      level: "easy"),
  new Lesson(
      id: "this-is-id",
      title: "Training 3",
      slug: "training-3",
      summary: "This is a summary from training",
      level: "easy"),
];
