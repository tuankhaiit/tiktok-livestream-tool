import '../../../network/request.dart';

class CheckRecordingRequest extends XRestRequest {

  @override
  String get path => 'api/isRecording';

  @override
  XRestRequestType get type => XRestRequestType.get;

  CheckRecordingRequest({required String uniqueId}) {
    queries = {
      'uniqueId': uniqueId ?? '',
    };
  }
}

class StartRecordRequest extends XRestRequest {

  @override
  String get path => 'api/startRecord';

  @override
  XRestRequestType get type => XRestRequestType.get;

  StartRecordRequest({required String uniqueId}) {
    queries = {
      'uniqueId': uniqueId ?? '',
    };
  }
}

class StopRecordRequest extends XRestRequest {

  @override
  String get path => 'api/stopRecord';

  @override
  XRestRequestType get type => XRestRequestType.get;

  StopRecordRequest({required String uniqueId}) {
    queries = {
      'uniqueId': uniqueId ?? '',
    };
  }
}
