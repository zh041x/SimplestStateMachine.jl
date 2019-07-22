module SimplestStateMachine
    export create
    struct DestSymbol
        sym::Symbol
        post_function::Function
    end
    function create(init_state::Symbol)
        states=Dict{Tuple{Symbol,Symbol},DestSymbol}()
        current_state=init_state
        function add_transition(trigger::Symbol,source::Symbol,destination::Symbol,post_function::Function=x->x)
            states[(trigger,source)]=DestSymbol(destination,post_function)
        end
        function next(trigger::Symbol)
            if haskey(states,(trigger,current_state))
                current_state_destsymbol=states[(trigger,current_state)]
                current_state_destsymbol.post_function(current_state_destsymbol.sym)
                current_state=current_state_destsymbol.sym
            end
        end
        function get_state()
            current_state
        end
        add_transition,next,get_state
    end
end # module
