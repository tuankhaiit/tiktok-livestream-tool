import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/domain/model/user.dart';

import '../../network/result.dart';
import '../model/host.dart';

abstract class HostRepository {
  Future<XApiSnapshot<Iterable<HostModel>>> getHost();
  Future<XApiSnapshot<Iterable<RoomModel>>> getRoomByHost(String hostId);
  Future<XApiSnapshot<Iterable<CommentModel>>> getCommentsByHost(String uniqueId);
  Future<XApiSnapshot<Iterable<CommentModel>>> getCommentsByRoom(String roomId);
  Future<XApiSnapshot<Iterable<UserModel>>> getPotentialUsersByHost(String hostId);
  Future<XApiSnapshot<Iterable<UserModel>>> getPotentialUsersByRoom(String roomId);
  Future<XApiSnapshot<UserModel>> getUserProfile(String uniqueId);
  HostModel? getHostModelFromCache(String? uniqueId);
  RoomModel? getRoomModelFromCache(String? roomId);
}