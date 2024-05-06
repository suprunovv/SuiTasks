import SwiftUI

struct PurchaseView: View {
    @EnvironmentObject var tariffData: TariffData
    
    var body: some View {
        VStack {
           titleBody
           tariffesBody
        }
    }
    
    private var titleBody: some View {
        VStack(spacing: 22) {
            Text("Privacy Matters")
                .font(.system(size: 24, weight: .bold))
            Text("Protect your online activities with VPN Plus")
                .font(.system(size: 16))
        }
    }
    
    private var tariffesBody: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(tariffData.tariffs.indices, id: \.self) { index in
                    TariffView(tariff: tariffData.tariffs[index])
                    Button {
                        if tariffData.currentIndex != index {
                            tariffData.currentIndex = index
                        } else if tariffData.currentIndex == index {
                            tariffData.currentIndex = nil
                        }
                    } label: {
                        Text(tariffData.currentIndex == index ? "Added" : "Buy")
                    }.padding()
                        .frame(maxWidth: 100, maxHeight: 48)
                        .background(tariffData.currentIndex == index ? Color.addedButton : .blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }.padding()
    }
}
