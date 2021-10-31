//
//  String+AES.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//

import Foundation
import CommonCrypto

private let key256 = "12345678901234561234567890123456"
private let key128 = "1234567890123456"
private let iv = "abcdefghijklmnop"

extension String {

    var aes256Encrypted: String? {
        let aes256 = AES(key: key256, iv: iv)
        let encrypted = aes256?.encrypt(string: self)
        guard let base64String: String = encrypted?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0)) else {
            return nil
        }
        let result = String(base64String)
        return result
    }

    var aes256Decrypted: String? {
        let aes256 = AES(key: key256, iv: iv)
        guard let dataToDecrypt = NSData(base64Encoded: self, options: NSData.Base64DecodingOptions(rawValue: 0)) else {
            return nil
        }
        let decrypted = aes256?.decrypt(data: dataToDecrypt as Data)
        return decrypted
    }
}

private struct AES {

    // MARK: - Value
    // MARK: Private
    private let key: Data
    private let iv: Data

    // MARK: - Initialzier
    init?(key: String, iv: String) {
        guard key.count == kCCKeySizeAES128 || key.count == kCCKeySizeAES256, let keyData = key.data(using: .utf8) else {
            #if DEBUG
            debugPrint("Error: Failed to set a key.")
            #endif
            return nil
        }

        guard iv.count == kCCBlockSizeAES128, let ivData = iv.data(using: .utf8) else {
            #if DEBUG
            debugPrint("Error: Failed to set an initial vector.")
            #endif
            return nil
        }

        self.key = keyData
        self.iv  = ivData
    }


    // MARK: - Function
    // MARK: Public
    func encrypt(string: String) -> Data? {
        return crypt(data: string.data(using: .utf8), option: CCOperation(kCCEncrypt))
    }

    func decrypt(data: Data?) -> String? {
        guard let decryptedData = crypt(data: data, option: CCOperation(kCCDecrypt)) else { return nil }
        return String(bytes: decryptedData, encoding: .utf8)
    }

    func crypt(data: Data?, option: CCOperation) -> Data? {
        guard let data = data else { return nil }

        let cryptLength = data.count + kCCBlockSizeAES128
        var cryptData   = Data(count: cryptLength)

        let keyLength = key.count
        let options   = CCOptions(kCCOptionPKCS7Padding)

        var bytesLength = Int(0)

        let status = cryptData.withUnsafeMutableBytes { cryptBytes in
            data.withUnsafeBytes { dataBytes in
                iv.withUnsafeBytes { ivBytes in
                    key.withUnsafeBytes { keyBytes in
                    CCCrypt(option, CCAlgorithm(kCCAlgorithmAES), options, keyBytes.baseAddress, keyLength, ivBytes.baseAddress, dataBytes.baseAddress, data.count, cryptBytes.baseAddress, cryptLength, &bytesLength)
                    }
                }
            }
        }

        guard UInt32(status) == UInt32(kCCSuccess) else {
            #if DEBUG
            debugPrint("Error: Failed to crypt data. Status \(status)")
            #endif
            return nil
        }

        cryptData.removeSubrange(bytesLength..<cryptData.count)
        return cryptData
    }
}

