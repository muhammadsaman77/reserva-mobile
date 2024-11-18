

import 'dart:math';

String generateOrderId() {
  var timestamp = DateTime.now().millisecondsSinceEpoch;
  var randomSuffix = Random().nextInt(10000);
  return 'ORDER-$timestamp-$randomSuffix';
}