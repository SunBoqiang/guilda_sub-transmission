%%
clc
clear

%% Bus defination Base
%Base 100MVA

net_83BS = network.IEEE68bus();
% Base 100MVA, 60Hz

%shunt admittance
shunt = [0,0];

% %Bus1 Slack V delta -> PQ Bus #18/#64 in 68Testfeeder
%     bus_1 = bus.slack(1.06,0,shunt);
%     net1.add_bus(bus_1);
%Bus69 Generator & Load
    bus_69 = bus.PV_2comp(0.4,1.045,[0.217,0.127],shunt);
    net_83BS.add_bus(bus_69);
%Bus70 Generator & Load
    bus_70 = bus.PV_2comp(0,1.01,[0.942,0.19],shunt);
    net_83BS.add_bus(bus_70);
%Bus71 PQ Load
    bus_71 = bus.PQ(-0.478,0.039,shunt);
    net_83BS.add_bus(bus_71);
%Bus72 PQ Load
    bus_72 = bus.PQ(-0.076,-0.016,shunt);
    net_83BS.add_bus(bus_72);
%Bus73 Synchronous compensators
    bus_73 = bus.PV_2comp(0,1.07,[0.112,0.075],shunt);
    net_83BS.add_bus(bus_73);
%Bus74 Transformer
    bus_74 = bus.PQ(0,0,shunt);
    net_83BS.add_bus(bus_74);
%Bus75 Synchronous compensator
    bus_75 = bus.PV(0,1.09,shunt);
    net_83BS.add_bus(bus_75);
%Bus76 PQ 
    bus_76 = bus.PQ(-0.295,-0.166,[0, 0.19]);
    net_83BS.add_bus(bus_76);
%Bus77 Load
    bus_77 = bus.PQ(-0.09,-0.058,shunt);
    net_83BS.add_bus(bus_77);
%Bus78 Load
    bus_78 = bus.PQ(-0.035,-0.018,shunt);
    net_83BS.add_bus(bus_78);
%Bus79 Load
    bus_79 = bus.PQ(-0.061,-0.016,shunt);
    net_83BS.add_bus(bus_79);
%Bus80 Load
    bus_80 = bus.PQ(-0.135,-0.058,shunt);
    net_83BS.add_bus(bus_80);
%Bus81 Load
    bus_81 = bus.PQ(-0.149,-0.05,shunt);
    net_83BS.add_bus(bus_81);

%% 案1：Bus #64(PQ Bus or PV Bus)にIEEE14BusSysを付ける。
% -> 14BSの潮流計算の
% Branch defination
%Branch 64->69 
    branch6469 = branch.pi(64,69,[0.01938, 0.05917], 0.0528/2);
    net_83BS.add_branch(branch6469);
%Branch 64->72
    branch6472 = branch.pi(64,72,[0.05403, 0.22304], 0.0492/2);
    net_83BS.add_branch(branch6472);
%Branch 69->70
    branch6970 = branch.pi(69,70,[0.04699, 0.19797], 0.0438/2);
    net_83BS.add_branch(branch6970);
%Branch 69->71
    branch6971 = branch.pi(69,71,[0.05811, 0.17632], 0.034/2);
    net_83BS.add_branch(branch6971);
%Branch 69->72
    branch6972 = branch.pi(69,72,[0.05695, 0.17388], 0.0346/2);
    net_83BS.add_branch(branch6972);
%Branch 70->71
    branch7071 = branch.pi(70,71,[0.06701, 0.17103], 0.0128/2);
    net_83BS.add_branch(branch7071);
%Branch 71->72
    branch7172 = branch.pi(71,72,[0.01335, 0.04211], 0);
    net_83BS.add_branch(branch7172);
%Branch 71->74
    branch7174 = branch.pi_transformer(71,74,[0, 0.20912],0,0.978,0);
    net_83BS.add_branch(branch7174);
%Branch 71->76
    branch7176 = branch.pi_transformer(71,76,[0, 0.55618],0,0.969,0);
    net_83BS.add_branch(branch7176);
%Branch 72->73
    branch7273 = branch.pi_transformer(72,73,[0, 0.25202],0,0.932,0);
    net_83BS.add_branch(branch7273);
%Branch 73->78
    branch7378 = branch.pi(73,78,[0.09498, 0.1989],0);
    net_83BS.add_branch(branch7378);
%Branch 73->79
    branch7379 = branch.pi(73,79,[0.12291, 0.25581],0);
    net_83BS.add_branch(branch7379);
%Branch 73->80
    branch7380 = branch.pi(73,80,[0.06615, 0.13027],0);
    net_83BS.add_branch(branch7380);
%Branch 74->75
    branch7475 = branch.pi_transformer(74,75,[0, 0.17615],0,1,0);
    net_83BS.add_branch(branch7475);
%Branch 74->76
    branch7476 = branch.pi(74,76,[0, 0.11001],0);
    net_83BS.add_branch(branch7476);
%Branch 76->77
    branch7677 = branch.pi(76,77,[0.03181, 0.0845],0);
    net_83BS.add_branch(branch7677);
%Branch 76->81
    branch7681 = branch.pi(76,81,[0.12711, 0.27038],0);
    net_83BS.add_branch(branch7681);
%Branch 77->78
    branch7778 = branch.pi(77,78,[0.08205, 0.19207],0);
    net_83BS.add_branch(branch7778);
%Branch 79->80
    branch7980 = branch.pi(79,80,[0.22092, 0.19988],0);
    net_83BS.add_branch(branch7980);
%Branch 80->81
    branch8081 = branch.pi(80,81,[0.17093, 0.34802],0);
    net_83BS.add_branch(branch8081);



% Component defination

%system frequency
omega0 = 60*2*pi;

% %Bus1 SG -> PQ Bus or PV Bus
%     %S = 615/100;
%     M = 2*5.148; D = 2; Xd  = 0.8979; Xd_p = 0.2995; Xd_pp = 0.23; Xq  = 0.646; Xq_p = 0.646; Xq_pp = 0.4; X_ls = 0.2396;Td_p = 7.4;Tq_p = 0;Td_pp = 0.03;Tq_pp = 0.033;
%     mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% 
%     component1 = component.generator.park(mac_data);
%     net.a_bus{1}.set_component(component1);

%Bus69 SG
    S = 60/100;
    M = 2*6.54; D = 2; Xd  = 1.05; Xd_p = 0.185; Xd_pp = 0.13; Xq  = 0.98; Xq_p = 0.36; Xq_pp = 0.13; X_ls = 0;Td_p = 6.1;Tq_p = 0.3;Td_pp = 0.04;Tq_pp = 0.099;
    mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);

    component2 = component.generator.LossPark(mac_data);
    net_83BS.a_bus{69}.set_component(component2);

%Bus70 SG
    %S = 60/100;
    M = 2*6.54; D = 2; Xd  = 1.05; Xd_p = 0.185; Xd_pp = 0.13; Xq  = 0.98; Xq_p = 0.36; Xq_pp = 0.13; X_ls = 0;Td_p = 6.1;Tq_p = 0.3;Td_pp = 0.04;Tq_pp = 0.099;
    mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);

    component3 = component.generator.LossPark(mac_data);
    net_83BS.a_bus{70}.set_component(component3);

%Bus71 load
    component4 = component.load.impedance();
    net_83BS.a_bus{71}.set_component(component4);

%Bus72 load
    component5 = component.load.impedance();
    net_83BS.a_bus{72}.set_component(component5);

%Bus73 SG
    %S = 25/100;
    M = 2*5.06; D = 2; Xd  = 1.25; Xd_p = 0.232; Xd_pp = 0.12; Xq  = 1.22; Xq_p = 0.715; Xq_pp = 0.12; X_ls = 0.134;Td_p = 4.75;Tq_p = 1.5;Td_pp = 0.06;Tq_pp = 0.21;
    mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);

    component6 = component.generator.LossPark(mac_data);
    net_83BS.a_bus{73}.set_component(component6);

%Bus74 load
    component7 = component.load.impedance();
    net_83BS.a_bus{74}.set_component(component7);

%Bus75 SG
    %S = 25/100;
    M = 2*5.06; D = 2; Xd  = 1.25; Xd_p = 0.232; Xd_pp = 0.12; Xq  = 1.22; Xq_p = 0.715; Xq_pp = 0.12; X_ls = 0.134;Td_p = 4.75;Tq_p = 1.5;Td_pp = 0.06;Tq_pp = 0.21;
    mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
    
    component8 = component.generator.park(mac_data);
    net_83BS.a_bus{75}.set_component(component8);

%Bus76 load
    component9 = component.load.impedance();
    net_83BS.a_bus{76}.set_component(component9);

%Bus77 load
    component10 = component.load.impedance();
    net_83BS.a_bus{77}.set_component(component10);

%Bus78 load
    component11 = component.load.impedance();
    net_83BS.a_bus{78}.set_component(component11);

%Bus79 load
    component12 = component.load.impedance();
    net_83BS.a_bus{79}.set_component(component12);

%Bus80 load 
    component13 = component.load.impedance();
    net_83BS.a_bus{80}.set_component(component13);

%Bus81 load
    component14 = component.load.impedance();
    net_83BS.a_bus{81}.set_component(component14);

%% 案2：Bus #18(PQ Bus)にIEEE14BusSysを付ける。
% % Branch defination
% %Branch 18->69 
%     branch1869 = branch.pi(18,69,[0.01938, 0.05917], 0.0528/2);
%     net_83BS.add_branch(branch1869);
% %Branch 18->72
%     branch1872 = branch.pi(18,72,[0.05403, 0.22304], 0.0492/2);
%     net_83BS.add_branch(branch1872);
% %Branch 69->70
%     branch6970 = branch.pi(69,70,[0.04699, 0.19797], 0.0438/2);
%     net_83BS.add_branch(branch6970);
% %Branch 69->71
%     branch6971 = branch.pi(69,71,[0.05811, 0.17632], 0.034/2);
%     net_83BS.add_branch(branch6971);
% %Branch 69->72
%     branch6972 = branch.pi(69,72,[0.05695, 0.17388], 0.0346/2);
%     net_83BS.add_branch(branch6972);
% %Branch 70->71
%     branch7071 = branch.pi(70,71,[0.06701, 0.17103], 0.0128/2);
%     net_83BS.add_branch(branch7071);
% %Branch 71->72
%     branch7172 = branch.pi(71,72,[0.01335, 0.04211], 0);
%     net_83BS.add_branch(branch7172);
% %Branch 71->74
%     branch7174 = branch.pi_transformer(71,74,[0, 0.20912],0,0.978,0);
%     net_83BS.add_branch(branch7174);
% %Branch 71->76
%     branch7176 = branch.pi_transformer(71,76,[0, 0.55618],0,0.969,0);
%     net_83BS.add_branch(branch7176);
% %Branch 72->73
%     branch7273 = branch.pi_transformer(72,73,[0, 0.25202],0,0.932,0);
%     net_83BS.add_branch(branch7273);
% %Branch 73->78
%     branch7378 = branch.pi(73,78,[0.09498, 0.1989],0);
%     net_83BS.add_branch(branch7378);
% %Branch 73->79
%     branch7379 = branch.pi(73,79,[0.12291, 0.25581],0);
%     net_83BS.add_branch(branch7379);
% %Branch 73->80
%     branch7380 = branch.pi(73,80,[0.06615, 0.13027],0);
%     net_83BS.add_branch(branch7380);
% %Branch 74->75
%     branch7475 = branch.pi_transformer(74,75,[0, 0.17615],0,1,0);
%     net_83BS.add_branch(branch7475);
% %Branch 74->76
%     branch7476 = branch.pi(74,76,[0, 0.11001],0);
%     net_83BS.add_branch(branch7476);
% %Branch 76->77
%     branch7677 = branch.pi(76,77,[0.03181, 0.0845],0);
%     net_83BS.add_branch(branch7677);
% %Branch 76->81
%     branch7681 = branch.pi(76,81,[0.12711, 0.27038],0);
%     net_83BS.add_branch(branch7681);
% %Branch 77->78
%     branch7778 = branch.pi(77,78,[0.08205, 0.19207],0);
%     net_83BS.add_branch(branch7778);
% %Branch 79->80
%     branch7980 = branch.pi(79,80,[0.22092, 0.19988],0);
%     net_83BS.add_branch(branch7980);
% %Branch 80->81
%     branch8081 = branch.pi(80,81,[0.17093, 0.34802],0);
%     net_83BS.add_branch(branch8081);
% 
% 
% 
% % Component defination
% 
% %system frequency
% omega0 = 60*2*pi;
% 
% % %Bus1 SG -> PQ Bus
% %     %S = 615/100;
% %     M = 2*5.148; D = 2; Xd  = 0.8979; Xd_p = 0.2995; Xd_pp = 0.23; Xq  = 0.646; Xq_p = 0.646; Xq_pp = 0.4; X_ls = 0.2396;Td_p = 7.4;Tq_p = 0;Td_pp = 0.03;Tq_pp = 0.033;
% %     mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% % 
% %     component1 = component.generator.park(mac_data);
% %     net.a_bus{1}.set_component(component1);
% 
% %Bus69 SG
%     S = 60/100;
%     M = 2*6.54; D = 2; Xd  = 1.05; Xd_p = 0.185; Xd_pp = 0.13; Xq  = 0.98; Xq_p = 0.36; Xq_pp = 0.13; X_ls = 0;Td_p = 6.1;Tq_p = 0.3;Td_pp = 0.04;Tq_pp = 0.099;
%     mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% 
%     component2 = component.generator.park(mac_data);
%     net.a_bus{69}.set_component(component2);
% 
% %Bus70 SG
%     %S = 60/100;
%     M = 2*6.54; D = 2; Xd  = 1.05; Xd_p = 0.185; Xd_pp = 0.13; Xq  = 0.98; Xq_p = 0.36; Xq_pp = 0.13; X_ls = 0;Td_p = 6.1;Tq_p = 0.3;Td_pp = 0.04;Tq_pp = 0.099;
%     mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% 
%     component3 = component.generator.park(mac_data);
%     net.a_bus{70}.set_component(component3);
% 
% %Bus71 load
%     component4 = component.load.impedance();
%     net.a_bus{71}.set_component(component4);
% 
% %Bus72 load
%     component5 = component.load.impedance();
%     net.a_bus{72}.set_component(component5);
% 
% %Bus73 SG
%     %S = 25/100;
%     M = 2*5.06; D = 2; Xd  = 1.25; Xd_p = 0.232; Xd_pp = 0.12; Xq  = 1.22; Xq_p = 0.715; Xq_pp = 0.12; X_ls = 0.134;Td_p = 4.75;Tq_p = 1.5;Td_pp = 0.06;Tq_pp = 0.21;
%     mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% 
%     component6 = component.generator.park(mac_data);
%     net.a_bus{73}.set_component(component6);
% 
% %Bus74 load
%     component7 = component.load.impedance();
%     net.a_bus{74}.set_component(component7);
% 
% %Bus75 SG
%     %S = 25/100;
%     M = 2*5.06; D = 2; Xd  = 1.25; Xd_p = 0.232; Xd_pp = 0.12; Xq  = 1.22; Xq_p = 0.715; Xq_pp = 0.12; X_ls = 0.134;Td_p = 4.75;Tq_p = 1.5;Td_pp = 0.06;Tq_pp = 0.21;
%     mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% 
%     component8 = component.generator.park(mac_data);
%     net.a_bus{75}.set_component(component8);
% 
% %Bus76 load
%     component9 = component.load.impedance();
%     net.a_bus{76}.set_component(component9);
% 
% %Bus77 load
%     component10 = component.load.impedance();
%     net.a_bus{77}.set_component(component10);
% 
% %Bus78 load
%     component11 = component.load.impedance();
%     net.a_bus{78}.set_component(component11);
% 
% %Bus79 load
%     component12 = component.load.impedance();
%     net.a_bus{79}.set_component(component12);
% 
% %Bus80 load 
%     component13 = component.load.impedance();
%     net.a_bus{80}.set_component(component13);
% 
% %Bus81 load
%     component14 = component.load.impedance();
%     net.a_bus{81}.set_component(component14);


%% Poweer flow calculation

net_83BS.initialize;
powerflow = (net_83BS.V_equilibrium).*conj(net_83BS.I_equilibrium);

% Display the result of simulation
% for pu, Power base is 100MVA.

%check active power
disp('------ACTIVE POWER[MW]------')
disp(real(powerflow)*100)
disp('----------------------------')

%check active power
disp('------REACTIVE POWER[MVAR]------')
disp(imag(powerflow)*100)
disp('----------------------------')

%check power loss
disp('------POWER LOSS[MVA]------')
disp(sum(powerflow)*100)
disp('----------------------------')

%check bus voltage
disp('------BUS VOLTAGE[p.u.]------')
disp(abs(net_83BS.V_equilibrium))
disp('----------------------------')

%check bus voltage' phase
disp('------BUS VOLTAGE PHASE[degree]------')
disp(rad2deg(angle(net_83BS.V_equilibrium)))
disp('----------------------------')

%check bus voltage' phase
disp('------BUS VOLTAGE PHASE[rad]------')
disp(angle(net_83BS.V_equilibrium))
disp('----------------------------')

%% Simulation(fault)
% out = net.simulate([0,10],'fault',{{[1,1.01],64}});
out = net_83BS.simulate([0,10],'fault',{{[1,1.01],75}});
out.plot('para', 'omega')