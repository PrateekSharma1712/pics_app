import 'package:picsum_app/data/network/api_constants.dart';
import 'package:picsum_app/domain/entities/pic_dm.dart';

final picDM =
    PicDM('id', 'author', 'url', 300, 300, '${ApiConstants.baseImageUrl}id/');

final picDMWithSpecificId =
    PicDM('100', 'author', 'url', 300, 300, '${ApiConstants.baseImageUrl}id/');

final picDMWithoutAuthor =
    PicDM('id', '', 'url', 300, 300, '${ApiConstants.baseImageUrl}id/');
