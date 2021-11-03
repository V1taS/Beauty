//
//  String+Mask.swift
//  Beauty
//
//  Created by Vitalii Sosin on 03.11.2021.
//

import Foundation

extension String {

    /// Применяет маску вида "###-##-##" заменой каждого символа '#' из маски очередным
    /// символом из self. Если количество символов в self больше количества '#' в маске,
    /// то лишние символы отбрасываются. Можно использовать, например, для форматирования
    /// номера телефона/счета/карты.
    ///
    ///     let mask = "+# (###) ###-##-##"
    ///     "79031238796".masked(with: mask)      //  ->  "+7 (903) 123-87-96"
    ///     "790312387".masked(with: mask)        //  ->  "+7 (903) 123-87"
    ///     "790312387961005".masked(with: mask)  //  ->  "+7 (903) 123-87-96"
    ///
    func masked(with mask: String) -> String {
        let prefixes = mask.split(separator: "#", omittingEmptySubsequences: false).dropLast()

        return zip(prefixes, self).reduce(into: "") {
            $0.append(contentsOf: $1.0)
            $0.append($1.1)
        }
    }
}
