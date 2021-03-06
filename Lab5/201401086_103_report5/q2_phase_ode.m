function F = q2_phase_ode( t , u )

%This function is used in ode solver which itself is used to plot the variation of the phase angle between
% driving force and the displacement motion as a function of the driving
% frequency. 

%{
u(1) -> theta    
u(2) -> omega 

F(1) -> omega
F(2) -> derivative of omega
%}

global C mass l g beta Fd driver_angular_freq max_ampl simulationt;
global driver_time_period zero_crossing_time min_square_theta;

F = zeros(length(u) , 1); 
F(1) = u(2);
F(2) = -(2*beta)*u(2) - (g/l)*u(1) + (Fd/(mass*l))*cos(driver_angular_freq*t); %cosine !!!!!!!!!!!!!!!!!!!! 

if(t>(simulationt - driver_time_period)) %because the oscillations stabilise during this time
    if t-driver_time_period < 0.01    %we calculate the amplitude val closest to 0 (either +ve or -ve)
        %+ve slope zero crossing
%        min_square_theta = u(1)*u(1);
        zero_crossing_time = t;       
    end
end

end

 