//
//  ViewController.swift
//  Counter
//
//  Created by Александр Меркулов on 17.05.23.
//

import UIKit

class ViewController: UIViewController {
    private var score: Int = 0 {
        didSet {
            updateScoreLabel()
        }
    }
    private let textLabel: String = "Значение счетчика: "
    private var historyArray: [String] = [] {
        didSet {
            updateTextLabel()
        }
    }
    
    
    // outlet отображения счетчика
    @IBOutlet weak var scoreLabel: UILabel!
    // outlet отображения истории изменений
    @IBOutlet weak var historyText: UITextView!
    // outlet кнопки увеличения значения
    @IBOutlet weak var addButton: UIButton!
    // outlet кнопки уменьшения значения
    @IBOutlet weak var subtractButton: UIButton!
    // outlet кнопки сброса значения
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: LABEL счетчик
        // Округление краев lable
        scoreLabel.layer.cornerRadius = 10
        scoreLabel.clipsToBounds = true
        // Добавление форматированного текста по умолчанию в scoreLabel
        scoreLabel.attributedText = changeApperanceScore(for: textLabel + "\(score)")

        
        //MARK: TextView история изменений
        //Округление краев textField
        historyText.layer.cornerRadius = 10
        historyText.clipsToBounds = true
        // Добавление текста по умолчанию в historyText
        historyArray.append("История изменений:")
        
        
        
        //MARK: КНОПКИ
        // изменение внешнего вида у кнопок увеличения, уменьшения и сброса значения
        changeApperanceButton(for: addButton)
        changeApperanceButton(for: subtractButton)
        changeApperanceButton(for: resetButton)
        
    }
    
    //MARK: action на кнопки
    @IBAction func addScoreButton(_ sender: Any) {
        score += 1
        historyArray.append("[\(currentDate())]: значение изменено на +1")
    }
    
    @IBAction func subtractScoreButton(_ sender: Any) {
        if score == 0 {
            historyArray.append("[\(currentDate())]: попытка уменьшить значение счётчика ниже 0")
        } else {
            score -= 1
            historyArray.append("[\(currentDate())]: значение изменено на -1")
        }
    }
    
    @IBAction func resetScoreButton(_ sender: Any) {
        score = 0
        historyArray.append("[\(currentDate())]: значение сброшено")
    }
    
    
    //MARK: метод для изменения отображения кнопки (размер текста, округление формы)
    private func changeApperanceButton(for button: UIButton!) {
        // округление граний у кнопок
        button.layer.cornerRadius = 20
        // Добавление тени к кнопке
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4
        button.layer.masksToBounds = false
    }
    
    //MARK: метод для выделения "score" жирным и увеличения size font
    private func changeApperanceScore(for text: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: text)
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 22)
        ]
        let scoreRange = NSRange(location: textLabel.count, length: "\(score)".count)
        attributedText.addAttributes(boldAttributes, range: scoreRange)
        return attributedText
    }
    
    //MARK: метод обновления scoreLable
    private func updateScoreLabel() {
        scoreLabel.attributedText = changeApperanceScore(for: textLabel + "\(score)")
    }
    
    //MARK: метод обновления historyText
    private func updateTextLabel() {
        let historyString = historyArray.joined(separator: "\n")
        historyText.text = historyString
    }
    
    //MARK: метод редактирования формата даты и времени
    private func currentDate() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let formattedDate = dateFormatter.string(from: currentDate)
        return formattedDate
    }
}

