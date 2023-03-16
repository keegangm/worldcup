#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# line break
echo -e "\n"

echo $($PSQL "TRUNCATE teams, games")

# line break
echo -e "\n"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS;
do
  # code to skip column header line in csv
  if [[ $ROUND != "round" ]]
  then
    # get winner team_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
 
    # if not found
    if [[ -z $WINNER_ID ]]
    # insert winner team
    then
      INSERT_WINNER_EVENT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    
      if [[ $INSERT_WINNER_EVENT == "INSERT 0 1" ]]
      then
        echo Inserted into teams: $WINNER
    fi 

  fi

  # repeat for opponent
    OPP_ID=$($PSQL "SELECT team_ID FROM teams WHERE name='$OPPONENT'")


    if [[ -z $OPP_ID ]]
    then
      INSERT_OPP_ID=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

      # log statement
      if [[ $INSERT_OPP_ID == "INSERT 0 1" ]]
      then
        echo Inserted into teams: $OPPONENT
      
      fi

    fi
  # get new team_id
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER' OR name='$OPPONENT'")

fi

done

# adding space between results for loops
echo -e "\n"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS;
do

  # lookup values for $WINNER_ID and $OPP_ID

  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  # code to skip column header line in csv
  if [[ $YEAR != "year" ]]
  then
    # get game_id
    
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR' AND round='$ROUND' AND winner_id='$WINNER_ID'")
    
    # if not found
    if [[ -z $GAME_ID ]]
    then
      # insert game
      INSERT_GAME_EVENT=$($PSQL "INSERT INTO games(year,round,winner_id, opponent_id, winner_goals,opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPP_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")

      echo Inserted $YEAR $ROUND game between $WINNER and $OPPONENT
    fi
    

   # echo $TEAMS
   # echo $GAMES
   # echo $OPP_ID
    

   




  
    #cat games_backup.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS;
    #do



    # games insert

    # game_id lookup
    #GAME_ID=$($PSQL "SELECT game_id FROM games WHERE winner_id='$WINNER_ID' AND round='$ROUND' AND year='$YEAR'")
    
    #echo $GAME_ID
    
    # insert game
    #if [[ -z $GAME_ID ]] 
    #then
    #  INSERT_GAME_ID=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPP_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
     # echo $INSERT_GAME_ID
      
    #       fi

    #  fi

    #  done

  fi

done 

# adding space after results
echo -e "\n"
