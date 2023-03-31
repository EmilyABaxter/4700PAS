clear all;
x = 0;
v = 0;
t = 0; % time
F = 1; % force 
m = 1;
dt = 1; % delta t
nt = 1000; % simulaion steps

for i = 2:nt % we have the first point so start from the second 

    % remember F = ma
    % from the PA video
    t(i) = t(i-1) + dt; 
    v(:,i) = v(:,i-1) + F/m*dt;
    x(:,i) = x(:,i-1) + v(:,i-1)*dt + F/m*dt^2/2;

    scat = rand(1,1); % we want a single random value

    if scat < 0.05 
        v(i) = scat*v(i);
    end

    avg(:,i) = mean(v);

    subplot(3,1,1); hold on;
    plot(t,v);
    plot(t,avg,"--");
    title("Drift Velocity Average", num2str(avg(i)))
    xlabel("Time");
    ylabel("Velocity");
    hold off;
    
    subplot(3,1,2); hold on;
    plot(x,v);
    plot(x,avg,"--");
    xlabel("Position");
    ylabel("Velocity");
    hold off;
    
    subplot(3,1,3); hold on;
    plot(t,x);
    plot(t,avg,"--");
    xlabel("Time");
    ylabel("Position");
    hold off;

    pause(0.01)
end 