require 'pry'
require_relative 'game'
require 'colorize'

class Application

	attr_accessor :player1, :player2

	def initialize
		system "clear"
        puts "Bienvenue dans notre jeu Joueur 1"
        puts "Veuillez renseignez votre nom"
        print "> "

        #On stock le joueur 1 dans une variable
        @player1 = gets.chomp

        puts "Bienvenue dans notre jeu Joueur 2"
        puts "Veuillez renseignez votre nom"
        print "> "
        #On stocke le joueur 2 dans une variable
        @player2 = gets.chomp

        #On instancie un nouveau jeu appelé game
        @game = Game.new(@player1, @player2)

        #On clean le terminal pour lancer le jeu proprement
        system "clear"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Bienvenue #{@player1} et #{@player2}. Notre partie peut commencer"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
       
	end


	def perform

		#AFFICHAGE DU PLATEAU VIDE DANS UN PREMIER TEMPS
		@game.show

    	while true
			#ON COMMENCE AVEC LE JOUEUR 1

            puts "C'est à toi de jouer #{@player1}"
            puts "Choisis ta case : "
            print ">"

            #on récupère le choix du joueur 1
            case_choice = gets.chomp 

            #On ne conserve la réponse de l'utilisateur que si elle passe le check_choice
            while true
                if @game.check_choice(case_choice) == true
                   	break
           	    else #sinon on lui demande de choisir une nouvelle case
           	    	puts "Cette case n'est pas valide, elle est soit déjà remplite soit hors du plateau".yellow
           	    	puts "Choisis une nouvelle case sur le plateau".yellow
           	    	print ">".yellow
                  	case_choice = gets.chomp 
                end
            end


           # Si la résponse est correcte on remplit la case avec une "X"
            @game.turn_player1(case_choice)
           
            # On vérifie s'il y a un gagnant
            #Si oui on stop le jeu
            #Si non on passe au joueur suivant
            winner = @game.winner
                if winner == true  
                    puts "VOUS AVEZ GAGNÉ #{@player1.red} !!!!"
                break
                end

            #Si au 9 eme coup joué , il n'ya pas de gagnant, on break et on affiche Match Nul 
            if Game.game_count>=9
                puts "Match Nul...."
                break
            end

#===================================================================================================               
			#ON PASSE AU JOUEUR 2

            puts "C'est à toi de jouer #{@player2}"
            puts "Choisis ta case : "
            print ">"

            #On récupère le choix du joueur 2
            case_choice = gets.chomp 

            #On ne conserve la réponse de l'utilisateur que si elle passe le check_choice
            while true
                if @game.check_choice(case_choice) == true
                   	break
           	    else #sinon on lui demande de choisir une nouvelle case
           	    	puts "Cette case n'est pas valide, elle est soit déjà remplite soit hors du plateau".yellow
           	    	puts "Choisis une nouvelle case sur le plateau".yellow
           	    	print ">".yellow
                  	case_choice = gets.chomp 
                end
            end
            
            # Si la résponse est correcte on remplit la case avec un "O"
            @game.turn_player2(case_choice)
           

            # On vérifie s'il y a un gagnant
            #Si oui on stop le jeu
            #Si non on passe au premier joueur
            winner = @game.winner
                if winner == true 
                    then puts "VOUS AVEZ GAGNÉ #{@player2.green} !!!!"
                    break
                end
        end 



#===========================Rejouer une Partie===========================================
        while @game.new_round == true
        	while true
				#ON COMMENCE AVEC LE JOUEUR 1

            	puts "C'est à toi de jouer #{@player1}"
            	puts "Choisis ta case : "
            	print ">"

	            #on récupère le choix du joueur 1
	            case_choice = gets.chomp 

	            #On ne conserve la réponse de l'utilisateur que si elle passe le check_choice
	            while true
	                if @game.check_choice(case_choice) == true
	                   	break
	           	    else #sinon on lui demande de choisir une nouvelle case
	           	    	puts "Cette case n'est pas valide, elle est soit déjà remplite soit hors du plateau".yellow
	           	    	puts "Choisis une nouvelle case sur le plateau".yellow
	           	    	print ">".yellow
	                  	case_choice = gets.chomp 
	                end
	            end


	           # Si la résponse est correcte on remplit la case avec une "X"
	            @game.turn_player1(case_choice)
	           
	            # On vérifie s'il y a un gagnant
	            #Si oui on stop le jeu
	            #Si non on passe au joueur suivant
	            winner = @game.winner
	                if winner == true  
	                    puts "VOUS AVEZ GAGNÉ #{@player1.red} !!!!"
	                break
	                end

	            #Si au 9 eme coup joué , il n'ya pas de gagnant, on break et on affiche Match Nul 
	            if Game.game_count>=9
	                puts "Match Nul..."
	                break
	            end
#===================================================================================================               
				#On PASSE AU JOUEUR 2

	            puts "C'est à toi de jouer #{@player2}"
	            puts "Choisis ta case : "
	            print ">"

	            #On récupère le choix du joueur 2
	            case_choice = gets.chomp 

	            #On ne conserve la réponse de l'utilisateur que si elle passe le check_choice
	            while true
	                if @game.check_choice(case_choice) == true
	                   	break
	           	    else #sinon on lui demande de choisir une nouvelle case
	           	    	puts "Cette case n'est pas valide, elle est soit déjà remplite soit hors du plateau".yellow
	           	    	puts "Choisis une nouvelle case sur le plateau".yellow
	           	    	print ">".yellow
	                  	case_choice = gets.chomp 
	                end
	            end
	            
	            # Si la résponse est correcte on remplit la case avec un "O"
	            @game.turn_player2(case_choice)
	           

	            # On vérifie s'il y a un gagnant
	            #Si oui on stop le jeu
	            #Si non on passe au premier joueur
	            winner = @game.winner
	                if winner == true 
	                    then puts "VOUS AVEZ GAGNÉ #{@player2.green} !!!!"
	                    break
	                end
        	end 
        	
        end 

        puts "C'est la fin du jeu Salut !!"
    end
end