//
//  Strings.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 09/01/2024.
//

import Foundation
import Extensions

protocol StringKey {
    var rawValue: String { get }
    func get(suffix: String?) -> String
}

extension StringKey {
    func get(suffix: String? = nil) -> String {
        return (rawValue + (suffix ?? "")).localize()
    }
}

extension StringKey {
    typealias Generic = GenericStrings
    typealias Error = ErrorStrings
}

enum GenericStrings: String, StringKey {
    case listScreenTitle = "key_list_screen_title"
    case detailsScreenTitle = "key_details_screen_title"
    case publishedDateTitle = "key_published_date_title"
    case ok = "key_ok"
}

enum ErrorStrings: String, StringKey {
    case errorTitle = "key_error_title"
    case emptyResultMessage = "key_empty_result_message"
}
