//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnswerLabel: UILabel!
    
    @IBOutlet var resultDescriprionLabel: UILabel!
    
     var answersChosen: [Answer]!

     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateTypesResult()
        navigationItem.hidesBackButton = true

    }
    func calculateTypesResult() {
        var showAnswers: [Animal: Int] = [:]
        
        let showTypes = answersChosen.map { $0.animal }
        
        for response in showTypes {
            showAnswers[response] = (showAnswers[response] ?? 0) + 1
        }
        
        let sortedAnswer = showAnswers.sorted(by:
        {(pairOne, pairTwo) -> Bool in
            return pairOne.value > pairTwo.value
        })
        
       
        let oftenShowAnimal = sortedAnswer.first!.key
        
       
        resultAnswerLabel.text = "Вы - \(oftenShowAnimal.rawValue)!"
        resultDescriprionLabel.text = oftenShowAnimal.definition
        
    }
   
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit {
        print("ResultViewController has been deallocated")
    }


}
