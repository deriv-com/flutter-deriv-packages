import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Turkish (`tr`).
class DerivMobileChartWrapperLocalizationsTr extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get labelIndicators => 'Göstergeler';

  @override
  String get labelActive => 'Aktif';

  @override
  String get labelAll => 'Tümü';

  @override
  String get labelMomentum => 'Momentum';

  @override
  String get labelVolatility => 'Volatilite';

  @override
  String get labelMovingAverages => 'Hareketli ortalamalar';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'Göreceli Güç Endeksi (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Bollinger Bantları (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'Hareketli Ortalama (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'MACD, hisse senedi fiyatlarının teknik analizinde kullanılan bir alım satım göstergesidir. Bir hisse senedinin fiyatındaki bir trendin gücü, yönü, momentumu ve süresindeki değişiklikleri ortaya çıkarması beklenir.';

  @override
  String get infoRSI => 'Göreceli Güç Endeksi (RSI) J. Welles Wilder tarafından yayınlanmıştır. Mevcut fiyat 0 ile 100 arasında bir yüzde olarak normalleştirilir. Bu osilatörün flutter_chart_id\'si yanıltıcıdır çünkü enstrümanı başka bir enstrümanla veya enstrüman setiyle karşılaştırmaz, bunun yerine seçilen geriye dönük pencere uzunluğu içindeki diğer son parçalara göre mevcut fiyatı temsil eder.';

  @override
  String get infoBB => 'Bollinger Bantları (BB), önceki işlemlere göre fiyatın yüksekliğini veya düşüklüğünü ölçmek için kullanılabilir.';

  @override
  String get infoMA => 'Hareketli Ortalama (MA), kısa vadeli fiyat dalgalanmalarını filtreleyerek genel piyasa trendini belirlemeye yardımcı olur. Geçmiş verileri kullanarak belirli bir dönemdeki ortalama fiyatı hesaplar ve grafik üzerinde bir çizgi çizer. MA çizgisi yukarı doğru hareket ederse, bu bir yükseliş trendinin, aşağı doğru hareket ederse bir düşüş trendinin göstergesidir. Fiyat MA çizgisinin üzerine çıktığında bir alım sinyali oluşur.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'Maksimum sayıda aktif gösterge eklediniz.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return '${indicator}adresini ekleyin';
  }

  @override
  String get infoAddIndicator => 'Gösterge ekleyin';

  @override
  String get labelDeleteAllIndicators => 'Tüm göstergeleri sil';

  @override
  String get infoDeleteAllIndicators => 'Bu işlem tüm aktif göstergeleri silecektir.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'This will reset the $indicator indicator to its default settings.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'Sil $indicator göstergesi';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Reset $indicator indicator';
  }

  @override
  String get infoDeleteIndicator => 'Bu göstergeyi silmek istediğinizden emin misiniz?';

  @override
  String get labelCancel => 'İptal';

  @override
  String get labelDelete => 'Silme';

  @override
  String get labelDeleteAll => 'Tümünü Sil';

  @override
  String get infoUpto3indicatorsAllowed => 'En fazla 3 aktif göstergeye izin verilir.';

  @override
  String get infoNoActiveIndicators => 'Aktif gösterge yok.';

  @override
  String get labelReset => 'Sıfırla';

  @override
  String get labelApply => 'Başvurmak';

  @override
  String get labelOK => 'TAMAM.';

  @override
  String get labelRSILine => 'RSI çizgisi';

  @override
  String get labelPeriod => 'Dönem';

  @override
  String get labelMinRange => 'Min aralık';

  @override
  String get labelMaxRange => 'Maksimum aralık';

  @override
  String get labelSource => 'Kaynak';

  @override
  String get labelClose => 'Kapat';

  @override
  String get labelOpen => 'Açık';

  @override
  String get labelHigh => 'Yüksek';

  @override
  String get labelLow => 'Düşük';

  @override
  String get labelHl2 => 'Hl/2';

  @override
  String get labelHlc3 => 'Hlc/3';

  @override
  String get labelHlcc4 => 'Hlcc/4';

  @override
  String get labelOhlc4 => 'Ohlc/4';

  @override
  String get labelShowZones => 'Bölgeleri Göster';

  @override
  String get labelOverbought => 'Aşırı alım';

  @override
  String get labelOversold => 'Aşırı satım';

  @override
  String get labelMinSize => 'Min boyut';

  @override
  String get labelMaxSize => 'Maksimum boyut';

  @override
  String get labelRange => 'Menzil';

  @override
  String get labelOverboughtLine => 'Aşırı alım çizgisi';

  @override
  String get labelOversoldLine => 'Aşırı satım çizgisi';

  @override
  String get labelMACDLine => 'MACD çizgisi';

  @override
  String get labelFastMAPeriod => 'Hızlı MA dönemi';

  @override
  String get labelSlowMAPeriod => 'Yavaş MA dönemi';

  @override
  String get labelSignalLine => 'Sinyal hattı';

  @override
  String get labelSignalPeriod => 'Sinyal süresi';

  @override
  String get labelIncreasingBar => 'Artan çubuk';

  @override
  String get labelDecreasingBar => 'Azalan çubuk';

  @override
  String get labelBollingerBandsTop => 'Bollinger Bantları üst';

  @override
  String get labelBollingerBandsMedian => 'Bollinger Bantları medyan';

  @override
  String get labelBollingerBandsBottom => 'Bollinger Bantları alt';

  @override
  String get labelChannelFill => 'Kanal dolgusu';

  @override
  String get labelFillColor => 'Dolgu rengi';

  @override
  String get labelStandardDeviations => 'Standart sapmalar';

  @override
  String get labelMovingAverageType => 'Hareketli Ortalama Türü';

  @override
  String get labelMALine => 'Ana hat';

  @override
  String get labelOffset => 'Ofset';

  @override
  String get labelType => 'Tip';

  @override
  String get labelSimple => 'Basit';

  @override
  String get labelExponential => 'Üstel';

  @override
  String get labelWeighted => 'Ağırlıklı';

  @override
  String get labelHull => 'Gövde';

  @override
  String get labelZeroLag => 'Sıfır Gecikme';

  @override
  String get labelTimeSeries => 'Zaman Serisi';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => 'Değişken';

  @override
  String get labelTriangular => 'Üçgen';

  @override
  String get label2Exponential => '2-Eksponansiyel';

  @override
  String get label3Exponential => '3-Eksponansiyel';

  @override
  String warnEnterValueBetweenMinMax(Object max, Object min) {
    return 'Enter a value between $min and $max';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return 'Range $min - $max';
  }

  @override
  String get labelDrawingTools => 'Drawing tools';

  @override
  String get labelTools => 'Tools';

  @override
  String get labelLine => 'Line';

  @override
  String get labelRay => 'Ray';

  @override
  String get informTapToSetFirstPoint => 'Tap to set first point';

  @override
  String get informTapToSetFinalPoint => 'Tap to set final point';

  @override
  String get informNoActiveDrawingTools => 'No active drawing tools.';

  @override
  String get actionAddDrawingTool => 'Add drawing tool';

  @override
  String get labelOf => 'of';

  @override
  String get labelDeleteAllDrawingTools => 'Delete all drawing tools';

  @override
  String get informDeleteAllDrawingTools => 'This will delete all active drawing tools.';
}
