/// Wire-format types, JSON codec, and message helpers for the Cat Litter Box
/// Tracker sync protocol.
///
/// Both the tablet app (master / client) and the phone companion app depend on
/// this package. The wire format identifies entities by a UUID `syncId` rather
/// than a per-device auto-incremented integer ID — this prevents collisions
/// when more than one device creates entities concurrently.
library;

export 'src/protocol_constants.dart';
export 'src/wire_entities.dart';
export 'src/wire_codec.dart';
export 'src/messages.dart';
