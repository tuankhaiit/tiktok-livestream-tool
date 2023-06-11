import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/presentation/stream_status/stream_status_state.dart';

import '../../socket/socket_connector.dart';

class StreamStatusBloc extends Cubit<StreamStatusState> {
  StreamStatusBloc() : super(StreamStatusState.empty()) {
    SocketService.connectServer(this);
    SocketService.connectLivestream(this);
  }

  void connectError(String error) {
    emit(state.copyWith(status: error, serverOnline: false));
  }

  void connecting(String uniqueId) {
    emit(state.copyWith(status: 'Connecting to $uniqueId'));
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
    emit(StreamStatusState.offline());
  }

  void serverOn() {
    emit(state.copyWith(serverOnline: true));
  }

  void serverOff() {
    emit(state.copyWith(serverOnline: false));
  }
}
