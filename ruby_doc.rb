candies = ["Sour patch kid", "Milky Way", "Airheads"]

candies.each do |candy|
    puts "I love #{candy}"
end

names.each {|candie| puts candie.upcase}

shirt = ["blue", "shoes", "Billabong"]
ties = ["Orange", "sans", "manger"]

shirt.each do |shirt|
ties.each do |tie|
    puts "J'ai une chemise #{shirt} et une cravate #{tie}"
end
end

rng = 1..10 # de 1 à 10

colors = ["blue", "orange", "yellow", "Majenta"]

colors.each_with_index do |color, index| #Variables temporaires
    puts "La couleur #{color} est à l'index du tableau: #{index}"
end

power_ranger = [
    [:red, "Jason"], [:black, "Billy"]
]

power_ranger.to_h #Converti en hash

recipe.select { |ingredients, teaspoons| ingredients >= teaspoons}

def pass_control
    puts "This is inside the method"
    yield #passer un bloc qui prend le contrôle de la méthode
    puts "Now i'm back inside the method"

end

pass_control do
    puts "This is line 1 of my block"
end

#Procs = Fonctionne like a saved block

a = [1,2,3,4,5,6]
b = [5.6.7.8.9]
c = [11,23,54,23,24,46]

cube = Proc.new { |number| number ** 3 }

a.map(&cube)

a_cubes, b_cubes, c_cubes = [a,b,c].map {|array| array.map(&cube)}

def test_yield
yield "Boris" if block_given?
end

speak_the_truth {|name| puts "#{name} is brillant" }

## Yield: transfère le contrôle au block passé grâce au yield dans une méthode. AJoute une couche de configuration aux méthodes. Il faut qu'il y ait un bloc, sinon la méthode va renvoyer une erreur. ATTENTION: Un bloc va toujours renvoyer la dernière ligne

# Exemple 1
def pass_control
    puts "This is inside the method"
    yield #Donne le contrôle au bloc
    puts "Now i'm back inside the method"
end

pass_control {puts "Now i'm inside the block"}

# Exemple2

def multiple_pass
    puts "Inside the method"
    yield
    puts "Back inside the method"
    yield
end

multiple_pass {puts "inside the block"} #Va apparaitre 2 fois

## Procs : Objet (contrairement aux blocs) qui se veut un bloc sauvegardé, puisqu'un bloc n'est utilisé qu'une fois. Il a l'avantage d'avoir toutes les  options d'un objet, contrairement à un block qui est temporaire.

# Exemple 1

a = [1,2,3,4,5] 
b = [6,7,8,9,10]

a_cubes = a.map {|num| num ** 3} #Retourne tous les nombres au cube grâce à un bloc

cube_array = Proc.new {|number| number **3}

cube_array2 = a.map(&cube_array) # Active le proc en paramètre qui devient un bloc temporaire. Plus utile si réutilisé souvent. 