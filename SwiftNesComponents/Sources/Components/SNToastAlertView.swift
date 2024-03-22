//
//  SNToastAlertView.swift
//  CoinMarketApp
//
//  Created by Carlos Jaramillo on 2/18/24.
//

import SwiftUI

typealias actionTap = (() -> Void)

struct SNToastAlertView: View {
    var toast: SNToastAlert
    let heightContainer: CGFloat = 80.0
    var onCloseTapped: actionTap
    
    var body: some View {
        HStack(alignment: .top) {
            Rectangle()
                .foregroundColor(toast.style.themeColor)
                .frame(width: 8.0)
            HStack(alignment: .top) {
                Image(systemName: toast.style.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(toast.style.themeColor)
                VStack(alignment: .leading, spacing: 3) {
                    Text(toast.title)
                        .font(.system(size: 17, weight: .heavy))
                        .bold()
                        .foregroundColor(.black)
                    Text(toast.message)
                        .font(.system(size: 13, weight: .regular))
                        .bold()
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
            }.padding(.top, 15)
            Spacer()
            Button(action: self.onCloseTapped) {
                Image(systemName: "xmark")
                    .resizable()
                    .font(.title)
                    .foregroundColor(.black)
                    .frame(width: 12, height: 12)
            }.padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 15))
        }
        .frame(maxHeight: heightContainer)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 15)
        .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 3)
    }
}

#Preview {
    SNToastAlertView(toast: .init(style: .success, title: "Error", message: "whe have an error"), onCloseTapped: {})
}


