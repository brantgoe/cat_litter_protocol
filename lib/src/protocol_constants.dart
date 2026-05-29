/// Bumped whenever the wire format changes in a way that is not backward
/// compatible. v1: original integer-id format. v2: syncId-keyed format.
const int protocolVersion = 2;

/// JSON `type` field values for messages exchanged on the WebSocket.
class MsgType {
  static const hello = 'hello';
  static const welcome = 'welcome';
  static const reject = 'reject';
  static const snapshot = 'snapshot';
  static const upsert = 'upsert';
  static const delete = 'delete';
  static const ping = 'ping';
  static const pong = 'pong';
}

/// JSON `entity` field values for upsert/delete messages.
enum EntityKind { room, box, event, task }

extension EntityKindCodec on EntityKind {
  String get wire => name;

  static EntityKind parse(String s) =>
      EntityKind.values.firstWhere((k) => k.name == s);
}
