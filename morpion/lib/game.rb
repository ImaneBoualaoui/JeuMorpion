require 'pry'
require_relative 'player'
require_relative 'board'
require_relative 'board_case'
require 'colorize'

class Game

  attr_accessor :board, :player1, :player2 #varaible d'instance
  @@game_count #variable de classe

  def initialize(name1, name2)
  
    @player1 = Player.new(name1, "X".red)
    @player2 = Player.new(name2, "O".green)

    @board = Board.new

    @@game_count = 0 #permet de déterminer si on a eu un match nul ou pas => si au bout de 9 coups pas de gagnant

  end

  #le joueur 1 joue son tour
  def turn_player1(choice)

    #on fait jouer le joueur
    @board.turn_player(choice, @player1.symbol)

    #on réaffiche le plateau avec la mise à jour
    @board.show_board 

    #on rajoute +1 game_count à chaque tour jouer
    @@game_count +=1 
  end

  #le joueur 2 joue son tour
  def turn_player2(choice)
    #on fait jouer le joueur
    @board.turn_player(choice, @player2.symbol) 

    #on réaffiche le plateau avec la mise à jour
    @board.show_board  

    #on rajoute +1 game_count à chaque tour jouer
    @@game_count +=1
    
  end

  #On vérifie la validité de la réponse des joueurs dans le Board
  #Si la réponse est non conforme, on lui envoi un message depuis la view
  def check_choice(choice_case)
    if @board.check_case(choice_case) == false
      return false
    else 
      return true
    end
  end

  #Me permet d'afficher le plateau vide dans un premier temps dans la classe application
  def show
    @board.show_board
  end

  #Pour pouvoir faire appel à la méthode winner dans la classe Application
  def winner
    @board.winner
  end

  #Méthode de classe pour savoir le nombre de coup jouer dans la partie
  def self.game_count
    return @@game_count
  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
    puts "Voulez-vous refaire une partie ? Entré oui/non"
    print ">"
    choice = gets.chomp

    if choice == "oui"
      @board = Board.new
      @@game_count = 0
      return true
    else 
      return false
    end

  end

end 