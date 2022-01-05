# Enigma
<img src="https://i.ibb.co/wdn4yRv/encrypting.gif" alt="encrypting">

## Table of Contents
- [Overview](#overview)
- [Design Strategy](#design-strategy)
  - [Enigma](#enigma-class)
  - [Encryptor](#encryptor-class)
  - [Decryptor](#decryptor-class)
  - [Shiftable](#shiftable-module)
  - [CLI](#cli)
- [Self-Assessment](#self-assessment)
  - [Functionality](#functionality)
  - [Object Oriented Programming](#object-oriented-programming)
  - [Ruby Conventions and Mechanics](#ruby-conventions-and-mechanics)
  - [Test Driven Development](#test-driven-development)
  - [Version Control](#version-control)

***
## Overview
Enigma is inspired by Alan Turing, the mathematician who cracked the Enigma code. Enigma was a type of enciphering machine used by the German armed forces to send secure messages. While this project's scope is much smaller, it is capable of encrypting a text message by reading in the `message.txt` file and writing the encrypted message into the `encrypted.txt` file. This progam also decrypts the same `encrypted.txt` file and writes to a `decrypted.txt` file through the command interface. *Unfortunately, no Nazis were harmed in the making of Enigma.*

***
## Design Strategy
The design strategy of Engima was to fully encapsulate each piece of functionality of the progam and use a module for the shift generation functionality, including key generation and today's date generation. The program uses this structure:
<img src="https://i.ibb.co/wycyYsH/Enigma.png" alt="Enigma">

### Enigma Class
The Enigma Class is responsible for creating the Encryptor and Decryptor objects, which process the actual encryption and decryption of the message and ciphertext. This Class holds the message, key (generated, or provided) and date (today's date, or provided) as attributes, which it passes into the encryptor/decryptor objects. This is the Class utilized in the runner files for encrypt and decrypt.

### Encryptor Class
The Encryptor Class takes the data passed on from the Enigma Class and is responsible for the specific methods which actually encrypt the message. It utilizes the methods from the Shiftable Module to generate the shifts based on the key and date provided through the Enigma Class.

### Decryptor Class
The Decryptor Class is similar to the Encryptor Class. It takes the data passed on from the Enigma Class and is responsible for the specific methods which decrypt the cipher text the Encryptor generates. It utilizes the methods from the Shiftable Module to generate the shifts based on the key and date provided through the Enigma Class.

### Shiftable Module
Shiftable contains all of the necessary methods which utilize the key and date to set the key shifts, offset shifts and total shifts. This module is used as a mixin in Enigma, Encryptor and Decryptor.

### CLI
The command line interface works through the `encrypt.rb` and `decrypt.rb ` files. The files handle reading in the message, or encrypted files, respectfully, and writing the encrypted or decrypted text into a new file. It also outputs a message to the screen.

***
<img src="https://i.ibb.co/V0y6yTb/catkey.gif" alt="catkey">
