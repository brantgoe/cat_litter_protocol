import 'package:cat_litter_protocol/cat_litter_protocol.dart';
import 'package:test/test.dart';

void main() {
  test('WireRoom round-trips through JSON', () {
    const r = WireRoom(syncId: 'aaa', name: 'Kitchen', updatedAt: 12345);
    final back = WireCodec.roomFromJson(WireCodec.roomToJson(r));
    expect(back.syncId, r.syncId);
    expect(back.name, r.name);
    expect(back.updatedAt, r.updatedAt);
  });

  test('WireBox preserves nullable roomSyncId', () {
    const b1 = WireBox(
      syncId: 'b1',
      roomSyncId: 'r1',
      name: 'Front',
      position: 0,
      type: 'AUTOMATIC',
      warnThresholdHours: 24,
      overdueThresholdHours: 48,
      brand: 'Acme',
      model: 'X1',
      updatedAt: 1,
    );
    const b2 = WireBox(
      syncId: 'b2',
      roomSyncId: null,
      name: 'Orphan',
      position: 0,
      type: 'MANUAL_SCOOP',
      warnThresholdHours: 24,
      overdueThresholdHours: 48,
      brand: '',
      model: '',
      updatedAt: 1,
    );
    expect(
        WireCodec.boxFromJson(WireCodec.boxToJson(b1)).roomSyncId, 'r1');
    expect(
        WireCodec.boxFromJson(WireCodec.boxToJson(b2)).roomSyncId, isNull);
  });

  test('WireEvent preserves nullable dueToSmell', () {
    const e = WireEvent(
      syncId: 'e1',
      boxSyncId: 'b1',
      timestamp: 5,
      dueToSmell: null,
      updatedAt: 10,
    );
    expect(WireCodec.eventFromJson(WireCodec.eventToJson(e)).dueToSmell,
        isNull);
  });

  test('SyncMessages.snapshot has the expected shape', () {
    final m = SyncMessages.snapshot(
      rooms: const [WireRoom(syncId: 'r', name: 'R', updatedAt: 1)],
      boxes: const [],
      events: const [],
      tasks: const [],
    );
    expect(m['type'], MsgType.snapshot);
    expect((m['rooms'] as List).length, 1);
    expect((m['boxes'] as List).length, 0);
  });

  test('EntityKindCodec.parse round-trips', () {
    for (final k in EntityKind.values) {
      expect(EntityKindCodec.parse(k.wire), k);
    }
  });
}
