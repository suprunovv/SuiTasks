import SwiftUI

struct BasketView: View {
    @State var isShowAlert = false
    @EnvironmentObject var tariffData: TariffData
    
    var body: some View {
        VStack(spacing: 25) {
            titleBody
            VStack {
                if let tariff = tariffData.currentTariff {
                    BasketTariffView(tariff: tariff)
                    Button {
                        isShowAlert.toggle()
                    } label: {
                        Text("Buy")
                            .foregroundColor(.white)
                    }.alert(isPresented: $isShowAlert) {
                        Alert(title: Text("Покупка прошла успешно!"),
                              message: Text("Доступ к VPN на \(tariff.days) дней"))
                    }.padding()
                        .frame(maxWidth: 342, maxHeight: 48)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))

                } else {
                    Spacer().frame(maxHeight: 250)
                    Text("Cart is empty")
                        .font(.system(size: 25, weight: .bold))
                }
            }
            Spacer()
        }
    }
    
    private var titleBody: some View {
        VStack(spacing: 22) {
            Text("You choosed")
                .font(.system(size: 24))
            Text("Please check and pay the selected tariff")
        }
    }
}
