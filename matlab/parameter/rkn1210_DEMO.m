% RKN1210_DEMO         small demonstration of RKN1210-integrator
%
% Run this function for a small demonstration of the Runge-Kutta-Nystrom
% 12th/10th order integrator for second-order ODE's. 
%
% See also RKN1210, RKN86, ODE45, ODESET, ODEGET. 

function rkn1210_DEMO
% Author:
% Name       : Rody P.S. Oldenhuis
% E-mail     : oldenhuis@dds.nl / oldenhuis@gmail.com
% Affiliation: Delft University of Technology
%
% please report any bugs or suggestions to oldnhuis@dds.nl

    %% initialize
    
    % optimize figure window sizes
    scz      = get(0, 'screensize');
    position = @(width,height) [scz(3:4)/2-[width, height]/2, width, height];
        
    % define function
    f = @(t,y) [-y(1) * (y(1)^2+y(2)^2)^(-3/2);
                -y(2) * (y(1)^2+y(2)^2)^(-3/2)];
    
    %% Elementary example: Circular orbit
    
    % show message
    uiwait(msgbox({['The class of Runge-Kutta-Nystrom (RKN) integrators are very efficient for ODE''s ',...
        'of the type  y`` = F(t,y), i.e., where the first derivative of the function [y] does not explicitly ',...
        'appear in the ODE. One example of a problem of this type is a body in freefall, in an ',...
        'environment without air drag or any other resistence; a body in orbit, for example.'];' ';
        ['As a first example, we will integrate the trajectory of a massless body in a ',...
        'simple circular orbit around a massive body, for 25 revolutions:']}, 'First demonstration','modal'));

    % start integration
    options = odeset('abstol', 1e-16);
    [t, y, dummy,dummy, output] = rkn1210(f, [0, 50*pi], [1; 0], [0; 1],options);%#ok

    % show results
    
    % The orbit should be *exactly* circular
    figure(1), hold on
    set(1, 'position', position(800, 600));
    subplot(2,2,1)
    plot(y(:,1), y(:,2), '.k', 'markersize', 1);
    title('Integrated circular orbit'), xlabel('X'), ylabel('Y')
    axis equal, axis tight,
    % We can easily plot the x- and y-error
    subplot(2,2,2), hold on
    Xerr = abs(y(:,1) - cos(t));
    Yerr = abs(y(:,2) - sin(t));
    plot(sqrt(Xerr.^2+Yerr.^2), 'r');
    title('Absolute error')
    xlabel('step'), ylabel('error')
    % Also plot the step magnitude and error estimate
    subplot(2,2,3), hold on
    plot(output.h, 'b')    
    title('Magnitude of step') 
    xlabel('step'), ylabel('magnitude')
    subplot(2,2,4), hold on
    plot(output.delta, 'r')
    title('Magnitude of error estimate') 
    xlabel('step'), ylabel('magnitude')

    %% Elliptic orbit
    
    % show message
    pause(1)
    uiwait(msgbox({['Note how the error always remains less than 4e-13, and how the step size ',...
        'starts conservatively but automatically adapts itself to the largest possible value that',...
        ' still gives the desired accuracy. That''s pretty good, but of course it''s an exceedingly',...
        ' simple example.'];' ';' Now let''s try an elliptic orbit:'}, 'Second demonstration','modal'));
    
    % start integration
    V = 1.25;
    [t, y, dummy,dummy, output] = rkn1210(f, [0, 50*pi], [1; 0], [0; V], options);%#ok

    % show results
    
    % The orbit should be *exactly* circular
    figure(1), clf, hold on
    set(1, 'position', position(800, 600));
    subplot(2,2,1)
    plot(y(:,1), y(:,2), '.k', 'markersize', 1);
    title('Integrated elliptic orbit'), xlabel('X'), ylabel('Y')
    axis equal, axis tight,
    % The x- and y-error are a bit harder to compute. We first have to
    % solve Kepler's equation:
    a = 1/(2-V*V); n = sqrt(1/a^3); e = 1-1/a;
    M = n*t; E = M; Ep = inf;
    while any(abs(E-Ep)>1e-12), Ep = E; E = E + (M+e*sin(E)-E)./(1-e*cos(E)); end    
    % and convert to XY-coordinates:
    th = 2*atan2(sqrt((1+e)/(1-e))*sin(E/2),cos(E/2));
    r  = a*(1-e*e)./(1+e*cos(th));
    [X,Y] = pol2cart(th,r);
    % now plot the error
    subplot(2,2,2), hold on
    Xerr = abs(y(:,1) - X);
    Yerr = abs(y(:,2) - Y);
    plot(sqrt(Xerr.^2+Yerr.^2), 'r');
    title('Absolute error')
    xlabel('step'), ylabel('error')
    % Also plot the step magnitude and error estimate
    subplot(2,2,3), hold on
    plot(output.h, 'b')    
    title('Magnitude of step') 
    xlabel('step'), ylabel('magnitude')
    subplot(2,2,4), hold on
    plot(output.delta, 'r')
    title('Magnitude of error estimate') 
    xlabel('step'), ylabel('magnitude')

    %% Using output functions
    
    % show message
    pause(1)
    uiwait(msgbox({['Note how the error still remains below 4e-13 also for this more complicated case. ',...
        'Also note how the integrator automatically decreases its stepsize each time the massless body ',...
        'approaches the massive body more closely. This is because its speed increases at those points, ',...
        'so that the error will accumulate more rapidly if large stepsizes are maintained. These are ',...
        'also the regions where the ODE45 integrator often fails to produce the correct trajectory.'];
        ' ';['This RKN1210-function now also supports the use of ''output functions'', functions that are ',...
        'called after each successfull integration step. This can be used to produce a progress bar ',...
        'for example:']}, 'Third demonstration','modal'));
                
    % initialize waitbar
    wait = waitbar(0, 'integrating circular orbit...');

    % start integration (circular orbit again)
    options = odeset('abstol', 1e-16, 'outputfcn', @OutputFcn1);
    [t, y, dummy,dummy, output] = rkn1210(f, [0, 50*pi], [1; 0], [0; 1],options);%#ok
    % kill waitbar
    close(wait)

    % the output function
    function stop = OutputFcn1(t,y,dy,flag)%#ok
        % don't stop
        stop = false;
        % only after sucessfull steps
        if ~isempty(flag), return
        else
            wait = waitbar(t/50/pi, wait);
        end
    end
    
    % Plot the circular orbit
    figure(1), clf, hold on
    set(1, 'position', position(800, 600));
    plot(y(:,1), y(:,2), '.k', 'markersize', 1);
    title('Integrated circular orbit'), xlabel('X'), ylabel('Y')
    axis equal, axis tight
    
    %% Using event functions
    
    pause(1)
    uiwait(msgbox({['Aside from output functions, this integrator now also supports ''event functions''.',...
        'Such functions can be used to detect where user-defined events occur, possibly halting the ',...
        'integration after these events have occured. As a final example, we will use an output function ',...
        'to display the instantaneous integration step, and an event function that detects when the ',...
        'Y-coordinate becomes negative. When this happens, the integration is terminated:']}, ...
        'Fourth demonstration','modal'));
    
    % initialize figure
    figure(1), clf, hold on
                
    % start integration (circular orbit again)    
    options = odeset('abstol', 1e-16, 'outputfcn', @OutputFcn2, 'events', @EventFcn);
    [t, y, dy, TE,YE] = rkn1210(f, [0, 50*pi], [1; 0], [0; 1],options);%#ok
    
    % plot final point
    plot(YE(1), YE(2), 'rx')
    text(-.9, 0 ,'<--  Event: y < 0; integration stopped')
            
    % the output function
    function stop = OutputFcn2(t,y,dy,flag)%#ok
        % don't stop
        stop = false;
        % only after sucessfull steps
        if ~isempty(flag), return
        else
            plot(y(1), y(2), 'b.')
            axis equal, axis([-1.2 1.2 -.2 1.2])            
            pause(0.1), drawnow % flush plotting commands
        end
    end
    
    % the event function
    function [value, isterminal, direction] = EventFcn(t,y,dy)%#ok
        % stop upon event? Yup:
        isterminal = true;
        % direction should be DEcreasing (pos to neg)
        direction = -1;
        % value is simply Y-coordinate
        value = y(2);
    end
      
    %% thanks & enjoy
    
    pause(1)
    uiwait(msgbox(['That''s about it. Please look inside this Demo to see how to use these features.',...
    'Please send any bugs you find to: oldnhuis@dds.nl'], 'That''s all Folks!','modal'));
    close(1)
    
end
 