//
//  Question.swift
//  YouGuess
//
//  Created by c w on 2021/12/22.
//

import Foundation
import UIKit



class Question {
    var text:String
    
    var answer:Bool
    
    init(text:String, answer:Bool) {
        self.text = text
        self.answer = answer
    }
    
}


var questions = [
    Question(text: "question1", answer: true),
    Question(text: "question2", answer: true),
    Question(text: "question3", answer: true),
    Question(text: "question4", answer: true),
    Question(text: "question5", answer: true),
    Question(text: "question6", answer: true),
    Question(text: "question7", answer: true)
]
