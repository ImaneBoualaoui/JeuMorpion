require 'pry'
require_relative 'board_case'
require_relative 'player'

class Board
	attr_accessor :case_array

	def initialize
		a1 = BoardCase.new(" ", "a1")
		a2 = BoardCase.new(" ", "a2")
		a3 = BoardCase.new(" ", "a3")
		b1 = BoardCase.new(" ", "b1")
		b2 = BoardCase.new(" ", "b2")
		b3 = BoardCase.new(" ", "b3")
		c1 = BoardCase.new(" ", "c1")
		c2 = BoardCase.new(" ", "c2")
		c3 = BoardCase.new(" ", "c3")

		@case_array = [a1, a2, a3, b1, b2, b3, c1, c2, c3]

	end

	#le joueur joue, et donc change le plateau
	def turn_player(choice, symbol)#choice = au choix de la case du joueur et symbol = au symbole du joeur

		@case_array.each do |case_choice|
			if case_choice.id == choice
				case_choice.symbol = symbol
			end	
		end
	end

	#méthode permettant de vérifier si la case choisis par le joueur est :
	#1 : bien dans le plateau de jeu et non en dehors => exemple saisir c4 : false
	#2 : vérifier que la case choisis n'est pas déjà remplit par un symbol
	def check_case(choice)

		@case_array.each do |case_choice |
			if case_choice.id == choice && case_choice.symbol == " "
				return true
			end
		end

		return false
	end

	#On vérifie si le joueur à gagner (avec les différente possibilité pour gagner)
	def winner
		#toute la 1er ligne remplite par le mm symbole
		if @case_array[0].symbol != " " && @case_array[0].symbol == @case_array[1].symbol && @case_array[1].symbol == @case_array[2].symbol
			return true
		#toute la 2eme ligne
		elsif @case_array[3].symbol != " " && @case_array[3].symbol == @case_array[4].symbol && @case_array[4].symbol == @case_array[5].symbol
			return true
		#la 3eme ligne
		elsif @case_array[6].symbol != " " && @case_array[6].symbol == @case_array[7].symbol && @case_array[7].symbol == @case_array[8].symbol 
			return true
		#la diagonale en partant en haut à gauche
		elsif@case_array[0].symbol != " " && @case_array[0].symbol == @case_array[4].symbol && @case_array[4].symbol == @case_array[8].symbol 
			return true
		#la diagonale en partant en haut à drroite
		elsif @case_array[2].symbol != " " && @case_array[2].symbol == @case_array[4].symbol && @case_array[4].symbol == @case_array[6].symbol 
			return true
		#toute la 1ere colone
		elsif @case_array[0].symbol != " " && @case_array[0].symbol == @case_array[3].symbol && @case_array[3].symbol == @case_array[6].symbol 
			return true
		#toute la 2eme colone
		elsif @case_array[1].symbol != " " && @case_array[1].symbol == @case_array[4].symbol && @case_array[4].symbol == @case_array[7].symbol 
			return true
		#toute la 3eme colone
		elsif @case_array[2].symbol != " " && @case_array[2].symbol == @case_array[5].symbol && @case_array[5].symbol == @case_array[8].symbol
			return true	
		else 
			return false
		end
	end

	#PERMET D'AFFICHER LE PLATEAU DE JEU 
	def show_board
    	puts "-"*16
    	puts "| #{@case_array[0].symbol}  | #{@case_array[1].symbol}  | #{@case_array[2].symbol}  |"
    	puts "-"*16
    	puts "| #{@case_array[3].symbol}  | #{@case_array[4].symbol}  | #{@case_array[5].symbol}  |"
    	puts "-"*16
    	puts "| #{@case_array[6].symbol}  | #{@case_array[7].symbol}  | #{@case_array[8].symbol}  |"
    	puts "-"*16
	end

end