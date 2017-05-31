function plotData( clog, roro )

 

    t_Burnout = roro.t_Burnout;
    t_RailExit = roro.departureState(2);
    % vel_RailExit = roro.departureState(1);
    
    % Calculate Xcp Barrowman for documentation
    [Xcp_Barrowman, Xcp_Planform, Ssm_Barrowman] = Xcp_Barrowman_f(roro);
    Xcp_B = ones(length(clog),1) * Xcp_Barrowman;
    Xcp_P= ones(length(clog),1) * Xcp_Planform;
    
    %% --- Figure Flight Information ---
    
    figure('Name','Flight information','Position', [400 0 400 1000]);
    subplot(4,1,1)
    plot(clog(:,10),clog(:,6))
    xlabel('Time')
    ylabel('Xdot [m/s]')
    title('Velocity')
    axis([0 25 0 300])
    line([t_RailExit t_RailExit],[0 300],'Color',[0 1 0])
    line([t_Burnout t_Burnout],[0 300],'Color',[1 0 0])

    subplot(4,1,2)
    plot(clog(:,10),clog(:,5))
    xlabel('Time')
    ylabel('Mass [kg]')
    title('Mass')
    axis([0 25 20 30])
    line([t_RailExit t_RailExit],[0 300],'Color',[0 1 0])
    line([t_Burnout t_Burnout],[0 300],'Color',[1 0 0])

    subplot(4,1,3)
    plot(clog(:,10),clog(:,2))
    xlabel('Time(s)')
    ylabel('Cd []')
    title('Drag Coefficient')
    axis([0 25 0 1])
    line([t_RailExit t_RailExit],[0 300],'Color',[0 1 0])
    line([t_Burnout t_Burnout],[0 300],'Color',[1 0 0])

    subplot(4,1,4)
    plot(clog(:,10),clog(:,1))
    xlabel('Time')
    ylabel('alpha [rad]')
    title('Angle of Attack')
    axis([0 25 0 0.4])
    line([t_RailExit t_RailExit],[0 300],'Color',[0 1 0])
    line([t_Burnout t_Burnout],[0 300],'Color',[1 0 0])

    %% --- Figures Stability Analysis ---
    % COP
    figure('Name','Stability Analysis', 'Position', [0 0 400 1000])
    subplot(4,1,1)
    hold on
    plot(clog(:,10),clog(:,7))
    plot(clog(:,10),Xcp_B)
    plot(clog(:,10),Xcp_P)
    hold off
    xlabel('Time')
    ylabel('Xcp [m]')
    title('Center of Pressure')
    axis([0 25 1.5 1.9])
    line([t_RailExit t_RailExit],[0 300],'Color',[0 1 0])
    line([t_Burnout t_Burnout],[0 300],'Color',[1 0 0])
    legend('Barrowman+BodyLift','Barrowman','Planform','rail exit','burnout')
    % COG
    subplot(4,1,2)
    plot(clog(:,10),clog(:,4))
    xlabel('Time')
    ylabel('Xcm [m]')
    title('Center of Mass')
    axis([0 25 1.4 1.7])
    line([t_RailExit t_RailExit],[0 300],'Color',[0 1 0])
    line([t_Burnout t_Burnout],[0 300],'Color',[1 0 0])
    % STABILITY MARGIN
    subplot(4,1,3)
    hold on
    plot(clog(:,10),clog(:,9))
    plot(clog(:,10),clog(:,9))
    hold off
    xlabel('Time')
    ylabel('Margin []')
    title('Static Stability Margin')
    axis([0 25 0 3])
    line([t_RailExit t_RailExit],[0 300],'Color',[0 1 0])
    line([t_Burnout t_Burnout],[0 300],'Color',[1 0 0])
    %legend('Barrowman+BodyLift','Barrowman','rail exit','burnout')
    legend('Margin','rail exit','burnout')
    % DAMPING RATIO
    subplot(4,1,4)
    plot(clog(:,10),clog(:,8))
    xlabel('Time')
    ylabel('Zeta []')
    title('Damping Ratio')
    axis([0 25 0.0 0.3])
    line([t_RailExit t_RailExit],[0 300],'Color',[0 1 0])
    line([t_Burnout t_Burnout],[0 300],'Color',[1 0 0])
    


end
