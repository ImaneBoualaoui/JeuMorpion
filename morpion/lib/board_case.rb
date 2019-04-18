require 'pry'

class BoardCase
	attr_accessor :id, :symbol

	def initialize(symbol, position)
		@symbol = symbol # au départ on l'initialise à " " puis elle prendra la valeur "X" ou "O" selon le joueur
		@id = position #id correspond a la position dans le plateau de jeu
	end
end