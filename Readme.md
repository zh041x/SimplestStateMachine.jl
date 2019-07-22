一个Julia的初学者写的一个简单的状态机。

该状态机仅有4个API：

create(init_state::Symbol):创建状态机，参数start_state为初始状态。

add_transition(trigger::Symbol,source::Symbol,destination::Symbol,post_function::Function=x->x):添加状态转移规则，参数trigger为状态转移触发条件，source/destination为源/目标状态，post_function(state::Symbol)为状态转移完成时的回调，post_function的参数state为状态转移完成时的状态。

next(trigger::Symbol):在trigger作用下触发状态转移，若当前状态下trigger不起作用，则状态保持不变。

get_state():返回当前状态

安装：
pkg> add https://github.com/zh041x/SimplestStateMachine.jl.git

例子：
include("./SimplestStateMachine.jl")

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

运行结果为：

blackyellowredyellowgreen

blackyellowredredyellowyellowgreen

由以上程序的输出可看出post_function仅当状态转移成功才执行。
