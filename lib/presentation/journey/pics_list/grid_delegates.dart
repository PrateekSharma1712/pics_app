import 'package:flutter/material.dart';

const gridColumnsInPortrait = 2;
const gridColumnsInLandscape = 4;

const portraitGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: gridColumnsInPortrait,
  childAspectRatio: 1,
  crossAxisSpacing: 8,
  mainAxisSpacing: 8,
);
