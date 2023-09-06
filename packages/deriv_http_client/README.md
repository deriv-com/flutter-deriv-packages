# HttpClient

HttpClient is a Dart package that provides a singleton class for making HTTP requests. It simplifies the process of sending GET and POST requests, handling JSON encoding and decoding, and providing error handling for non-2xx HTTP status codes.

### GET Request

```dart
try {
  final response = await httpClient.get('https://example.com/api/data');
  print('Response: ${response.body}');
} catch (e) {
  print('Error: $e');
}
```

### POST Request

```dart
try {
  final response = await httpClient.get('https://example.com/api/data');
  print('Response: ${response.body}');
} catch (e) {
  print('Error: $e');
}
```

### Singleton Pattern

The `HttpClient` class is implemented as a Singleton pattern, ensuring that there is only one instance of it in your application. You can access this instance using `HttpClient()`.

```dart
final HttpClient httpClient = HttpClient();
```
