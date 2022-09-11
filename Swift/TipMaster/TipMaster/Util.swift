//
// Created by bluesden on 11/09/22.
//

import Foundation

func currencyCode() -> String {
    Locale.current.currencyCode ?? "USD"
}