import 'protocol_constants.dart';
import 'wire_codec.dart';
import 'wire_entities.dart';

class SyncMessages {
  static Map<String, dynamic> hello({
    required String deviceId,
    String? ownedRoomSyncId,
    String? accessToken,
  }) =>
      {
        'type': MsgType.hello,
        'protocol': protocolVersion,
        'deviceId': deviceId,
        'ownedRoomSyncId': ownedRoomSyncId,
        if (accessToken != null) 'accessToken': accessToken,
      };

  /// Sent by the master when an inbound connection presents a wrong or
  /// missing access token. The client should display an "incorrect token"
  /// error and avoid auto-reconnect.
  static Map<String, dynamic> reject({required String reason}) => {
        'type': MsgType.reject,
        'reason': reason,
      };

  static Map<String, dynamic> welcome({
    required int serverTime,
    required String masterDeviceId,
  }) =>
      {
        'type': MsgType.welcome,
        'protocol': protocolVersion,
        'serverTime': serverTime,
        'masterDeviceId': masterDeviceId,
      };

  static Map<String, dynamic> snapshot({
    required List<WireRoom> rooms,
    required List<WireBox> boxes,
    required List<WireEvent> events,
    required List<WireTask> tasks,
  }) =>
      {
        'type': MsgType.snapshot,
        'rooms': rooms.map(WireCodec.roomToJson).toList(),
        'boxes': boxes.map(WireCodec.boxToJson).toList(),
        'events': events.map(WireCodec.eventToJson).toList(),
        'tasks': tasks.map(WireCodec.taskToJson).toList(),
      };

  static Map<String, dynamic> upsertRoom(
          WireRoom r, String originDeviceId) =>
      {
        'type': MsgType.upsert,
        'entity': EntityKind.room.wire,
        'originDeviceId': originDeviceId,
        'data': WireCodec.roomToJson(r),
      };

  static Map<String, dynamic> upsertBox(WireBox b, String originDeviceId) =>
      {
        'type': MsgType.upsert,
        'entity': EntityKind.box.wire,
        'originDeviceId': originDeviceId,
        'data': WireCodec.boxToJson(b),
      };

  static Map<String, dynamic> upsertEvent(
          WireEvent e, String originDeviceId) =>
      {
        'type': MsgType.upsert,
        'entity': EntityKind.event.wire,
        'originDeviceId': originDeviceId,
        'data': WireCodec.eventToJson(e),
      };

  static Map<String, dynamic> upsertTask(
          WireTask t, String originDeviceId) =>
      {
        'type': MsgType.upsert,
        'entity': EntityKind.task.wire,
        'originDeviceId': originDeviceId,
        'data': WireCodec.taskToJson(t),
      };

  static Map<String, dynamic> delete({
    required EntityKind kind,
    required String syncId,
    required String originDeviceId,
  }) =>
      {
        'type': MsgType.delete,
        'entity': kind.wire,
        'originDeviceId': originDeviceId,
        'syncId': syncId,
      };
}
