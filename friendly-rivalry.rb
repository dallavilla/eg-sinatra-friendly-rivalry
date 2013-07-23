require "sinatra"

before do
  content_type :txt
  @beats = {art: :copy, copy: :code, code: :art}
  @teamselection = @beats.keys
end

get '/ring/:type' do  
  human = params[:type].to_sym

  if !@teamselection.include?(human)
    halt 403, "you must choose your team: #{@teamselection}"
  end

  robot = @teamselection.sample

  if human == robot
    "tie. you both chose #{human}. the robot appears to want to join forces. choose a different side or run again, maybe it will change its mind."
    
  elsif robot == @beats[human]
    "you won! #{human} beat #{robot}."
    
  else
    "ju lucy. the robot's #{robot} team beat your #{human} team. keep the faith, try again."
     
  end

end