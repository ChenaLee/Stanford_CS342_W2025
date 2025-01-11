//
//  RuntimeError.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//

enum RuntimeError: Error, Equatable {
    case InvalidInputError(String)
    case RuntimeError(String)
}
