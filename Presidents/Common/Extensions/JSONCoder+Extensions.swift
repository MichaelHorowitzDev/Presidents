//
//  JSONCoder+Extensions.swift
//  Mystoks
//
//  Created by Michael Horowitz on 7/7/22.
//

import Foundation

extension JSONDecoder {
  func decode<T: Decodable>(_ type: T.Type, from: Any) throws -> T {
    if !JSONSerialization.isValidJSONObject(from) {
      throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: ""))
    }
    let data = try JSONSerialization.data(withJSONObject: from)
    return try self.decode(type, from: data)
  }
}

extension JSONEncoder {
  func encodeAny<T: Encodable>(_ value: T) throws -> Any {
    let data: Data = try self.encode(value)
    return try JSONSerialization.jsonObject(with: data)
  }

  func encodeType<T: Encodable, U>(_ value: T, type: U.Type) throws -> U? {
    return try self.encodeAny(value) as? U
  }
}
