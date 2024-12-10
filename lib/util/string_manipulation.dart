String toTitleCase(String str) {
  return str.split(' ').map((word) {
    return word.isNotEmpty ? word[0].toUpperCase() + word.substring(1).toLowerCase() : '';
  }).join(' ');
}