//
//  DateFormatter.swift
//  FlickrImage
//
//  Created by Muneer K K on 09/02/2024.
//

import Foundation

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()
