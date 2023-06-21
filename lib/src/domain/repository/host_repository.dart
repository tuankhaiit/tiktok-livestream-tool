import 'dart:ffi';

import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/domain/model/user.dart';

import '../../network/result.dart';
import '../model/host.dart';

abstract class HostRepository {
  Future<XApiSnapshot<Iterable<HostModel>>> getHosts();

  Future<XApiSnapshot<HostModel>> getHostDetail(String hostId);

  Future<XApiSnapshot<Iterable<RoomModel>>> getRooms(String hostId);

  Future<XApiSnapshot<RoomModel>> getRoomDetail(String roomId);

  Future<XApiSnapshot<Iterable<CommentModel>>> getCommentsByHost(
    String hostId,
    String? uniqueId,
  );

  Future<XApiSnapshot<Iterable<CommentModel>>> getCommentsByRoom(
    String roomId,
    String? uniqueId,
  );

  Future<XApiSnapshot<Iterable<UserModel>>> getPotentialUsersByHost(
      String hostId);

  Future<XApiSnapshot<Iterable<UserModel>>> getPotentialUsersByRoom(
      String roomId);

  Future<XApiSnapshot<UserModel>> getUserProfile(String uniqueId);

  Future<XApiSnapshot<Bool>> isRecording(String hostId);
  Future<XApiSnapshot<Bool>> startRecord(String hostId);
  Future<XApiSnapshot<Bool>> stopRecord(String hostId);
}
