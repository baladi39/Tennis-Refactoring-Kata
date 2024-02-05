import 'tennis_game.dart';

class TennisGame3 implements TennisGame {
  int player2Score = 0;
  int player1Score = 0;
  late String player1Name;
  late String player2Name;

  TennisGame3(String playerName1, String playerName2) {
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
    String winingPlayer;
    String score = '';
    List<String> pointsName = ['Love', 'Fifteen', 'Thirty', 'Forty'];
    if (isEndGame()) {
      score = pointsName[player1Score];
      return (player1Score == player2Score)
          ? '$score-All'
          : '$score-${pointsName[player2Score]}';
    } else {
      if (player1Score == player2Score) {
        return 'Deuce';
      }
      winingPlayer = player1Score > player2Score ? player1Name : player2Name;
      return (isAdvantage())
          ? 'Advantage $winingPlayer'
          : 'Win for $winingPlayer';
    }
  }

  bool isAdvantage() {
    return (player1Score - player2Score) * (player1Score - player2Score) == 1;
  }

  bool isEndGame() {
    return (player1Score < 4 &&
        player2Score < 4 &&
        !(player1Score + player2Score == 6));
  }
}
