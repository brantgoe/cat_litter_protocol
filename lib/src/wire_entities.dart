/// Plain-Dart wire entities. Parents are referenced by their `syncId`, never
/// by a per-device integer id. `updatedAt` is the epoch-ms timestamp on the
/// device that authored the change and drives last-write-wins resolution.

class WireRoom {
  const WireRoom({
    required this.syncId,
    required this.name,
    required this.updatedAt,
  });

  final String syncId;
  final String name;
  final int updatedAt;
}

class WireBox {
  const WireBox({
    required this.syncId,
    required this.roomSyncId,
    required this.name,
    required this.position,
    required this.type,
    required this.warnThresholdHours,
    required this.overdueThresholdHours,
    required this.brand,
    required this.model,
    required this.updatedAt,
  });

  final String syncId;
  final String? roomSyncId;
  final String name;
  final int position;
  final String type;
  final int warnThresholdHours;
  final int overdueThresholdHours;
  final String brand;
  final String model;
  final int updatedAt;
}

class WireEvent {
  const WireEvent({
    required this.syncId,
    required this.boxSyncId,
    required this.timestamp,
    required this.dueToSmell,
    required this.updatedAt,
  });

  final String syncId;
  final String boxSyncId;
  final int timestamp;
  final bool? dueToSmell;
  final int updatedAt;
}

class WireTask {
  const WireTask({
    required this.syncId,
    required this.boxSyncId,
    required this.name,
    required this.intervalCleanings,
    required this.anchorTimestamp,
    required this.enabled,
    required this.offsetCleanings,
    required this.updatedAt,
  });

  final String syncId;
  final String boxSyncId;
  final String name;
  final int intervalCleanings;
  final int anchorTimestamp;
  final bool enabled;
  final int offsetCleanings;
  final int updatedAt;
}
