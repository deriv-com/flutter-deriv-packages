# deriv_technical_analysis

A comprehensive Dart package for Technical Analysis, providing over 50 technical indicators for financial market analysis.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  deriv_technical_analysis: ^1.0.0
```

Requirements:
- Dart SDK: >=3.0.0 <4.0.0
- Flutter: >=3.10.1

## Core Concepts
The package is built around three core interfaces. 

### 1. IndicatorResult
Represents the output of an indicator calculation:
```dart
abstract class IndicatorResult {
  double get quote;  // The calculated indicator value
}
```

### 2. IndicatorOHLC
Represents price data with Open, High, Low, and Close values:
```dart
abstract class IndicatorOHLC {
  double get open;   // Opening price
  double get high;   // Highest price
  double get low;    // Lowest price
  double get close;  // Closing price
}
```

### 3. IndicatorDataInput


Manages the input data and result creation:
```dart
abstract class IndicatorDataInput {
  List<IndicatorOHLC> get entries;  // Input data points
  IndicatorResult createResult(int index, double value);  // Creates result objects
}
```

## Available Indicators

The package includes a wide range of technical indicators:

#### Trend Indicators
- Moving Averages (SMA, EMA, DEMA, TEMA, TRIMA, WMA, etc.)
- MACD (Moving Average Convergence Divergence)
- Parabolic SAR
- Ichimoku Cloud components

#### Momentum Indicators
- RSI (Relative Strength Index)
- Stochastic (Fast, Slow, Smoothed)
- ROC (Rate of Change)
- Awesome Oscillator
- Williams %R

#### Volatility Indicators
- Bollinger Bands
- ATR (Average True Range)
- Standard Deviation
- Variance

#### Volume Indicators
- CMF (Chaikin Money Flow)
- VMA (Volume Moving Average)

#### Other Indicators
- ADX (Average Directional Index)
- Aroon (Up, Down, Oscillator)
- CCI (Commodity Channel Index)
- Donchian Channel
- Gator Oscillator
- And many more...

## Implementation Guide

### 1. Create Your Result Class

First, create a class that implements `IndicatorResult`:

```dart
class SampleResult implements IndicatorResult {
  SampleResult(this.quote, this.anotherProperty);

  @override
  final double quote;  // Required by IndicatorResult
  
  final int anotherProperty;  // Your custom properties
}
```

### 2. Create Your Input Class

The output of indicators are a generic type. This is to give the consumer of the package the ability to define what model class to be instantiated when an indicator is doing the calculation and wants to create the list of results witl items. You can define the list to contain 
what type. In IndicatorDataInput.createResult you can define what type of output you need. The result values for each item from the indicator result is the quote for each item, your model class type can have other properties.
for example the list of items you want to process or visualize on your side has a data type like below
```Dart
class MarketData {
  MarketData(this.time, this.value);

  final DateTime time;
  final double value;
}
```
If package would give you the result simply as a list of `double`s <double>[]. you would need to convert this list to a list of your own type List<MarketData>. Using the generic type allows you to define when indicators has calculated an item what type to instantiate.

Next, You can implement `IndicatorDataInput` and implemenet `createResult` method:

```dart
class SampleInput implements IndicatorDataInput {
  SampleInput(this.entries);

  @override
  final List<IndicatorOHLC> entries;

  @override
  IndicatorResult createResult(int index, double value) => 
      SampleResult(value, getAnotherProperty(index));
}
```

### 3. Implement OHLC Interface

You can implement `IndicatorOHLC` for both single-value and OHLC data:

```dart
// Single value implementation
class SampleTick implements IndicatorOHLC {
  const SampleTick(this.quote);

  final double quote;

  @override
  double get close => quote;
  @override
  double get high => quote;
  @override
  double get low => quote;
  @override
  double get open => quote;
}

// Full OHLC implementation
class SampleOHLC implements IndicatorOHLC {
  const SampleOHLC(this.open, this.close, this.high, this.low);

  @override
  final double close;
  @override
  final double high;
  @override
  final double low;
  @override
  final double open;
}
```

## Using Indicators

### Basic Usage

```dart
// Prepare your data
final List<SampleOHLC> data = [
  SampleOHLC(0, 75.1, 74.06, 75.11),
  SampleOHLC(0, 75.9, 76.03, 74.64),
  // ... more data points
];

// Create input
final input = SampleInput(data);

// Create and use indicator
final rsi = RSIIndicator<SampleResult>(input);
final allValues = rsi.calculateValues();
final specificValue = rsi.getValue(5);
```

### Chaining Indicators

Indicators can be used as input for other indicators:

```dart
// Create first indicator
final macd = MACDIndicator<SampleResult>(input);

// Use MACD as input for SMA
final sma = SMAIndicator<SampleResult>(macd, 3);
```

### Performance Optimization

Most indicators extend `CachedIndicator` which provides performance optimizations:

```dart
// Calculate all values (cached for future use)
final values = indicator.calculateValues();

// Get specific value (uses cache if available)
final value = indicator.getValue(5);

// Invalidate cached value if needed
indicator.invalidate(3);

// Refresh specific value
indicator.refreshValueFor(5);
```

## Architecture

The package follows a hierarchical structure:

1. `Indicator<T>`: Base abstract class defining core indicator functionality
   - Generic type T extends `IndicatorResult`
   - Handles basic indicator operations

2. `CachedIndicator<T>`: Extends `Indicator<T>` adding caching capabilities
   - Optimizes performance through value caching
   - Provides invalidation and refresh mechanisms
   - Handles batch calculations efficiently

3. Specific Indicators: Extend `CachedIndicator<T>` with specific calculations
   - Implement technical analysis algorithms
   - Can be composed with other indicators
   - Support both single-value and OHLC inputs

## License

```
MIT License

Copyright (c) 2024 Deriv Group Services Ltd

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
