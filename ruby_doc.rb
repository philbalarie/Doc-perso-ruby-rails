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

##############################################################

## Ternaire ? 

# Exemple 1

string.length ­­> 10 ? true : false # Si la phrasea plus de 10 caractére, renvoie true, sinon false



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

## Procs : Objet (contrairement aux blocs) qui se veut un bloc sauvegardé, puisqu'un bloc n'est utilisé qu'une fois. Il a l'avantage d'avoir toutes les  options d'un objet, contrairement à un block qui est temporaire. UN proc peut être mis en paramètre d'une méthode, même si cette dernière ne prend pas d'arguments parce qu'un proc est un objet.

# Exemple 1

a = [1,2,3,4,5] 
b = [6,7,8,9,10]

a_cubes = a.map {|num| num ** 3} #Retourne tous les nombres au cube grâce à un bloc

cube_array = Proc.new {|number| number **3}

cube_array2 = a.map(&cube_array) # Active le proc en paramètre qui devient un bloc temporaire. Plus utile si réutilisé souvent. 

## Block_given? : Applique le block à la méthode s'il est attaché à la méthode

# Exemple 1

def pass_control_on_condition
    puts "Inside the method"
        yield if block_given?
    puts "Back inside the method"

    pass_control_on_condition #Ne renverra pas d'erreurs que le bloc soit attaché ou non.
end

## Yielding with arguments

# Exemple 1

def speak_the_truth 
    yield("Boris") if block_given? #Paramètre au yield
end

speak_the_truth { |name| puts "#{name} is brillant" } #Renvoit Boris est brillant.

# Exemple 2 : Avec le paramètre de la méthode

def speak_the_truth(name)
    yield name if block_given?
end

speak_the_truth("Philippe") { |name| puts "#{name} is brillant" } #Même résultat

# Exemple 3 : Proc en paramètre de méthode

hi = new Proc { puts "Hi there" }

5.times(&hi) #Affiche 5 fois Hi there

# Exemple 4 : Passer une methode comme un proc

string_of_number =  ["1", "2", "3"]

string_of_number.map(&:to_i) # = string_of_number.map { |number|  number.to_i}. Symbole pour indiquer que ce n'est pas une variable.

# Exemple 5 : Méthode avec un proc comme paramètre

def talk_about(name, &myproc)
    puts "Let me tell you about #{name}"
    myproc.call(name) #Comme un yield du proc
end

good_things = { |name| puts "#{name} is a genius" }

talk_about("Philippe", &good_things) 

## Lambdas : Méthode anonyme. Presque identique à un proc. Deux différences principales: 1. Proc va assigner nil aux arguments qui n'ont pas de valeurs, contrairmement à Lambda qui va renvoyer une erreur. 2. On peut inclure un return dans le lambda, contrairement au proc ou seule la méthode peut avoir un return implicite, sinon le return se fait à partir du proc. 

# Exemple 1 : lambda vs proc

def diet 
    status = Proc.new {return "You gave in!"}
    status.call
    "you complete the diet!"
end

result = diet #Va retourner "you gave in!" si status est un proc et "you complete the diet" si status est un lambda

# Exemple 2 : Montrer l'efficacité du lambda
to_euros = lambda { |dollars| dollars * 0.95 }

def convert(dollars, currency_lambda)
    currency_lambda.call(dollars) if dollars is_a?(Numeric) || block_given?
end

convert(95, to_euros)

## Expressions régulières

# Exemple 1

phrase = "Ruby is amazing!"

phrase.downcase.start_with?("the") #retourne un booléen

phrase.downcase.end_with?("amazing!") #retourne un booléen

phrase.downcase.include? "is" #Retourne un booléen. Peut juste être dans une partie d'un mot