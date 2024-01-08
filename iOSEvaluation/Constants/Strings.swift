//
//  Strings.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 30/08/2023.
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
    case nameTitle = "key_name_title"
    case statusTitle = "key_status_title"
    case speciesTitle = "key_species_title"
    case ok = "key_ok"
    case mainInfoSectionTitle = "key_main_info_sections_title"
    case episodesSectionTitle = "key_episodes_title"
}

enum ErrorStrings: String, StringKey {
    case errorTitle = "key_error_title"
    case emptyResultMessage = "key_empty_result_message"
}
