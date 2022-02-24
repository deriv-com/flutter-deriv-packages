/// Capitalize a string.
String capitalize(String string) => string
    .split(' ')
    .map(
      (String value) => value.isNotEmpty
          ? '${value[0].toUpperCase()}${value.substring(1).toLowerCase()}'
          : '',
    )
    .join(' ');
