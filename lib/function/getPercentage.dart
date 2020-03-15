import 'package:flutter/material.dart';

double getPercentSize(double per, bool isHight, BuildContext context) {
  double ret;
  if (isHight == true) {
    ret = ((per * MediaQuery.of(context).size.height) / 100);
  } else {
    ret = ((per * MediaQuery.of(context).size.width) / 100);
  }
  return ret;
}
