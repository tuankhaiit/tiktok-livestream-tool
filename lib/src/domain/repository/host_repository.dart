import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/domain/model/user.dart';

import '../../network/result.dart';
import '../model/account.dart';
import '../model/host.dart';

abstract class HostRepository {
  Future<XApiSnapshot<AccountModel>> login(String username, String password);

  Future<XApiSnapshot<Iterable<HostModel>>> getHosts();

  Future<XApiSnapshot<HostModel>> getHostDetail(String? hostId, String? roomId);

  Future<XApiSnapshot<bool>> deleteHostAssignment(String? accountId, String? hostId);

  Future<XApiSnapshot<Iterable<RoomModel>>> getRooms(String hostId);

  Future<XApiSnapshot<RoomModel>> getRoomDetail(String roomId);

  Future<XApiSnapshot<Iterable<CommentModel>>> getCommentsByHost(String hostId,
      String? uniqueId,);

  Future<XApiSnapshot<Iterable<CommentModel>>> getCommentsByRoom(String roomId,
      String? uniqueId,);

  Future<XApiSnapshot<Iterable<UserModel>>> getPotentialUsersByHost(
      String hostId);

  Future<XApiSnapshot<Iterable<UserModel>>> getPotentialUsersByRoom(
      String roomId);

  Future<XApiSnapshot<UserModel>> getUserProfile(String uniqueId);

  Future<XApiSnapshot<bool>> isRecording(String uniqueId);

  Future<XApiSnapshot<bool>> startRecord(String uniqueId);

  Future<XApiSnapshot<bool>> stopRecord(String uniqueId);
}
