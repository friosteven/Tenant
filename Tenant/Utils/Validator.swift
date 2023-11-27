//
//  Validator.swift
//  Tenant
//
//  Created by Steven Frio on 11/7/23.
//

import Foundation

struct Validator {
    private static let regexDigit10 = "^((9))[0-9]{9}$"
    private static let regexDigit11 = "^((09))[0-9]{9}$"
    private static let regexDigit12 = "^((639))[0-9]{9}$"
    private static let regexPW = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[ !\"\\\\#$%&'\\(\\)\\*+,\\-\\./:;<=>?@\\[\\]^_`\\{|\\}~])[A-Za-z\\d !\"\\\\#$%&'\\(\\)\\*+,\\-\\./:;<=>?@\\[\\]^_`\\{|\\}~]{6,}"
    private static let regexEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    static func isValidMobileRegex(_ strToValidate: String) -> Bool {
        isMobileLength10(strToValidate) || isMobileLength11(strToValidate) || isMobileLength12(strToValidate)
    }

    static func isMobileLength10(_ strToValidate: String) -> Bool {
        NSPredicate(format: "SELF MATCHES %@", regexDigit10).evaluate(with: strToValidate)
    }

    static func isMobileLength11(_ strToValidate: String) -> Bool {
        NSPredicate(format: "SELF MATCHES %@", regexDigit11).evaluate(with: strToValidate)
    }

    static func isMobileLength12(_ strToValidate: String) -> Bool {
        NSPredicate(format: "SELF MATCHES %@", regexDigit12).evaluate(with: strToValidate)
    }

    static func isValidPasswordRegex(_ strToValidate: String) -> Bool {
        let isValidLength = strToValidate.count >= 8 ? true : false
        return isValidLength && NSPredicate(format: "SELF MATCHES %@", regexPW).evaluate(with: strToValidate)
    }

    static func isValidEmail(_ strToValidate: String) -> Bool {
        NSPredicate(format: "SELF MATCHES %@", regexEmail).evaluate(with: strToValidate)
    }
}
