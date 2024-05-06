import SwiftUI

struct TariffView: View {
    
    let days: Int
    let priceLabel: String
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Image("calendarVpn")
                Text(String(days))
                    .padding(.top)
                    .foregroundColor(.black)
                    .font(.system(size: 36, weight: .bold))
            }
            Text(priceLabel)
                .font(.system(size: 16))
        }
    }
    
    init(tariff: Tariff) {
        self.days = tariff.days
        self.priceLabel = tariff.priceLabel
    }
}

