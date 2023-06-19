import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';

import '../../network/result.dart';
import '../model/host.dart';

abstract class HostRepository {
  Future<XApiSnapshot<Iterable<HostModel>>> getHost();
  Future<XApiSnapshot<Iterable<RoomModel>>> getRoomByHost(String uniqueId);
  Future<XApiSnapshot<Iterable<CommentModel>>> getCommentByRoom(String roomId);
  HostModel? getHostModelFromCache(String? uniqueId);
  RoomModel? getRoomModelFromCache(String? roomId);
}