#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

ENTER_USER() {

if [[ $1 ]]
then
  echo "$1"
fi

echo "Enter your username:"
read USERNAME


if [[ -z $USERNAME ]]
then
  ENTER_USER "Please enter a username"
fi

CHECK_USER_EXIST=$($PSQL "SELECT username FROM number_guess WHERE username='$USERNAME'")

if [[ -z $CHECK_USER_EXIST ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO number_guess(username) VALUES('$USERNAME')")
fi
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."


GAMES_PLAYED=$GAMES_PLAYED+1
UPDATE_GAMES=$($PSQL "UPDATE number_guess SET games_played=$GAMES_PLAYED")

GUESSING_GAME_INIT

}

GUESSING_GAME_INIT() {

COUNTER=0

if [[ $BEST_GAME = 0 ]]
then
  BEST_GAME=9999
fi

RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))

echo -e "\nGuess the secret number between 1 and 1000:"

read GUESS

CHECK_VALID_GUESS $GUESS

}

CHECK_VALID_GUESS() {

((COUNTER++))


if [[ -z $1 ]]
then
  GUESSING_GAME_LOOP "That is not an integer, guess again:"
fi

RE='^[0-9]+$'

if ! [[ $1 =~ $RE ]]
then
  GUESSING_GAME_LOOP "That is not an integer, guess again:"
fi

if [[ $RANDOM_NUMBER = $1 ]]
then
  echo "You guessed it in $COUNTER tries. The secret number was $RANDOM_NUMBER. Nice job!"
  INSERT_GAME_INFO
  exit
elif [[ $RANDOM_NUMBER -lt $1 ]]
then
  GUESSING_GAME_LOOP "It's lower than that, guess again:"
else
  GUESSING_GAME_LOOP "It's higher than that, guess again:"
fi


}

GUESSING_GAME_LOOP() {

  echo $1
  
  read GUESS

  CHECK_VALID_GUESS $GUESS

}

INSERT_GAME_INFO() {


  if [[ $COUNTER -lt $BEST_GAME ]]
  then
    UPDATE_BEST_GAME=$($PSQL "UPDATE number_guess SET best_game=$COUNTER WHERE username='$USERNAME'")
  fi

}




ENTER_USER