abstract class XRestRequest {
  abstract final XRestRequestType type;
  abstract final String path;

  Map<String, String>? headers;
  Map<String, String>? queries;
  dynamic? body;
}

enum XRestRequestType { get, post }
