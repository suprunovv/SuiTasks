import Foundation

final class TariffData: ObservableObject {
    @Published var currentIndex: Int? = nil
    @Published var tariffs = [Tariff(days: 7, priceLabel: "Vacation (7 days) 99 RUB"),
                              Tariff(days: 30, priceLabel: "Standart (1 month) 179 RUB"),
                              Tariff(days: 90, priceLabel: "Standart+ (3 month) 279 RUB")]
    
    var currentTariff: Tariff? {
        guard let currentIndex else {
            return nil
        }
        return tariffs[currentIndex]
    }
}
