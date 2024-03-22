//
//  SNToastModifier.swift
//  CoinMarketApp
//
//  Created by Carlos Jaramillo on 3/22/24.
//

import SwiftUI

struct SNToastModifier: ViewModifier {
    @Binding var toast: SNToastAlert?
    let verticalMargin: CGFloat = 20.0
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    mainToastView()
                }.animation(.spring, value: toast)
            )
            .onChange(of: toast) { value in
                showToast()
            }
    }
    
    @ViewBuilder func mainToastView() -> some View {
        if let toast = toast {
            if toast.location == .top {
                VStack {
                    SNToastAlertView(toast: toast, onCloseTapped: self.dismissToast)
                    Spacer()
                }
                .offset(y: self.verticalMargin)
                .transition(.move(edge: .top))
            } else {
                VStack {
                    Spacer()
                    SNToastAlertView(toast: toast, onCloseTapped: self.dismissToast)
                }
                .offset(y: -self.verticalMargin)
                .transition(.move(edge: .bottom))
            }
        }
    }
    
    private func showToast() {
        guard let toast = toast else { return }
        
        if toast.enableVibration {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration.length) {
            dismissToast()
        }
    }
    
    private func dismissToast() {
        withAnimation {
            toast = nil
        }
    }
}

extension View {
    func toastView(toast: Binding<SNToastAlert?>) -> some View {
        self.modifier(SNToastModifier(toast: toast))
    }
}
