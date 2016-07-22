class Monty
  attr_accessor :car_door, :initial_pick, :goat_door, :final_choice

  def switch_guess
    @final_choice = [1,2,3].find{|x| x != goat_door && x != initial_pick}
  end
  
  def show_a_goat
    @goat_door = [1,2,3].find{|x| x != car_door && x != initial_pick}
  end
    
  def initialize_doors
    # place_prize
    @car_door = rand(1..3)
    @initial_pick = @final_choice = 1
  end
  
  def run_simulation(switch)
    initialize_doors
    show_a_goat
    switch_guess if switch
    win?
  end
  
  def win?
    final_choice == car_door
  end
  
  def win_percentage
    num_true_with_switch = 0
    num_true_without_switch = 0
    
    10000.times do
      num_true_with_switch += 1 if run_simulation(true)
      num_true_without_switch +=1 if run_simulation(false)
    end
    
    "When a contestant SWITCHED their guess they won #{(num_true_with_switch.to_f / 1000).round(2)}% of the time.
When they STUCK WITH THEIR ORIGINAL choice they won #{(num_true_without_switch.to_f / 1000).round(2)}% of times."
  end
end
