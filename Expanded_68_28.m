clear
clc
%% Test 1
% Remove all PV generators in 14BS except Slack Bus -> 13BS (1 Slack, 11 PQ)
% To check the total power consumed.

testNet_14BS = power_network();

shunt = [0,0];
%Base 100MVA

%Bus1: Slack -> #28(only)[0.9583,-0.2323], #28(with 48)[0.9572,-0.2620], #48(with 28)[0.9706, -0.4006]
bus_a = bus.slack(0.9572,-0.2620,shunt);
testNet_14BS.add_bus(bus_a);

%Bus2: PQ Load
bus_b = bus.PQ(-0.217,-0.127,shunt);
testNet_14BS.add_bus(bus_b);

%Bus3: PQ Load
bus_c = bus.PQ(-0.942,-0.19,shunt);
% bus_3 = bus.PV_2comp(0,1.01,[0.942,0.19],shunt);
testNet_14BS.add_bus(bus_c);

%Bus4: PQ Load
bus_d = bus.PQ(-0.478,0.039,shunt);
testNet_14BS.add_bus(bus_d);

%Bus5: PQ Load
bus_e = bus.PQ(-0.076,-0.016,shunt);
% bus_5 = bus.PQ(0.076,0.016,shunt);
testNet_14BS.add_bus(bus_e);

%Bus6: PQ Load
bus_f = bus.PQ(-0.112,-0.075,shunt);
testNet_14BS.add_bus(bus_f);

%Bus7: Transformer
bus_g = bus.PQ(0,0,shunt);
testNet_14BS.add_bus(bus_g);

%Bus8 Zero PQ Load
bus_h = bus.PQ(0,0,shunt);
testNet_14BS.add_bus(bus_h);

%Bus9: PQ Load
bus_i = bus.PQ(-0.295,-0.166,[0, 0.19]);
% bus_9 = bus.PQ(0.295,0.166,[0, 0.19]);
testNet_14BS.add_bus(bus_i);

%Bus10: PQ Load
bus_j = bus.PQ(-0.09,-0.058,shunt);
% bus_9 = bus.PQ(0.09,0.058,shunt);
testNet_14BS.add_bus(bus_j);

%Bus11: PQ Load
bus_k = bus.PQ(-0.035,-0.018,shunt);
% bus_10 = bus.PQ(0.035,0.018,shunt);
testNet_14BS.add_bus(bus_k);

%Bus12: PQ Load
bus_l = bus.PQ(-0.061,-0.016,shunt);
% bus_11 = bus.PQ(0.061,0.016,shunt);
testNet_14BS.add_bus(bus_l);

%Bus13: PQ Load
bus_m = bus.PQ(-0.135,-0.058,shunt);
% bus_12 = bus.PQ(0.135,0.058,shunt);
testNet_14BS.add_bus(bus_m);

%Bus14: PQ Load
bus_n= bus.PQ(-0.149,-0.05,shunt);
% bus_13 = bus.PQ(0.149,0.05,shunt);
testNet_14BS.add_bus(bus_n);

% Branch defination
%Branch 1 to 2 
branch_ab = branch.pi(1,2,[0.01938, 0.05917], 0.0528/2);
testNet_14BS.add_branch(branch_ab);

%Branch 1 to 5 
branch_ae = branch.pi(1,5,[0.05403, 0.22304], 0.0492/2);
testNet_14BS.add_branch(branch_ae);

%Branch 2 to 3 
branch_bc = branch.pi(2,3,[0.04699, 0.19797], 0.0438/2);
testNet_14BS.add_branch(branch_bc);

%Branch 2 to 4
branch_bd = branch.pi(2,4,[0.05811, 0.17632], 0.034/2);
testNet_14BS.add_branch(branch_bd);

%Branch 2 to 5
branch_be = branch.pi(2,5,[0.05695, 0.17388], 0.0346/2);
testNet_14BS.add_branch(branch_be);

%Branch 3 to 4
branch_cd = branch.pi(3,4,[0.06701, 0.17103], 0.0128/2);
testNet_14BS.add_branch(branch_cd);

%Branch 4 to 5
branch_de = branch.pi(4,5,[0.01335, 0.04211], 0);
testNet_14BS.add_branch(branch_de);

%Branch 4 to 7
branch_dg = branch.pi_transformer(4,7,[0, 0.20912],0,0.978,0);
testNet_14BS.add_branch(branch_dg);

%Branch 4 to 9
branch_di = branch.pi_transformer(4,9,[0, 0.55618],0,0.969,0);
testNet_14BS.add_branch(branch_di);

%Branch 5 to 6
branch_ef = branch.pi_transformer(5,6,[0, 0.25202],0,0.932,0);
testNet_14BS.add_branch(branch_ef);

%Branch 6 to 11
branch_fk = branch.pi(6,11,[0.09498, 0.1989],0);
testNet_14BS.add_branch(branch_fk);

%Branch 6 to 12
branch_fl = branch.pi(6,12,[0.12291, 0.25581],0);
testNet_14BS.add_branch(branch_fl);

%Branch 6 to 13
branch_fm = branch.pi(6,13,[0.06615, 0.13027],0);
testNet_14BS.add_branch(branch_fm);

%Branch 7 to 8
branch_gh = branch.pi_transformer(7,8,[0, 0.17615],0,1,0);
testNet_14BS.add_branch(branch_gh);

%Branch 7 to 9
branch_gi = branch.pi_transformer(7,9,[0, 0.11001],0,1,0);
testNet_14BS.add_branch(branch_gi);

%Branch 9 to 10
branch_ik = branch.pi(9,10,[0.03181, 0.0845],0);
testNet_14BS.add_branch(branch_ik);

%Branch 9 to 14
branch_in = branch.pi(9,14,[0.12711, 0.27038],0);
testNet_14BS.add_branch(branch_in);

%Branch 10 to 11
branch_jk = branch.pi(10,11,[0.08205, 0.19207],0);
testNet_14BS.add_branch(branch_jk);

%Branch 12 to 13
branch_lm = branch.pi(12,13,[0.22092, 0.19988],0);
testNet_14BS.add_branch(branch_lm);

%Branch 13 to 14
branch_mn = branch.pi(13,14,[0.17093, 0.34802],0);
testNet_14BS.add_branch(branch_mn);

% Component defination
    
%system frequency
% omega0 = 60*2*pi;

%Bus1 SG (Park)
%S = 615/100;
M = 2*5.148; D = 2; Xd  = 0.8979; Xd_p = 0.2995; Xd_pp = 0.23; Xq  = 0.646; Xq_p = 0.646; Xq_pp = 0.4; X_ls = 0.2396;Td_p = 7.4;Tq_p = 0;Td_pp = 0.03;Tq_pp = 0.033;
mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);

component_a = component.generator.park(mac_data);
testNet_14BS.a_bus{1}.set_component(component_a);

% %Bus2 SG (Park)
% S = 60/100;
% M = 2*6.54; D = 2; Xd  = 1.05; Xd_p = 0.185; Xd_pp = 0.13; Xq  = 0.98; Xq_p = 0.36; Xq_pp = 0.13; X_ls = 0;Td_p = 6.1;Tq_p = 0.3;Td_pp = 0.04;Tq_pp = 0.099;
% mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% component2 = component.generator.LossPark(mac_data);
% testNet_13BS.a_bus{2}.set_component(component2);

%Bus2 Load
component_b = component.load.impedance();
testNet_14BS.a_bus{2}.set_component(component_b);

% %Bus3 SG (Park)
% %S = 60/100;
% M = 2*6.54; D = 2; Xd  = 1.05; Xd_p = 0.185; Xd_pp = 0.13; Xq  = 0.98; Xq_p = 0.36; Xq_pp = 0.13; X_ls = 0;Td_p = 6.1;Tq_p = 0.3;Td_pp = 0.04;Tq_pp = 0.099;
% mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% component3 = component.generator.LossPark(mac_data);
% testNet_13BS.a_bus{3}.set_component(component3);

%Bus3 Load
component_c = component.load.impedance();
testNet_14BS.a_bus{3}.set_component(component_c);

%Bus4 load
component_d = component.load.impedance();
testNet_14BS.a_bus{4}.set_component(component_d);

%Bus5 load
component_e = component.load.impedance();
testNet_14BS.a_bus{5}.set_component(component_e);

% %Bus6 SG (Park)
% %S = 25/100;
% M = 2*5.06; D = 2; Xd  = 1.25; Xd_p = 0.232; Xd_pp = 0.12; Xq  = 1.22; Xq_p = 0.715; Xq_pp = 0.12; X_ls = 0.134;Td_p = 4.75;Tq_p = 1.5;Td_pp = 0.06;Tq_pp = 0.21;
% mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% component6 = component.generator.LossPark(mac_data);
% testNet_13BS.a_bus{6}.set_component(component6);

%Bus6 load
component_f = component.load.impedance();
testNet_14BS.a_bus{6}.set_component(component_f);

%Bus7 load
component_g = component.load.impedance();
testNet_14BS.a_bus{7}.set_component(component_g);

% %Bus8 SG (Park)
% %S = 25/100;
% M = 2*5.06; D = 2; Xd  = 1.25; Xd_p = 0.232; Xd_pp = 0.12; Xq  = 1.22; Xq_p = 0.715; Xq_pp = 0.12; X_ls = 0.134;Td_p = 4.75;Tq_p = 1.5;Td_pp = 0.06;Tq_pp = 0.21;
% mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% component8 = component.generator.park(mac_data);
% testNet_13BS.a_bus{8}.set_component(component8);

%Bus8 load
component_h = component.load.impedance();
testNet_14BS.a_bus{8}.set_component(component_h);

%Bus9 load
component_i = component.load.impedance();
testNet_14BS.a_bus{9}.set_component(component_i);

%Bus10 load
component_j = component.load.impedance();
testNet_14BS.a_bus{10}.set_component(component_j);

%Bus11 load
component_k = component.load.impedance();
testNet_14BS.a_bus{11}.set_component(component_k);

%Bus12 load
component_l= component.load.impedance();
testNet_14BS.a_bus{12}.set_component(component_l);

%Bus13 load 
component_m = component.load.impedance();
testNet_14BS.a_bus{13}.set_component(component_m);

%Bus14 load 
component_n = component.load.impedance();
testNet_14BS.a_bus{14}.set_component(component_n);


%%%%%%%%%% power flow calc %%%%%%%%%%
testNet_14BS.initialize;
powerflow_testNet_14BS = (testNet_14BS.V_equilibrium).*conj(testNet_14BS.I_equilibrium);

%simulation time
%u    = struct('time',[0, 10, 20],'index',5,'u',[1;0]*[0, 0.5, 0.5],'method','zoh','function',[]);
%out = net.simulate([0,20],'input',u);
% Display the result of simulation
% for pu, Power base is 100MVA.

%check active power
disp('------ACTIVE POWER[MW]------')
disp(real(powerflow_testNet_14BS)*100)
disp('----------------------------')

%check active power
disp('------REACTIVE POWER[MVAR]------')
disp(imag(powerflow_testNet_14BS)*100)
disp('----------------------------')

%check power loss
disp('------POWER LOSS[MVA]------')
disp(sum(powerflow_testNet_14BS)*100)
disp('----------------------------')

%check bus voltage
disp('------BUS VOLTAGE[p.u.]------')
disp(abs(testNet_14BS.V_equilibrium))
disp('----------------------------')

%check bus voltage' phase
disp('------BUS VOLTAGE PHASE[rad]------')
disp(angle(testNet_14BS.V_equilibrium))
disp('----------------------------')

%check bus voltage' phase
disp('------BUS VOLTAGE PHASE[degree]------')
disp(rad2deg(angle(testNet_14BS.V_equilibrium)))
disp('----------------------------')

%%%%%%%%%% Result %%%%%%%%%%
% Slack: P=278.2356, Q=111.6663
% total PQ Bus: P=-259, Q=-56.8136
% total line : P=-19.2356, Q=-54.8527
% base: 100MVA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 68BS: Bus28 (PQ Bus)のパラメータを変更
% original Bus 64: P=-0.09, Q=-0.88, Vabs=0.9037, Vangle=-0.2323

baseNet_68BS = network.IEEE68bus();

baseNet_68BS.initialize;
powerflow_baseNet_68BS = (baseNet_68BS.V_equilibrium).*conj(baseNet_68BS.I_equilibrium);

% Display the result of simulation
% for pu, Power base is 100MVA.

%check active power
disp('------ACTIVE POWER[MW]------')
disp(real(powerflow_baseNet_68BS)*100)
disp('----------------------------')

%check active power
disp('------REACTIVE POWER[MVAR]------')
disp(imag(powerflow_baseNet_68BS)*100)
disp('----------------------------')

%check power loss
disp('------POWER LOSS[MVA]------')
disp(sum(powerflow_baseNet_68BS)*100)
disp('----------------------------')

%check bus voltage
disp('------BUS VOLTAGE[p.u.]------')
disp(abs(baseNet_68BS.V_equilibrium))
disp('----------------------------')

%check bus voltage' phase
disp('------BUS VOLTAGE PHASE[rad]------')
disp(angle(baseNet_68BS.V_equilibrium))
disp('----------------------------')

%check bus voltage' phase
disp('------BUS VOLTAGE PHASE[degree]------')
disp(rad2deg(angle(baseNet_68BS.V_equilibrium)))
disp('----------------------------')

%% simul(fault)
out_baseNet_68BS = baseNet_68BS.simulate([0,10],'fault',{{[1,1.01],28}});
out_baseNet_68BS.plot('para', 'omega')

%% Expand 68BS based on Test 1
% original Bus 28: P=-2.06, Q=-0.28, Vabs=0.9897, Vangle=-0.1308

exPand_Bus28 = network.IEEE68bus();

shunt = [0,0];
%Base 100MVA

% %Bus1: Slack
% bus_a = bus.slack(1.06,0,shunt);
% testNet_14BS.add_bus(bus_a);

%Bus69: PQ Load
bus_b = bus.PQ(-0.217,-0.127,shunt);
exPand_Bus28.add_bus(bus_b);

%Bus70: PQ Load
bus_c = bus.PQ(-0.942,-0.19,shunt);
% bus_3 = bus.PV_2comp(0,1.01,[0.942,0.19],shunt);
exPand_Bus28.add_bus(bus_c);

%Bus71: PQ Load
bus_d = bus.PQ(-0.478,0.039,shunt);
exPand_Bus28.add_bus(bus_d);

%Bus72: PQ Load
bus_e = bus.PQ(-0.076,-0.016,shunt);
% bus_5 = bus.PQ(0.076,0.016,shunt);
exPand_Bus28.add_bus(bus_e);

%Bus73: PQ Load
bus_f = bus.PQ(-0.112,-0.075,shunt);
exPand_Bus28.add_bus(bus_f);

%Bus74: Transformer
bus_g = bus.PQ(0,0,shunt);
exPand_Bus28.add_bus(bus_g);

%Bus75 Zero PQ Load
bus_h = bus.PQ(0,0,shunt);
exPand_Bus28.add_bus(bus_h);

%Bus76: PQ Load
bus_i = bus.PQ(-0.295,-0.166,[0, 0.19]);
% bus_9 = bus.PQ(0.295,0.166,[0, 0.19]);
exPand_Bus28.add_bus(bus_i);

%Bus77: PQ Load
bus_j = bus.PQ(-0.09,-0.058,shunt);
% bus_9 = bus.PQ(0.09,0.058,shunt);
exPand_Bus28.add_bus(bus_j);

%Bus78: PQ Load
bus_k = bus.PQ(-0.035,-0.018,shunt);
% bus_10 = bus.PQ(0.035,0.018,shunt);
exPand_Bus28.add_bus(bus_k);

%Bus79: PQ Load
bus_l = bus.PQ(-0.061,-0.016,shunt);
% bus_11 = bus.PQ(0.061,0.016,shunt);
exPand_Bus28.add_bus(bus_l);

%Bus80: PQ Load
bus_m = bus.PQ(-0.135,-0.058,shunt);
% bus_12 = bus.PQ(0.135,0.058,shunt);
exPand_Bus28.add_bus(bus_m);

%Bus81: PQ Load
bus_n= bus.PQ(-0.149,-0.05,shunt);
% bus_13 = bus.PQ(0.149,0.05,shunt);
exPand_Bus28.add_bus(bus_n);

% Branch defination
%Branch 28 to 69
branch_ab = branch.pi(28,69,[0.01938, 0.05917], 0.0528/2);
exPand_Bus28.add_branch(branch_ab);

%Branch 28 to 72
branch_ae = branch.pi(28,72,[0.05403, 0.22304], 0.0492/2);
exPand_Bus28.add_branch(branch_ae);

%Branch 69 to 70
branch_bc = branch.pi(69,70,[0.04699, 0.19797], 0.0438/2);
exPand_Bus28.add_branch(branch_bc);

%Branch 69 to 71
branch_bd = branch.pi(69,71,[0.05811, 0.17632], 0.034/2);
exPand_Bus28.add_branch(branch_bd);

%Branch 69 to 72
branch_be = branch.pi(69,72,[0.05695, 0.17388], 0.0346/2);
exPand_Bus28.add_branch(branch_be);

%Branch 70 to 71
branch_cd = branch.pi(70,71,[0.06701, 0.17103], 0.0128/2);
exPand_Bus28.add_branch(branch_cd);

%Branch 71 to 72
branch_de = branch.pi(71,72,[0.01335, 0.04211], 0);
exPand_Bus28.add_branch(branch_de);

%Branch 71 to 74
branch_dg = branch.pi_transformer(71,74,[0, 0.20912],0,0.978,0);
exPand_Bus28.add_branch(branch_dg);

%Branch 71 to 76
branch_di = branch.pi_transformer(71,76,[0, 0.55618],0,0.969,0);
exPand_Bus28.add_branch(branch_di);

%Branch 72 to 73
branch_ef = branch.pi_transformer(72,73,[0, 0.25202],0,0.932,0);
exPand_Bus28.add_branch(branch_ef);

%Branch 73 to 78
branch_fk = branch.pi(73,78,[0.09498, 0.1989],0);
exPand_Bus28.add_branch(branch_fk);

%Branch 73 to 79
branch_fl = branch.pi(73,79,[0.12291, 0.25581],0);
exPand_Bus28.add_branch(branch_fl);

%Branch 73 to 80
branch_fm = branch.pi(73,80,[0.06615, 0.13027],0);
exPand_Bus28.add_branch(branch_fm);

%Branch 74 to 75
branch_gh = branch.pi_transformer(74,75,[0, 0.17615],0,1,0);
exPand_Bus28.add_branch(branch_gh);

%Branch 74 to 76
branch_gi = branch.pi_transformer(74,76,[0, 0.11001],0,1,0);
exPand_Bus28.add_branch(branch_gi);

%Branch 76 to 77
branch_ik = branch.pi(76,77,[0.03181, 0.0845],0);
exPand_Bus28.add_branch(branch_ik);

%Branch 76 to 81
branch_in = branch.pi(76,81,[0.12711, 0.27038],0);
exPand_Bus28.add_branch(branch_in);

%Branch 77 to 78
branch_jk = branch.pi(77,78,[0.08205, 0.19207],0);
exPand_Bus28.add_branch(branch_jk);

%Branch 79 to 80
branch_lm = branch.pi(79,80,[0.22092, 0.19988],0);
exPand_Bus28.add_branch(branch_lm);

%Branch 80 to 81
branch_mn = branch.pi(80,81,[0.17093, 0.34802],0);
exPand_Bus28.add_branch(branch_mn);

% Component defination
    
%system frequency
% omega0 = 60*2*pi;

% %Bus1 SG (Park)
% %S = 615/100;
% M = 2*5.148; D = 2; Xd  = 0.8979; Xd_p = 0.2995; Xd_pp = 0.23; Xq  = 0.646; Xq_p = 0.646; Xq_pp = 0.4; X_ls = 0.2396;Td_p = 7.4;Tq_p = 0;Td_pp = 0.03;Tq_pp = 0.033;
% mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% component_a = component.generator.park(mac_data);
% testNet_14BS.a_bus{1}.set_component(component_a);

% %Bus2 SG (Park)
% S = 60/100;
% M = 2*6.54; D = 2; Xd  = 1.05; Xd_p = 0.185; Xd_pp = 0.13; Xq  = 0.98; Xq_p = 0.36; Xq_pp = 0.13; X_ls = 0;Td_p = 6.1;Tq_p = 0.3;Td_pp = 0.04;Tq_pp = 0.099;
% mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% component2 = component.generator.LossPark(mac_data);
% testNet_13BS.a_bus{2}.set_component(component2);

%Bus2 Load
component_b = component.load.impedance();
exPand_Bus28.a_bus{69}.set_component(component_b);

% %Bus3 SG (Park)
% %S = 60/100;
% M = 2*6.54; D = 2; Xd  = 1.05; Xd_p = 0.185; Xd_pp = 0.13; Xq  = 0.98; Xq_p = 0.36; Xq_pp = 0.13; X_ls = 0;Td_p = 6.1;Tq_p = 0.3;Td_pp = 0.04;Tq_pp = 0.099;
% mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% component3 = component.generator.LossPark(mac_data);
% testNet_13BS.a_bus{3}.set_component(component3);

%Bus3 Load
component_c = component.load.impedance();
exPand_Bus28.a_bus{70}.set_component(component_c);

%Bus4 load
component_d = component.load.impedance();
exPand_Bus28.a_bus{71}.set_component(component_d);

%Bus5 load
component_e = component.load.impedance();
exPand_Bus28.a_bus{72}.set_component(component_e);

% %Bus6 SG (Park)
% %S = 25/100;
% M = 2*5.06; D = 2; Xd  = 1.25; Xd_p = 0.232; Xd_pp = 0.12; Xq  = 1.22; Xq_p = 0.715; Xq_pp = 0.12; X_ls = 0.134;Td_p = 4.75;Tq_p = 1.5;Td_pp = 0.06;Tq_pp = 0.21;
% mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% component6 = component.generator.LossPark(mac_data);
% testNet_13BS.a_bus{6}.set_component(component6);

%Bus6 load
component_f = component.load.impedance();
exPand_Bus28.a_bus{73}.set_component(component_f);

%Bus7 load
% component_g = component.load.impedance();
% exPand_Bus28.a_bus{74}.set_component(component_g);

% %Bus8 SG (Park)
% %S = 25/100;
% M = 2*5.06; D = 2; Xd  = 1.25; Xd_p = 0.232; Xd_pp = 0.12; Xq  = 1.22; Xq_p = 0.715; Xq_pp = 0.12; X_ls = 0.134;Td_p = 4.75;Tq_p = 1.5;Td_pp = 0.06;Tq_pp = 0.21;
% mac_data = table(Xq, Xq_p, Xq_pp,Xd, Xd_p, Xd_pp,X_ls,Td_p, Tq_p, Td_pp,Tq_pp,M, D);
% component8 = component.generator.park(mac_data);
% testNet_13BS.a_bus{8}.set_component(component8);

%Bus8 load
component_h = component.load.impedance();
exPand_Bus28.a_bus{75}.set_component(component_h);

%Bus9 load
component_i = component.load.impedance();
exPand_Bus28.a_bus{76}.set_component(component_i);

%Bus10 load
component_j = component.load.impedance();
exPand_Bus28.a_bus{77}.set_component(component_j);

%Bus11 load
component_k = component.load.impedance();
exPand_Bus28.a_bus{78}.set_component(component_k);

%Bus12 load
component_l= component.load.impedance();
exPand_Bus28.a_bus{79}.set_component(component_l);

%Bus13 load 
component_m = component.load.impedance();
exPand_Bus28.a_bus{80}.set_component(component_m);

%Bus14 load 
component_n = component.load.impedance();
exPand_Bus28.a_bus{81}.set_component(component_n);

%%%%%%%%%% save model for exPand_Bus28and48 %%%%%%%%%%
exPand_Bus28and48 = exPand_Bus28;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


exPand_Bus28.initialize;
powerflow_exPand_Bus28 = (exPand_Bus28.V_equilibrium).*conj(exPand_Bus28.I_equilibrium);

% Display the result of simulation
% for pu, Power base is 100MVA.

%check active power
disp('------ACTIVE POWER[MW]------')
disp(real(powerflow_exPand_Bus28)*100)
disp('----------------------------')

%check active power
disp('------REACTIVE POWER[MVAR]------')
disp(imag(powerflow_exPand_Bus28)*100)
disp('----------------------------')

%check power loss
disp('------POWER LOSS[MVA]------')
disp(sum(powerflow_exPand_Bus28)*100)
disp('----------------------------')

%check bus voltage
disp('------BUS VOLTAGE[p.u.]------')
disp(abs(exPand_Bus28.V_equilibrium))
disp('----------------------------')

%check bus voltage' phase
disp('------BUS VOLTAGE PHASE[rad]------')
disp(angle(exPand_Bus28.V_equilibrium))
disp('----------------------------')

%check bus voltage' phase
disp('------BUS VOLTAGE PHASE[degree]------')
disp(rad2deg(angle(exPand_Bus28.V_equilibrium)))
disp('----------------------------')

%% simul(fault)
% out_exPand_Bus28 = exPand_Bus28.simulate([0,15],'fault',{{[1,1.01],81},{[3,3.01],73},{[5,5.01],70},{[9,9.01],76}});
% out_exPand_Bus28 = exPand_Bus28.simulate([0,10],'fault',{{[1,1.01],69:81}});
out_exPand_Bus28 = exPand_Bus28.simulate([0,10],'fault',{{[1,1.01],28}});
out_exPand_Bus28.plot('para', 'omega')