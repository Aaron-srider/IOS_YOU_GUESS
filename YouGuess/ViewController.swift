//
//  ViewController.swift
//  YouGuess
//
//  Created by c w on 2021/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var scoreLabel: UILabel = {
        
        let score = UILabel()
        
        score.text = "YOUR SCORE: 87"
        
        score.textAlignment = .center
        
        score.font = UIFont.systemFont(ofSize: 22)
       
        view.addSubview(score)
        
        score.translatesAutoresizingMaskIntoConstraints = false
        
        return score
    }()
    
    lazy var questionLabel: UILabel = {
        var question = UILabel()
        
        question.text = "question: xxxxxxxxxxxxxxxxx"
        
        question.textAlignment = .center
        
        question.numberOfLines = 0
    
        question.font = UIFont.systemFont(ofSize: 30)
       
        view.addSubview(question)
        
        question.translatesAutoresizingMaskIntoConstraints = false
        
        return question
    }()
    
    lazy var btnGroupStack: UIStackView = {
        let btnGroupStack   = UIStackView()
        btnGroupStack.axis  = NSLayoutConstraint.Axis.horizontal
        btnGroupStack.distribution  = UIStackView.Distribution.fillEqually
        btnGroupStack.alignment = UIStackView.Alignment.center
        btnGroupStack.spacing   = 16.0
//        btnGroupStack.backgroundColor = .gray
        
        btnGroupStack.addArrangedSubview(correctBtn)
        btnGroupStack.addArrangedSubview(uncorrectBtn)
        
        btnGroupStack.translatesAutoresizingMaskIntoConstraints = false
      
        view.addSubview(btnGroupStack)
        
        return btnGroupStack
    }()
    
    lazy var correctBtn: UIButton = {
        
          var correct = UIButton(type: .custom)
          
          correct.setTitle("正确", for: .normal)
          
          correct.backgroundColor = .green
        
          correct.addTarget(self, action:#selector(self.press_correct), for: .touchUpInside)
         
          correct.translatesAutoresizingMaskIntoConstraints = false
        
        return correct
          
    }()
    
    lazy var uncorrectBtn: UIButton = {
        
         
        var uncorrect = UIButton(type: .custom)
        
        uncorrect.setTitle("错误", for: .normal)
        
        uncorrect.backgroundColor = .red
        
        uncorrect.addTarget(self, action:#selector(self.press_uncorrect), for: .touchUpInside)
       
        uncorrect.translatesAutoresizingMaskIntoConstraints = false
        
        return uncorrect
          
    }()
    

    lazy var progress_bar: UIView = {
        
         
        var progress_bar = UIView()

        progress_bar.backgroundColor = .yellow
        
        progress_bar.translatesAutoresizingMaskIntoConstraints = false;
        
      
        return progress_bar
          
    }()
    
    
    lazy var progress_text: UILabel = {
   
        var progress_text = UILabel()
        
        progress_text.text = "-/-"
        
        progress_text.font = UIFont.systemFont(ofSize: 16)
        
        progress_text.backgroundColor = .white

        progress_text.translatesAutoresizingMaskIntoConstraints = false
        return progress_text
          
    }()
    
    
    lazy var progress_stack: UIStackView = {
        
        let progress_stack   = UIStackView()
        progress_stack.axis  = NSLayoutConstraint.Axis.vertical
        progress_stack.distribution  = UIStackView.Distribution.fill
        progress_stack.alignment = UIStackView.Alignment.leading
        progress_stack.spacing   = 0
        progress_stack.backgroundColor = .white
        
        
        progress_stack.addArrangedSubview(progress_text)
        progress_stack.addArrangedSubview(progress_bar)

        
        progress_stack.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(progress_stack)
        
        return progress_stack
          
    }()


    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
//        let req = URLRequest(url: URL(string: "https://api.qimai.cn/rank/indexPlus/brand_id/0?analysis=dUcXR1deWx9ZXlRVG2dfQBcXV0RRXlRvWVQfU3cQBFYNBQQJAwIFCQUFIxQC")!)
//
//        URLSession.shared.dataTask(with: req, completionHandler: {
//            [weak self] data, resp, _ in
//            guard let self = self else { return }
//
//            let dataToString = String(describing: String.init(data: data!, encoding: .utf8))
//
//            print(dataToString)
//
//            DispatchQueue.main.async {
//                self.scoreLabel.text = dataToString
//                print("hello1")
//            }
//
//            DispatchQueue.main.async {
//                self.scoreLabel.text = dataToString
//                print("hello2")
//            }
//
//
//        }).resume()
        
        initConstraints()
        
        scoreLabel.text = "Your Score: 0"
        
        
        questionLabel.text = questions[0].text
        
        progress_text.text = "1/\(questions.count)"
    }
    
    var cons:NSLayoutConstraint?
    
    func initConstraints() {
        cons = progress_bar.widthAnchor.constraint(equalToConstant:  view.frame.width*1/CGFloat(questions.count))
        cons?.isActive = true
        
        progress_bar.heightAnchor.constraint(equalToConstant: 20).isActive = true
        

        progress_stack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        progress_stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
 
        scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scoreLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        
        questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        questionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        btnGroupStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnGroupStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        
    
        scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        scoreLabel.bottomAnchor.constraint(equalTo: questionLabel.topAnchor, constant: -10).isActive = true
        
        questionLabel.bottomAnchor.constraint(equalTo: btnGroupStack.topAnchor, constant: -10).isActive = true
        
        btnGroupStack.bottomAnchor.constraint(equalTo: progress_stack.topAnchor, constant: -10).isActive = true
        
        btnGroupStack.heightAnchor.constraint(equalTo: questionLabel.heightAnchor).isActive = true
        
        questionLabel.heightAnchor.constraint(equalTo: scoreLabel.heightAnchor).isActive = true
    }
 
    var score:Int
    
    var current_question_index:Int
    
    var right_count: Int
    
    init() {
        self.score = 0
        self.current_question_index = 0
        self.right_count = 0
        super.init(nibName: nil, bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func press_correct(sender: UIButton!) {
        
    
        if(questions[current_question_index].answer) {
            right_count += 1
            score = right_count*100 / questions.count
        } else {
            score = right_count / questions.count * 100
        }
        
        scoreLabel.text = "Your Score: \(score)"
        
        current_question_index += 1
        if(current_question_index == questions.count) {
            
            questionLabel.text = "问题已完成"
            
            var viewConstroller = UIAlertController(title: "游戏结束", message: "您的最终得分：\(score)", preferredStyle: .alert)
//            viewConstroller.view.backgroundColor = .yellow
           
            viewConstroller.addAction(UIAlertAction(title: "重新开始", style: .default, handler: {
                [self] _ in

                
                score = 0
                current_question_index = 0
                right_count = 0
                scoreLabel.text = "Your Score: 0"
                questionLabel.text = questions[0].text
                
                progress_text.text = "1/\(questions.count)"
                
                cons?.constant = view.frame.width * 1 / CGFloat(questions.count)
           
                
            }))
            
            viewConstroller.addAction(UIAlertAction(title: "重新开始", style: .default, handler: {
                _ in

                exit(1)
           
                
            }))
            
            self.present(viewConstroller, animated: true, completion: {
                
            })
            return
        
        }
        
        questionLabel.text = questions[current_question_index].text
        
        progress_text.text = "\(current_question_index + 1)/\(questions.count)"
    
        cons?.constant = view.frame.width*CGFloat(current_question_index + 1)/CGFloat(questions.count)
        
    }
    
    @objc func press_uncorrect(sender: UIButton!) {
        if(questions[current_question_index].answer == false) {
            right_count += 1
            score = right_count*100 / questions.count
        } else {
            score = right_count*100 / questions.count
        }
        
        scoreLabel.text = "Your Score: \(score)"
        
        current_question_index += 1
        
        if(current_question_index == questions.count) {
            
            questionLabel.text = "问题已完成"
            
            var viewConstroller = UIAlertController(title: "游戏结束", message: "您的最终得分：\(score)", preferredStyle: .alert)
//            viewConstroller.view.backgroundColor = .yellow
           
            viewConstroller.addAction(UIAlertAction(title: "重新开始", style: .default, handler: {
                [self] _ in

                
                score = 0
                current_question_index = 0
                right_count = 0
                scoreLabel.text = "Your Score: 0"
                questionLabel.text = questions[0].text
                
                progress_text.text = "1/\(questions.count)"
                
                cons?.constant = view.frame.width * 1 / CGFloat(questions.count)
           
                
            }))
            
            self.present(viewConstroller, animated: true, completion: {
                
            })
            return
        
        }
        
        questionLabel.text = questions[current_question_index].text
        
        progress_text.text = "\(current_question_index + 1)/\(questions.count)"
    
        cons?.constant = view.frame.width*CGFloat(current_question_index + 1)/CGFloat(questions.count)
    }


}

