import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_status/bloc/stream_status_state.dart';

import '../../../../data/service/app_storage.dart';
import '../../../../socket/socket_connector.dart';

class StreamStatusBloc extends Cubit<StreamStatusState> {

  StreamStatusBloc() : super(StreamStatusState.none()) {
    connectServer();
  }

  void connectServer() async {
    SocketService.connectServer(this);
  }

  void connectUniqueId(String uniqueId) {
    SocketService.connectLivestream(this, uniqueId);
  }

  void disconnectServer() {
    SocketService.disconnectServer(this);
  }

  void disconnectUniqueId() {
    SocketService.disconnectLivestream(this);
  }

  void serverError(String error) {
    emit(state.copyWith(status: error, serverOnline: false));
  }

  void emptyState() {
    emit(StreamStatusState.empty(state));
  }

  void status(String status) {
    emit(state.copyWith(status: status));
  }

  void updateMember(int memberNum) {
    emit(state.copyWith(memberNum: memberNum));
  }

  void updateStatistic(dynamic data) {
    emit(state.copyWith(connectionNum: data['globalConnectionCount']));
  }

  void online(RoomModel model) {
    emit(state.copyWith(
      roomId: model.roomId,
      uniqueId: model.uniqueId,
      nickname: model.nickname,
      avatar: model.avatar,
      status: 'Online',
    ));
  }

  void offline() {
    emit(StreamStatusState.offline(state));
  }

  void serverOn() {
    emit(state.copyWith(serverOnline: true));
  }

  void serverOff() {
    emit(state.copyWith(serverOnline: false));
  }
}
