class API
    #make calls to our api

    #id => "idDrink"
    # name => "strDrink"
    # instructions => "strInstructions"
    # glass => "strGlass"
    #category => "strCategory"

    def self.fetch_drinks
        url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=martini"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_drinks = hash["drinks"]


        array_of_drinks.each do |drink_hash|
            # initialize a new drink
            drink_instance = Drink.new
            # assign attributes to it
            drink_instance.id = drink_hash["idDrink"]
            drink_instance.name = drink_hash["strDrink"]
            drink_instance.instructions = drink_hash["strInstructions"]
            drink_instance.glass = drink_hash["strGlass"]
            drink_instance.category = drink_hash["strCategory"]
        end

        binding.pry




    end
end