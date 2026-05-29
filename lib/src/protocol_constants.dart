/// Bumped whenever the wire format changes in a way that is not backward
/// compatible. v1: original integer-id format. v2: syncId-keyed format.
const int protocolVersion = 2;

/// mDNS / DNS-SD service type a master advertises and clients scan for.
/// The trailing `.local` is added by the OS resolver.
const String mdnsServiceType = '_catlitter._tcp';

/// Conventional TXT-record keys on the advertised service. Values are short
/// ASCII strings; readers should ignore unknown keys.
class MdnsTxt {
  /// Protocol version (matches [protocolVersion]).
  static const proto = 'proto';
  /// Master's device id (UUID-ish), used to disambiguate two masters.
  static const deviceId = 'dev';
  /// "1" iff the WebSocket endpoint is wss (TLS). Absent or "0" means ws.
  static const tls = 'tls';
  /// Lowercase hex SHA-256 of the master's self-signed cert (DER form).
  /// Clients pin to this on first connect so a future MITM can't swap certs.
  static const fingerprint = 'fp';
}

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
