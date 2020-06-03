//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать массив с ответами на этот экран
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавится от кнопки back
    
    @IBOutlet var resultEmojiLabel: UILabel!
    @IBOutlet var resultTextLabel: UILabel!
    
    var resultSurvey: [Answer] = []
    var resultAnimal: AnimalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        result()
    }

    func result() {
        sortAnswers(resultSurvey)
        resultEmojiLabel.text = "Вы - \(resultAnimal.rawValue)"
        resultTextLabel.text = resultAnimal.definition
    }
    
    func sortAnswers(_: Array<Answer>) -> AnimalType {
        resultAnimal = Dictionary(grouping: resultSurvey, by: { $0.type })
            .sorted(by: {$0.value.count > $1.value.count})
            .first?.key
        return resultAnimal
    }
}
