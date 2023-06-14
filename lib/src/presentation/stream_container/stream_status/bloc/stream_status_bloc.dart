import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_status/bloc/stream_status_state.dart';

import '../../../../socket/socket_connector.dart';

class StreamStatusBloc extends Cubit<StreamStatusState> {
  StreamStatusBloc() : super(StreamStatusState.empty()) {
    SocketService.connectServer(this);
  }

  void reConnectServer() {
    SocketService.connectServer(this);
  }

  void serverError(String error) {
    emit(state.copyWith(status: error, serverOnline: false));
  }

  void status(String status) {
    emit(state.copyWith(status: status));
  }

  void updateMember(int memberNum) {
    emit(state.copyWith(memberNum: memberNum));
  }

  void online(RoomModel model) {
    emit(state.copyWith(
      roomId: model.roomId,
      uniqueId: model.uniqueId,
      nickname: model.nickname,
      avatar: model.avatar,
      status: 'Online',
      streamerOnline: true,
    ));
  }

  void offline() {
    emit(StreamStatusState.offline());
  }

  void serverOn() {
    emit(state.copyWith(serverOnline: true));
  }

  void serverOff() {
    emit(state.copyWith(serverOnline: false));
  }
}
