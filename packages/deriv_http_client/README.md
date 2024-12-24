# HTTP Client

This is a simple HTTP client library for making HTTP GET and POST requests in Dart. It provides an abstract `BaseHttpClient` class along with a concrete implementation called `HttpClient`. The library is designed to be easy to use and allows for basic authentication with optional error handling.

### Features

**GET Requests:** You can easily make HTTP GET requests by providing the URL and an optional basic authentication token.

**POST Requests:** You can make HTTP POST requests by providing the URL, a JSON request body, and optional headers.

**Error Handling:** The library includes an `HTTPClientException` class for handling HTTP errors. It captures important information such as the status code, error code, and error message.

### GET Request

```dart
try {
  final response = await httpClient.get('https://example.com/api/data');
  // Handle the response here
} catch (e) {
  // Handle errors
}
```

### POST Request

```dart
try {
  final data = {
    'key1': 'value1',
    'key2': 'value2',
  };

  final response = await httpClient.post(
    url: 'https://example.com/api/post',
    jsonBody: data,
  );

  // Handle the response here
} catch (e) {
  // Handle errors
}

```

```dart
final HttpClient httpClient = HttpClient();
```
