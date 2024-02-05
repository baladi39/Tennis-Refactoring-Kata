import 'dart:core';

import 'tennis_game.dart';

class TennisGame1 implements TennisGame {
  int player1Score = 0;
  int player2Score = 0;
  late String player1Name;
  late String player2Name;

  TennisGame1(String playerName1, String playerName2) {
    player1Name = playerName1;
    player2Name = playerName2;
  }

  @override
  void wonPoint(String playerName) {
    if (playerName == 'player1') {
      player1Score += 1;
    } else {
      player2Score += 1;
    }
  }

  @override
  String getScore() {
    String score = '';

    var isGameTie = player1Score == player2Score;
    var isLongGame = player1Score >= 4 || player2Score >= 4;

    if (isGameTie) {
      score = getEqualePointsScore(score);
    } else if (isLongGame) {
      score = getAdvOrWinPlayer(score);
    } else {
      score = getShortGameScore(score);
    }
    return score;
  }

  String getShortGameScore(String score) {
    return score =
        '${getScoreName(player1Score)}-${getScoreName(player2Score)}';
  }

  String getAdvOrWinPlayer(String score) {
    int minusResult = player1Score - player2Score;

    switch (minusResult) {
      case 1:
        score = 'Advantage $player1Name';
        break;
      case -1:
        score = 'Advantage $player2Name';
        break;
      case >= 2:
        score = 'Win for $player1Name';
        break;
      default:
        score = 'Win for $player2Name';
    }

    return score;
  }

  String getEqualePointsScore(String score) {
    switch (player1Score) {
      case 0:
        score = '${getScoreName(player1Score)}-All';
        break;
      case 1:
        score = '${getScoreName(player1Score)}-All';
        break;
      case 2:
        score = '${getScoreName(player1Score)}-All';
        break;
      default:
        score = 'Deuce';
        break;
    }
    return score;
  }
}

String getScoreName(int score) {
  switch (score) {
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
