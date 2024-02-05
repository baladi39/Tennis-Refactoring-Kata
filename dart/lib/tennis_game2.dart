import 'dart:core';
import 'dart:math';

import 'tennis_game.dart';

class TennisGame2 implements TennisGame {
  int player1Points = 0;
  int player2Points = 0;

  String player1Result = '';
  String player2Result = '';
  late String player1Name;
  late String player2Name;

  TennisGame2(String playerName1, String playerName2) {
    player1Name = playerName1;
    player2Name = playerName2;
  }

  @override
  void wonPoint(String player) {
    if (player == 'player1') {
      player1Points++;
    } else {
      player2Points++;
    }
  }

  @override
  String getScore() {
    String score = '';

    //Tie
    if (player1Points == player2Points) {
      switch (player1Points) {
        case 0:
          score = 'Love-All';
          break;
        case 1:
          score = 'Fifteen-All';
          break;
        case 2:
          score = 'Thirty-All';
          break;
        default:
          score = 'Deuce';
      }
      return score;
    }

    // If one player scored all points
    if (isPlayerDominate()) {
      var highestScore = max(player1Points, player2Points);

      if (highestScore < 4) {
        var scoreName = getScoreName(highestScore);

        if (player1Points == 0) {
          player1Result = 'Love';
          player2Result = scoreName;
        } else {
          player1Result = scoreName;
          player2Result = 'Love';
        }

        return score = '$player1Result-$player2Result';
      } else {
        if (player1Points == 0) {
          return score = 'Win for $player2Name';
        } else {
          return score = 'Win for $player1Name';
        }
      }
    }

    // Game in progess
    if (isGameInPorgress()) {
      if (player1Points >= 4) {
        return score = 'Win for $player1Name';
      }
      if (player2Points >= 4) {
        return score = 'Win for $player2Name';
      }

      player1Result = getScoreName(player1Points);
      player2Result = getScoreName(player2Points);
      return score = '$player1Result-$player2Result';
    }

    // Player won
    if ((player1Points - player2Points).abs() >= 2) {
      if ((player1Points - player2Points) > 0)
        return score = 'Win for $player1Name';
      else
        return score = 'Win for $player2Name';
    }

    // Player adv
    if (player2Points > player1Points) {
      return score = 'Advantage $player2Name';
    }
    return score = 'Advantage $player1Name';
  }

  bool isPlayerDominate() {
    return (player1Points == 0 || player2Points == 0);
  }

  bool isGameInPorgress() => ((player1Points + player2Points) <= 5);

  String getScoreName(int totalScore) {
    switch (totalScore) {
      case 0:
        return 'Love';
      case 1:
        return 'Fifteen';
      case 2:
        return 'Thirty';
      case 3:
        return 'Forty';
      default:
        return '';
    }
  }
}
