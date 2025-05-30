import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Korean (`ko`).
class DerivMobileChartWrapperLocalizationsKo extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get labelIndicators => '지표';

  @override
  String get labelActive => '활성';

  @override
  String get labelAll => '모두';

  @override
  String get labelMomentum => '모멘텀';

  @override
  String get labelVolatility => '변동성';

  @override
  String get labelMovingAverages => '이동 평균';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => '상대 강도 지수(RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => '볼린저 밴드(BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => '이동 평균(MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'MACD는 주가의 기술적 분석에 사용되는 트레이딩 지표입니다. 이는 주식 가격 추세의 강도, 방향, 모멘텀, 지속 기간의 변화를 나타내는 지표입니다.';

  @override
  String get infoRSI => '상대강도지수(RSI)는 J. 웰즈 와일더가 발표했습니다. 현재 가격은 0에서 100 사이의 백분율로 정규화됩니다. 이 오실레이터의 flutter_chart_id는 다른 상품 또는 상품 세트와 비교하는 것이 아니라 선택한 룩백 윈도우 길이 내의 다른 최근 상품과 비교한 현재 가격을 나타내므로 오해의 소지가 있습니다.';

  @override
  String get infoBB => '볼린저 밴드(BB)는 이전 거래 대비 가격의 고점 또는 저점을 측정하는 데 사용할 수 있습니다.';

  @override
  String get infoMA => '이동평균(MA)은 단기적인 가격 변동을 걸러내어 전체 시장 추세를 파악하는 데 도움이 됩니다. 과거 데이터를 사용하여 특정 기간 동안의 평균 가격을 계산하고 차트에 선을 표시합니다. MA 선이 위로 이동하면 상승 추세, 아래로 이동하면 하락 추세의 지표입니다. 가격이 MA 선 위로 이동하면 매수 신호가 발생합니다.';

  @override
  String get infoMaximumActiveIndicatorsAdded => '활성 지표의 최대 개수를 추가했습니다.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return '$indicator추가';
  }

  @override
  String get infoAddIndicator => '표시기 추가';

  @override
  String get labelDeleteAllIndicators => '모든 지표 삭제';

  @override
  String get infoDeleteAllIndicators => '이렇게 하면 모든 활성 표시기가 삭제됩니다.';

  @override
  String infoResetIndicators(Object indicator) {
    return '이렇게 하면 $indicator 표시기가 기본 설정으로 재설정됩니다.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return '$indicator 표시기 삭제';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return '$indicator 표시기 재설정';
  }

  @override
  String get infoDeleteIndicator => '이 표시기를 삭제하시겠습니까?';

  @override
  String get labelCancel => '취소';

  @override
  String get labelDelete => '삭제';

  @override
  String get labelDeleteAll => '모두 삭제';

  @override
  String get infoUpto3indicatorsAllowed => '활성 표시기는 최대 3개까지 허용됩니다.';

  @override
  String get infoNoActiveIndicators => '활성 표시기가 없습니다.';

  @override
  String get labelReset => '초기화';

  @override
  String get labelApply => '신청하기';

  @override
  String get labelOK => '확인';

  @override
  String get labelRSILine => 'RSI 라인';

  @override
  String get labelPeriod => '기간';

  @override
  String get labelMinRange => '최소 범위';

  @override
  String get labelMaxRange => '최대 범위';

  @override
  String get labelSource => '출처';

  @override
  String get labelClose => '닫기';

  @override
  String get labelOpen => '열기';

  @override
  String get labelHigh => '높음';

  @override
  String get labelLow => '낮음';

  @override
  String get labelHl2 => 'Hl/2';

  @override
  String get labelHlc3 => 'HLC/3';

  @override
  String get labelHlcc4 => 'Hlcc/4';

  @override
  String get labelOhlc4 => 'Ohlc/4';

  @override
  String get labelShowZones => '영역 표시';

  @override
  String get labelOverbought => '과매수';

  @override
  String get labelOversold => '과매도';

  @override
  String get labelMinSize => '최소 크기';

  @override
  String get labelMaxSize => '최대 크기';

  @override
  String get labelRange => '범위';

  @override
  String get labelOverboughtLine => '과매수 라인';

  @override
  String get labelOversoldLine => '과매도 라인';

  @override
  String get labelMACDLine => 'MACD 라인';

  @override
  String get labelFastMAPeriod => '빠른 MA 기간';

  @override
  String get labelSlowMAPeriod => '느린 MA 기간';

  @override
  String get labelSignalLine => '신호 라인';

  @override
  String get labelSignalPeriod => '신호 기간';

  @override
  String get labelIncreasingBar => '바 증가';

  @override
  String get labelDecreasingBar => '바 감소';

  @override
  String get labelBollingerBandsTop => '볼린저 밴드 상단';

  @override
  String get labelBollingerBandsMedian => '볼린저 밴드 중앙값';

  @override
  String get labelBollingerBandsBottom => '볼린저 밴드 하단';

  @override
  String get labelChannelFill => '채널 채우기';

  @override
  String get labelFillColor => '채우기 색상';

  @override
  String get labelStandardDeviations => '표준 편차';

  @override
  String get labelMovingAverageType => '이동 평균 유형';

  @override
  String get labelMALine => 'MA 라인';

  @override
  String get labelOffset => '오프셋';

  @override
  String get labelType => '유형';

  @override
  String get labelSimple => '심플';

  @override
  String get labelExponential => '지수';

  @override
  String get labelWeighted => '가중치';

  @override
  String get labelHull => '헐';

  @override
  String get labelZeroLag => '제로 랙';

  @override
  String get labelTimeSeries => '시계열';

  @override
  String get labelWellesWilder => '웰즈 와일더';

  @override
  String get labelVariable => '변수';

  @override
  String get labelTriangular => '삼각형';

  @override
  String get label2Exponential => '2-지수';

  @override
  String get label3Exponential => '3-지수';

  @override
  String warnEnterValueBetweenMinMax(Object max, Object min) {
    return '$min ~ $max사이의 값을 입력합니다.';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return '범위 $min - $max';
  }

  @override
  String get labelDrawingTools => '드로잉 툴';

  @override
  String get labelTools => '도구';

  @override
  String get labelLine => '선';

  @override
  String get labelRay => '광선';

  @override
  String get informTapToSetFirstPoint => '첫 번째 포인트를 설정하려면 누릅니다.';

  @override
  String get informTapToSetFinalPoint => '탭하여 최종 지점을 설정합니다.';

  @override
  String get informNoActiveDrawingTools => '활성 드로잉 도구가 없습니다.';

  @override
  String get actionAddDrawingTool => '드로잉 도구 추가';

  @override
  String get labelOf => '의';

  @override
  String get labelDeleteAllDrawingTools => '모든 그리기 도구 삭제';

  @override
  String get informDeleteAllDrawingTools => '활성화된 모든 그리기 도구가 삭제됩니다.';
}
