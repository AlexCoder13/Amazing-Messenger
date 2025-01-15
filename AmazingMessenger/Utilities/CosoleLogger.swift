//
//  CosoleLogger.swift
//  AmazingMessenger
//
//  Created by Александр Семёнов on 15.01.2025.
//

struct CosoleLogger {
    static func i(_ messаge: String) {
#if LOGS
        print(messаge)
#endif
    }
}
