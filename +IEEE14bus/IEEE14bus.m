%Create power network framework
net = power_network();

%Bus defination Base
    %shunt admittance
        shunt = [0,0];
        % Thank

    %Base 100MVA
    %Bus1 Slack V delta
        bus_1 = bus.slack(1.06,0,shunt);
        net.add_bus(bus_1);
    %Bus2 Generator & Load
        bus_2 = bus.PV(0.183,1.045,shunt);
        net.add_bus(bus_2);
    %Bus3 Generator & Load
        bus_3 = bus.PV(-0.942,,shunt);
        %net.add_bus(bus_3);
    %Bus4 PQ Load
        bus_4 = bus.PQ(-0.478,0.039,shunt);
        net.add_bus(bus_4);
    %Bus5 PQ Load
        bus_5 = bus.PQ(-0.076,-0.016,shunt);
        net.add_bus(bus_5);
    %Bus6 Synchronous compensators
        bus_6 = bus.PV(-0.112,1.07,shunt);
        net.add_bus(bus_6);
    %Bus7 Transformer
        bus_7 = bus.PQ(0,0,shunt);
        net.add_bus(bus_7);
    %Bus8 Synchronous compensator
        bus_8 = bus.PV(0,1.09,shunt);
        net.add_bus(bus_8);
    %Bus9 PQ 
        bus_9 = bus.PQ(-0.295,-0.166,[0, 0.19]);
        net.add_bus(bus_9);
    %Bus10 Load
        bus_10 = bus.PQ(-0.09,-0.058,shunt);
        net.add_bus(bus_10);
    %Bus11 Load
        bus_11 = bus.PQ(-0.035,-0.018,shunt);
        net.add_bus(bus_11);
    %Bus12 Load
        bus_12 = bus.PQ(-0.061,-0.016,shunt);
        net.add_bus(bus_12);
    %Bus13 Load
        bus_13 = bus.PQ(-0.135,-0.058,shunt);
        net.add_bus(bus_13);
    %Bus14 Load
        bus_14 = bus.PQ(-0.149,-0.05,shunt);
        net.add_bus(bus_14);

%Branch defination
    %Branch12 
        branch12 = branch.pi(1,2,[0.01938, 0.05917], 0.0528);
        net.add_branch(branch12);
    %Branch15 
        branch15 = branch.pi(1,5,[0.05403, 0.22304], 0.0492);
        net.add_branch(branch15);
    %Branch23 
        branch23 = branch.pi(2,3,[0.04699, 0.19797], 0.0438);
        net.add_branch(branch23);
    %Branch24
        branch24 = branch.pi(2,4,[0.05811, 0.17632], 0.034);
        net.add_branch(branch24);
    %Branch25
        branch25 = branch.pi(2,5,[0.05695, 0.17388], 0.0346);
        net.add_branch(branch25);
    %Branch34
        branch34 = branch.pi(3,4,[0.06701, 0.17103], 0.0128);
        net.add_branch(branch34);
    %Branch45
        branch45 = branch.pi(4,5,[0.01335, 0.04211], 0);
        net.add_branch(branch45);
    %Branch47
        branch47 = branch.pi_transformer(4,7,[0, 0.20912],0.978,0);
        net.add_branch(branch47);
    %Branch49
        branch49 = branch.pi_transformer(4,9,[0, 0.55618],0.969,0);
        net.add_branch(branch49);
    %Branch56
        branch56 = branch.pi_transformer(5,6,[0, 0.25202],0.932,0);
        net.add_branch(branch56);
    %Branch611
        branch611 = branch.pi(6,11,[0.09498, 0.1989],0);
        net.add_branch(branch611);
    %Branch612
        branch612 = branch.pi(6,12,[0.12291, 0.25581],0);
        net.add_branch(branch612);
    %Branch613
        branch613 = branch.pi(6,13,[0.06615, 0.13027],0);
        net.add_branch(branch613);
    %Branch78
        branch78 = branch.pi_transformer(7,8,[0, 0.17615],1,0);
        net.add_branch(branch78);
    %Branch79
        branch79 = branch.pi(7,9,[0, 0.11001],0);
        net.add_branch(branch79);
    %Branch910
        branch910 = branch.pi(9,10,[0.03181, 0.0845],0);
        net.add_branch(branch910);
    %Branch914
        branch914 = branch.pi(9,14,[0.12711, 0.27038],0);
        net.add_branch(branch914);
    %Branch1011
        branch1011 = branch.pi(10,11,[0.08205, 0.19207],0);
        net.add_branch(branch1011);
    %Branch1213
        branch1213 = branch.pi(12,13,[0.22092, 0.19988],0);
        net.add_branch(branch1213);
    %Branch1314
        branch1314 = branch.pi(13,14,[0.17093, 0.34802],0);
        net.add_branch(branch1314);

%Component defination

    %system frequency
    omega0 = 50*2*pi;

    %Bus1 Generator 1axis 200MW
        %Xd = 1.7; Xd_p = 0.35; Xq = 1.7; Td_p = 1.0; M = M_all(n_sim, 1); D = D_all(n_sim, 1);
        %mac_data = table(Xd,Xd_p,Xq,Td_p,M,D);
    
        %component1 = component.generator.one_axis(mac_data);
        net.a_bus{1}.set_component(component1);

    %Bus2 Generator 1axis 400M
        %Xd = 1.7; Xd_prime = 0.35; Xq = 1.7; Td_p = 1.0; M = M_all(n_sim, 2); D = D_all(n_sim, 2);
        %mac_data = table(Xd,Xd_p,Xq,Td_p,M,D);
    
        %component2 = component.generator.one_axis(mac_data);
        net.a_bus{2}.set_component(component2);

    %Bus3 Generator 1axis 800MW
        %Xd = 1.7; Xd_prime = 0.35; Xq = 1.7; Td_p = 1.0; M = M_all(n_sim, 3); D = D_all(n_sim, 3);
        %mac_data = table(Xd,Xd_p,Xq,Td_p,M,D);
    
        %component3 = component.generator.one_axis(mac_data);
        net.a_bus{3}.set_component(component3);

    %Bus4 Generator 1axis 100MW
        %Xd = 1.7; Xd_prime = 0.35; Xq = 1.7; Td_p = 1.0; M = M_all(n_sim, 4); D = D_all(n_sim, 4);
        %mac_data = table(Xd,Xd_p,Xq,Td_p,M,D);
    
        %component4 = component.generator.one_axis(mac_data);
        net.a_bus{4}.set_component(component4);

    %Bus5 Impedance load
        %component5 = component.load.power();
        net.a_bus{5}.set_component(component5);

    %Bus6 GFM Droop
        %component6 = component.GFM.droop_DC1order();
        net.a_bus{6}.set_component(component6);

    %Bus7 GFM Droop
        %component7 = component.GFM.droop_DC1order();
        net.a_bus{7}.set_component(component7);

    %Bus8 GFM Droop
        %component8 = component.GFM.droop_DC1order();
        net.a_bus{8}.set_component(component8);

    %Bus9 GFM Droop
        %component9 = component.GFM.droop_DC1order();
        net.a_bus{9}.set_component(component9);

    %Bus10 GFM Droop
        %component10 = component.GFM.droop_DC1order();
        net.a_bus{10}.set_component(component10);

    %Bus11 GFM Droop
        %component11 = component.GFM.droop_DC1order();
        net.a_bus{11}.set_component(component11);

    %Bus12 GFM Droop
        %component12 = component.GFM.droop_DC1order();
        net.a_bus{12}.set_component(component12);

    %Bus13 GFM Droop
        %component13 = component.GFM.droop_DC1order();
        net.a_bus{13}.set_component(component13);

    %Bus14 GFM Droop
        %component14 = component.GFM.droop_DC1order();
        net.a_bus{14}.set_component(component14);

    net.initialize

    %simulation time
    %u    = struct('time',[0, 10, 20],'index',5,'u',[1;0]*[0, 0.5, 0.5],'method','zoh','function',[]);
    %out = net.simulate([0,20],'input',u);