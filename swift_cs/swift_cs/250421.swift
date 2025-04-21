//
//  250421.swift
//  swift_cs
//
//  Created by 천성우 on 4/21/25.
//

import Foundation

func programmers_이모티콘_할인행사(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    let discountRates = [10, 20, 30, 40]
    var maxSubscribers = 0
    var maxSales = 0

    func dfs(_ index: Int, _ currentDiscounts: [Int]) {
        if index == emoticons.count {
            var subscribers = 0
            var sales = 0

            for user in users {
                let minDiscount = user[0]
                let maxPrice = user[1]
                var total = 0

                for (i, discount) in currentDiscounts.enumerated() {
                    if discount >= minDiscount {
                        let discountedPrice = emoticons[i] * (100 - discount) / 100
                        total += discountedPrice
                    }
                }

                if total >= maxPrice {
                    subscribers += 1
                } else {
                    sales += total
                }
            }

            if subscribers > maxSubscribers || (subscribers == maxSubscribers && sales > maxSales) {
                maxSubscribers = subscribers
                maxSales = sales
            }

            return
        }

        for rate in discountRates {
            dfs(index + 1, currentDiscounts + [rate])
        }
    }

    dfs(0, [])
    return [maxSubscribers, maxSales]
}
