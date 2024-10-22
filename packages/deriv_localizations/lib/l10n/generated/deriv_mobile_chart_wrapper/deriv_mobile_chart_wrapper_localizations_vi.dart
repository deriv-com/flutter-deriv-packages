import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Vietnamese (`vi`).
class DerivMobileChartWrapperLocalizationsVi extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get labelIndicators => 'Các chỉ số';

  @override
  String get labelActive => 'Hoạt động';

  @override
  String get labelAll => 'Tất cả';

  @override
  String get labelMomentum => 'Đà';

  @override
  String get labelVolatility => 'Có trọng lượng';

  @override
  String get labelMovingAverages => 'Đường trung bình động';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'Chỉ số sức mạnh tương đối (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Dải Bollinger (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'Đường trung bình động (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'MACD là một chỉ báo giao dịch được sử dụng trong phân tích kỹ thuật giá cổ phiếu. Nó được cho là tiết lộ những thay đổi về sức mạnh, hướng, đà và thời gian của xu hướng trong giá cổ phiếu.';

  @override
  String get infoRSI => 'Chỉ số sức mạnh tương đối (RSI) được công bố bởi J. Welles Wilder. Giá hiện tại được chuẩn hóa theo tỷ lệ phần trăm từ 0 đến 100. Flutter_chart_id của bộ dao động này gây hiểu nhầm vì nó không so sánh công cụ so với một công cụ hoặc bộ công cụ khác, mà đại diện cho giá hiện tại so với các phần gần đây khác trong độ dài cửa sổ nhìn lại đã chọn.';

  @override
  String get infoBB => 'Dải Bollinger (BB) có thể được sử dụng để đo mức cao hoặc thấp của giá so với các giao dịch trước đó.';

  @override
  String get infoMA => 'Đường trung bình động (MA) giúp xác định xu hướng thị trường tổng thể bằng cách lọc ra các biến động giá ngắn hạn. Sử dụng dữ liệu lịch sử, nó tính toán giá trung bình trong một khoảng thời gian cụ thể và vẽ một đường trên biểu đồ. Nếu đường MA di chuyển lên, đó là một chỉ báo của xu hướng tăng, xu hướng giảm nếu nó di chuyển xuống. Tín hiệu mua xảy ra khi giá di chuyển trên đường MA.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'Bạn đã thêm số lượng chỉ báo hoạt động tối đa.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'Thêm $indicator';
  }

  @override
  String get infoAddIndicator => 'Thêm chỉ báo';

  @override
  String get labelDeleteAllIndicators => 'Xóa tất cả các chỉ số';

  @override
  String get infoDeleteAllIndicators => 'Điều này sẽ xóa tất cả các chỉ số hoạt động.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'Thao tác này sẽ đặt lại chỉ báo $indicator về cài đặt mặc định của nó.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'Xóa chỉ báo $indicator';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Đặt lại chỉ báo $indicator';
  }

  @override
  String get infoDeleteIndicator => 'Bạn có chắc chắn muốn xóa chỉ báo này không?';

  @override
  String get labelCancel => 'Hủy';

  @override
  String get labelDelete => 'Xóa';

  @override
  String get labelDeleteAll => 'Xóa tất cả';

  @override
  String get infoUpto3indicatorsAllowed => 'Cho phép tối đa 3 chỉ số hoạt động.';

  @override
  String get infoNoActiveIndicators => 'Không có chỉ số hoạt động.';

  @override
  String get labelReset => 'Đặt lại';

  @override
  String get labelApply => 'Áp dụng';

  @override
  String get labelOK => 'ĐƯỢC';

  @override
  String get labelRSILine => 'Dòng RSI';

  @override
  String get labelPeriod => 'Thời kỳ';

  @override
  String get labelMinRange => 'Phạm vi tối thiểu';

  @override
  String get labelMaxRange => 'Phạm vi tối đa';

  @override
  String get labelSource => 'Nguồn';

  @override
  String get labelClose => 'Đóng';

  @override
  String get labelOpen => 'Mở';

  @override
  String get labelHigh => 'Cao';

  @override
  String get labelLow => 'Thấp';

  @override
  String get labelHl2 => 'Hl/2';

  @override
  String get labelHlc3 => 'Hlc/3';

  @override
  String get labelHlcc4 => 'Hlcc/4';

  @override
  String get labelOhlc4 => 'Ohlc/4';

  @override
  String get labelShowZones => 'Hiển thị khu vực';

  @override
  String get labelOverbought => 'Mua quá mức';

  @override
  String get labelOversold => 'Bán quá mức';

  @override
  String get labelMinSize => 'Kích thước tối thiểu';

  @override
  String get labelMaxSize => 'Kích thước tối đa';

  @override
  String get labelRange => 'Phạm vi';

  @override
  String get labelOverboughtLine => 'Dòng quá mua';

  @override
  String get labelOversoldLine => 'Dòng bán quá mức';

  @override
  String get labelMACDLine => 'Dòng MACD';

  @override
  String get labelFastMAPeriod => 'Thời gian MA nhanh';

  @override
  String get labelSlowMAPeriod => 'Thời gian MA chậm';

  @override
  String get labelSignalLine => 'Đường tín hiệu';

  @override
  String get labelSignalPeriod => 'Thời gian tín hiệu';

  @override
  String get labelIncreasingBar => 'Tăng thanh';

  @override
  String get labelDecreasingBar => 'Thanh giảm';

  @override
  String get labelBollingerBandsTop => 'Bollinger Bands hàng đầu';

  @override
  String get labelBollingerBandsMedian => 'Dải Bollinger trung bình';

  @override
  String get labelBollingerBandsBottom => 'Dải Bollinger phía dưới';

  @override
  String get labelChannelFill => 'Điền kênh';

  @override
  String get labelFillColor => 'Tô màu';

  @override
  String get labelStandardDeviations => 'Độ lệch chuẩn';

  @override
  String get labelMovingAverageType => 'Loại trung bình di chuyển';

  @override
  String get labelMALine => 'Dòng MA';

  @override
  String get labelOffset => 'Bù đắp';

  @override
  String get labelType => 'Kiểu';

  @override
  String get labelSimple => 'Đơn giản';

  @override
  String get labelExponential => 'Theo cấp số nhân';

  @override
  String get labelWeighted => 'Có trọng số';

  @override
  String get labelHull => 'Thân tàu';

  @override
  String get labelZeroLag => 'Không có độ trễ';

  @override
  String get labelTimeSeries => 'Chuỗi thời gian';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => 'Biến';

  @override
  String get labelTriangular => 'Tam giác';

  @override
  String get label2Exponential => '2-cấp số nhân';

  @override
  String get label3Exponential => '3-cấp số nhân';

  @override
  String warnEnterValueBetweenMinMax(Object max, Object min) {
    return 'Nhập giá trị giữa $min và $max';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return 'Phạm vi $min - $max';
  }

  @override
  String get labelDrawingTools => 'Công cụ vẽ';

  @override
  String get labelTools => 'Dụng cụ';

  @override
  String get labelLine => 'Dòng';

  @override
  String get labelRay => 'cá đuối';

  @override
  String get informTapToSetFirstPoint => 'Nhấn để đặt điểm đầu tiên';

  @override
  String get informTapToSetFinalPoint => 'Nhấn để đặt điểm cuối cùng';

  @override
  String get informNoActiveDrawingTools => 'Không có công cụ vẽ hoạt động.';

  @override
  String get actionAddDrawingTool => 'Thêm công cụ vẽ';

  @override
  String get labelOf => 'của';

  @override
  String get labelDeleteAllDrawingTools => 'Xóa tất cả các công cụ vẽ';

  @override
  String get informDeleteAllDrawingTools => 'Thao tác này sẽ xóa tất cả các công cụ vẽ đang hoạt động.';
}
