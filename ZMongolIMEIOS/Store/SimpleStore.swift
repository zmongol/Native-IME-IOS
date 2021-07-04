//
//  SimpleStore.swift
//  ZMongolIMEIOS
//
//  Created by Natalia Hudzeliak on 06.04.2021.
//

import Foundation

/// Represents simple store allowing to save, read and delete values for keys.
public protocol SimpleStore {

    /// Sets value for given key in this store. If value is nil then value is removed.
    ///
    /// - Parameters:
    ///   - value: Value to be saved
    ///   - key: Key
    func setValue(_ value: Any?, forKey key: String)

    /// Reads value for given key from this store.
    ///
    /// - Parameter key: Key
    /// - Returns: Value for given key. If no value for key is found nil is returned.
    func value(forKey key: String) -> Any?
}
