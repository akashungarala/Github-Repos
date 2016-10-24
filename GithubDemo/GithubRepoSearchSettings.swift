//
//  GithubRepoSearchSettings.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import Foundation

// Model class that represents the user's search settings
struct GithubRepoSearchSettings {
    
    var searchString: String?
    var minStars = 0
    var isFilterByLanguage = false
    var languages: [Language]? = []
    
    init() {}

}

enum Language: String {
    case Java = "Java",
    JavaScript = "JavaScript",
    ObjectiveC = "Objective-C",
    Python = "Python",
    Ruby = "Ruby",
    Swift = "Swift",
    Php = "PHP",
    CPlusPlus = "C++",
    C = "C",
    Perl = "Perl"
    
    static let languageValues = [Java, JavaScript, ObjectiveC, Python, Ruby, Swift, Php, CPlusPlus, C, Perl]
}
