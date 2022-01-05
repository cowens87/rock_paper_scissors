# night_writer

## Table of Contents
- [Overview](#overview)
- [Design Strategy](#design-strategy)
  - [English Translator](#english_translator-class)
  - [Braille Translator](#braille_translator-class)
  - [Translatable](#translatable-module)
  - [CLI](#cli)
- [Self-Assessment](#self-assessment)
  - [Functionality](#functionality)
  - [Object Oriented Programming](#object-oriented-programming)
  - [Ruby Conventions and Mechanics](#ruby-conventions-and-mechanics)
  - [Test Driven Development](#test-driven-development)

## Overview
The idea of Night Writing was first developed for Napoleon’s army so soldiers could communicate silently at night without light. The concept of night writing led to Louis Braille’s development of his Braille tactile writing system. While this project's scope is much smaller, it is capable of translating a text message from English to Braille by reading the characters in the `message.txt` file and writing the English word into the `braille.txt` file. This program also translates the same `braille.txt` file and writes to an `original_message.txt` file through the command line interface.

## Design Strategy
The design strategy of Night Writer was to fully encapsulate each piece of functionality of the program and use a module for access to the translation alphabet and the functionality to query it. The program uses the following structure:

### English Translator Class
The English Translator Class takes the data passed on from the night writer CLI and is responsible for the methods that translate the message to braille. It utilizes the methods from the Translatable Module to lookup English letters and return their Braille equivalents.

### Braille Translator Class
The Braille Translator Class takes the data passed on from the night reader CLI and is responsible for the methods that translate the message to braille. It utilizes the methods from the Translatable Module to lookup Braille characters and return their English letter equivalents.

### Translatable Module
Translatable contains all of the necessary methods which utilize the the alphabet to translate from English to Braille and vice versa. Additionally, it contains a stateful attribute the alphabet method. This module is utilized by both Braille Translator and English Translator.

### CLI
The command line interface works through the `night_writer.rb` and `night_reader.rb ` files. The files handle reading in the message, or translated files, respectfully, and writing the english or braille message into a new file. It also outputs a message to the screen.

***
## Self-Assessment
### Functionality
For my project, the Braille Translator and English Translator Classes includes translator methods that perform as expected. The night writer/reader CLIs are both outputting to the screen as expected as well. Unfortunately, I was unable to implement any of the extensions in iteration 4. My assessment: **3**

### Object Oriented Programming
The structure of the classes in my project are all encapsulated and have a single responsibility methods. The English Translator class specifically handles translating English letters to Braille and vice versa with the Braille Translator Class. Additionally, the Translatable module handles the querying of the alphabet and returning the character once found. All in all, I am please with my project class structure and how the code is organized. I went back and forth between using the alphabet as a class that the translators both inherited from, but ultimately decided on a module as they were both interacting with the alphabet in the same way and the translators aren't specific subclasses of the general alphabet. For this reason I felt a module worked best here.  My assessment: **3.5**

### Ruby Conventions and Mechanics
My program does have conventional syntax and naming structures. I would say that the majority of the enumerables utilized are the most efficient. I utilized hashes, purposeful methods such as split, and slice. I don't have any methods over 10 lines. My assessment: **3.5**

### Test Driven Development
I fully adhered to TDD throughout the project. It actually helped a ton when I was stuck with something! I've tested every line of code and have 100% coverage. My assessment: **3**
