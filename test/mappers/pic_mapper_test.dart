import 'package:flutter_test/flutter_test.dart';
import 'package:picsum_app/mappers/pic_mapper.dart';

import '../sample/pic_dm_sample.dart';
import '../sample/pic_rm_sample.dart';

void main() {
  test('should map RM to DM', () {
    final actual = picRM.toDM();
    expect(actual, picDM);
  });

  test('should map RM list to DM list', () {
    final actual = [picRM].toDMList();
    expect(actual, [picDM]);
  });
}
