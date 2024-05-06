import SwiftUI

struct BasketTariffView: View {
    let days: Int
    let priceLabel: String
    
    var body: some View {
        HStack {
            ZStack {
                Image("calendarVpn")
                Text(String(days))
                    .padding(.top)
                    .foregroundColor(.black)
                    .font(.system(size: 36, weight: .bold))
            }
            Text(priceLabel)
                .lineLimit(2)
                .frame(maxWidth: 179)
        }
    }
    
    init(tariff: Tariff) {
        self.days = tariff.days
        self.priceLabel = tariff.priceLabel
    }
}
