include("../src/SimplestStateMachine.jl")
using .SimplestStateMachine

#4 state:red black yellow green
function example1()
    add_transition,next,get_state=create(:red)
    add_transition(:red_black,:red,:black,x->print(x))
    add_transition(:black_yellow,:black,:yellow,x->print(x))
    add_transition(:red_yellow,:red,:yellow,x->print(x))
    add_transition(:yellow_red,:yellow,:red,x->print(x))
    add_transition(:yellow_green,:yellow,:green,x->print(x))
    for t in [:red_black,:black_yellow,:yellow_red,:black_yellow,:red_yellow,:red_black,:yellow_green]
        next(t)
    end
end
function example2()
    add_transition,next,get_state=create(:red)
    add_transition(:red_black,:red,:black)
    add_transition(:black_yellow,:black,:yellow)
    add_transition(:red_yellow,:red,:yellow)
    add_transition(:yellow_red,:yellow,:red)
    add_transition(:yellow_green,:yellow,:green)
    for t in [:red_black,:black_yellow,:yellow_red,:black_yellow,:red_yellow,:red_black,:yellow_green]
        next(t)
        print(get_state())
    end
end
example1()
print("\n")
example2()
