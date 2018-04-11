import Foundation

protocol Game {
  var round: Int { get }
  var target: Int { get }
  var score: Score { get }
  
  func newRound()
  func hit(_ value: Int) -> Score
}

class BullsEye: Game {
  var round = 1
  var target = 100
  var score = Score(0)
  var scoreCalculator = ScoreCalculator()
  
  init() {
    target = generateRandomNumber()
  }
  
  func newRound() {
    round += 1
    target = generateRandomNumber()
  }
  
  func hit(_ value: Int) -> Score {
    print("Target: \(target)")
    print("Value: \(value)")
    let score = scoreCalculator.calculate(target: target, hit: value)
    self.score = self.score + score
    return score
  }

  private func generateRandomNumber() -> Int {
    var randomTarget = target
    
    while randomTarget == target {
      randomTarget = 1 + Int(arc4random_uniform(100))
    }
    
    return randomTarget
  }
}
