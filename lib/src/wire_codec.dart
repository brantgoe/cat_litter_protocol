import 'wire_entities.dart';

class WireCodec {
  // --- WireRoom ---

  static Map<String, dynamic> roomToJson(WireRoom r) => {
        'syncId': r.syncId,
        'name': r.name,
        'catCount': r.catCount,
        'updatedAt': r.updatedAt,
      };

  static WireRoom roomFromJson(Map<String, dynamic> j) => WireRoom(
        syncId: j['syncId'] as String,
        name: j['name'] as String,
        catCount: (j['catCount'] as num?)?.toInt() ?? 0,
        updatedAt: (j['updatedAt'] as num).toInt(),
      );

  // --- WireBox ---

  static Map<String, dynamic> boxToJson(WireBox b) => {
        'syncId': b.syncId,
        'roomSyncId': b.roomSyncId,
        'name': b.name,
        'position': b.position,
        'type': b.type,
        'warnThresholdHours': b.warnThresholdHours,
        'overdueThresholdHours': b.overdueThresholdHours,
        'brand': b.brand,
        'model': b.model,
        'updatedAt': b.updatedAt,
      };

  static WireBox boxFromJson(Map<String, dynamic> j) => WireBox(
        syncId: j['syncId'] as String,
        roomSyncId: j['roomSyncId'] as String?,
        name: j['name'] as String,
        position: (j['position'] as num).toInt(),
        type: j['type'] as String,
        warnThresholdHours: (j['warnThresholdHours'] as num).toInt(),
        overdueThresholdHours: (j['overdueThresholdHours'] as num).toInt(),
        brand: j['brand'] as String,
        model: j['model'] as String,
        updatedAt: (j['updatedAt'] as num).toInt(),
      );

  // --- WireEvent ---

  static Map<String, dynamic> eventToJson(WireEvent e) => {
        'syncId': e.syncId,
        'boxSyncId': e.boxSyncId,
        'timestamp': e.timestamp,
        'dueToSmell': e.dueToSmell,
        'updatedAt': e.updatedAt,
      };

  static WireEvent eventFromJson(Map<String, dynamic> j) => WireEvent(
        syncId: j['syncId'] as String,
        boxSyncId: j['boxSyncId'] as String,
        timestamp: (j['timestamp'] as num).toInt(),
        dueToSmell: j['dueToSmell'] as bool?,
        updatedAt: (j['updatedAt'] as num).toInt(),
      );

  // --- WireTask ---

  static Map<String, dynamic> taskToJson(WireTask t) => {
        'syncId': t.syncId,
        'boxSyncId': t.boxSyncId,
        'name': t.name,
        'intervalCleanings': t.intervalCleanings,
        'anchorTimestamp': t.anchorTimestamp,
        'enabled': t.enabled,
        'offsetCleanings': t.offsetCleanings,
        'updatedAt': t.updatedAt,
      };

  static WireTask taskFromJson(Map<String, dynamic> j) => WireTask(
        syncId: j['syncId'] as String,
        boxSyncId: j['boxSyncId'] as String,
        name: j['name'] as String,
        intervalCleanings: (j['intervalCleanings'] as num).toInt(),
        anchorTimestamp: (j['anchorTimestamp'] as num).toInt(),
        enabled: j['enabled'] as bool,
        offsetCleanings: (j['offsetCleanings'] as num).toInt(),
        updatedAt: (j['updatedAt'] as num).toInt(),
      );
}
