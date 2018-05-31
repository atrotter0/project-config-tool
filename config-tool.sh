#!/bin/bash
# A Bash script to configure the git pairs file and construct basic project structure.

# Prompt and set up git pairs file
echo Do you need to set up your git pairs file? Enter y/n
read input

if [ $input == "yes" ] || [ $input == "y" ] || [ $input == "Y" ]
then
  # Get user 1 data
  echo Enter first pair initials, first name, last name, and email with spaces between each value.
  echo example: fb Frodo Baggins frodo@shire.com
  read user1Initials user1FirstName user1LastName user1Email

  # Get user 2 data
  echo Enter second pair initials, first name, last name, and email with spaces between each value.
  echo example: sg Samwise Gamgee sam@shire.com
  read user2Initials user2FirstName user2LastName user2Email

  echo Creating git pairs file...

  # Build pairs file
  cd
  touch .pairs
  echo 'pairs:' >> .pairs
  echo "  $user1Initials: $user1FirstName $user1LastName" >> .pairs
  echo "  $user2Initials: $user2FirstName $user2LastName" >> .pairs
  echo 'email:' >> .pairs
  echo "  $user1Initials: $user1Email" >> .pairs
  echo "  $user2Initials: $user2Email" >> .pairs

  echo Process complete! Git pairs file created!
fi

# Prompt and build project
echo Do you want to create a new project? Enter y/n
read input

if [ $input == "yes" ] || [ $input == "y" ] || [ $input == "Y" ]
then
  # Set up project directory
  echo Please enter the name of the directory you want to create:
  read directoryName

  echo Creating directory $directoryName and building project...

  # Build project
  cd
  cd Desktop
  mkdir $directoryName
  cd $directoryName
  touch index.html
  mkdir css js
  touch css/styles.css js/scripts.js
  touch README.md

  # Initialize git
  git init
  sleep 2
  git pair $user1Initials $user2Initials

  # Navigate to and open project in finder
  cd ..
  open $directoryName
  echo Process complete! Your project has been created!
else
  echo Goodbye!
fi
