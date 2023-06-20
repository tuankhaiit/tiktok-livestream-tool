import 'package:tiktok_tool/src/data/network/dto/room_resp_dto.dart';
import 'package:tiktok_tool/src/data/network/request/host_request.dart';
import 'package:tiktok_tool/src/data/network/request/room_request.dart';
import 'package:tiktok_tool/src/data/network/request/user_request.dart';
import 'package:tiktok_tool/src/domain/model/host.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/http.dart';

import '../../domain/model/comment.dart';
import '../../domain/model/room.dart';
import '../../domain/model/user.dart';
import '../../network/result.dart';
import '../network/dto/comment_resp_dto.dart';
import '../network/dto/host_resp_dto.dart';
import '../network/dto/user_resp_dto.dart';
import '../network/request/comment_request.dart';

class HostRepositoryImpl implements HostRepository {
  final XRestService service;

  HostRepositoryImpl(this.service);

  List<HostModel>? _hostCache;
  List<RoomModel>? _roomCache;

  @override
  Future<XApiSnapshot<Iterable<HostModel>>> getHost() async {
    final request = GetAllHostRequest();
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (arrayJson) => List<HostModel>.from(
        arrayJson.map(
          (json) =>
              HostResponseDTO.fromJson(json as Map<String, dynamic>).toModel(),
        ),
      ),
    );
    snapshot.then((value) => _hostCache = value.data);
    return snapshot;
  }

  @override
  Future<XApiSnapshot<Iterable<RoomModel>>> getRoomByHost(String hostId) {
    final request = GetRoomsByHostRequest(hostId);
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (arrayJson) => List<RoomModel>.from(
        arrayJson.map(
          (json) =>
              RoomResponseDTO.fromJson(json as Map<String, dynamic>).toModel(),
        ),
      ),
    );
    snapshot.then((value) => _roomCache = value.data);
    return snapshot;
  }

  @override
  Future<XApiSnapshot<Iterable<CommentModel>>> getCommentsByHost(
      String uniqueId) {
    final request = GetCommentsByHostRequest(uniqueId: uniqueId);
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (arrayJson) => List<CommentModel>.from(
        arrayJson.map(
          (json) => CommentResponseDTO.fromJson(json as Map<String, dynamic>)
              .toModel(),
        ),
      ),
    );
    return snapshot;
  }

  @override
  Future<XApiSnapshot<Iterable<CommentModel>>> getCommentsByRoom(
      String roomId) {
    final request = GetCommentsByRoomRequest(roomId: roomId);
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (arrayJson) => List<CommentModel>.from(
        arrayJson.map(
          (json) => CommentResponseDTO.fromJson(json as Map<String, dynamic>)
              .toModel(),
        ),
      ),
    );
    return snapshot;
  }

  @override
  Future<XApiSnapshot<Iterable<UserModel>>> getPotentialUsersByHost(
      String hostId) {
    final request = GetPotentialUsersByHostRequest(hostId: hostId);
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (arrayJson) => List<UserModel>.from(
        arrayJson.map(
          (json) =>
              UserResponseDTO.fromJson(json as Map<String, dynamic>).toModel(),
        ),
      ),
    );
    return snapshot;
  }

  @override
  Future<XApiSnapshot<Iterable<UserModel>>> getPotentialUsersByRoom(
      String roomId) {
    final request = GetPotentialUsersByRoomRequest(roomId: roomId);
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (arrayJson) => List<UserModel>.from(
        arrayJson.map(
          (json) =>
              UserResponseDTO.fromJson(json as Map<String, dynamic>).toModel(),
        ),
      ),
    );
    return snapshot;
  }

  @override
  Future<XApiSnapshot<UserModel>> getUserProfile(String uniqueId) {
    final request = GetUserProfileRequest(uniqueId: uniqueId);
    final snapshot = XApiHandler(restService: service).execute(
        request,
        (json) =>
            UserResponseDTO.fromJson(json as Map<String, dynamic>).toModel());
    return snapshot;
  }

  @override
  HostModel? getHostModelFromCache(String? uniqueId) {
    final index =
        _hostCache?.indexWhere((element) => element.uniqueId == uniqueId) ?? -1;
    if (index >= 0) {
      return _hostCache?.elementAt(index);
    }
    return null;
  }

  @override
  RoomModel? getRoomModelFromCache(String? roomId) {
    final index =
        _roomCache?.indexWhere((element) => element.roomId == roomId) ?? -1;
    if (index >= 0) {
      return _roomCache?.elementAt(index);
    }
    return null;
  }
}
