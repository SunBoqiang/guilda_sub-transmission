clear
clc
%% 68BS: Bus28 and Bus48 (PQ Bus)のパラメータを変更
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
out_baseNet_68BS = baseNet_68BS.simulate([0,20],'fault',{{[10,10.01],48}});
out_baseNet_68BS.plot('para', 'omega')

%% Expand 68BS based on Test 1
% original Bus 28: P=-2.06, Q=-0.28, Vabs=0.9897, Vangle=-7.4968
% original Bus 48: P=-2.412, Q=-0.022, Vabs=1.0337, Vangle=-0.3207

exPand_Bus28and48 = network.IEEE68bus();

shunt = [0,0];
%Base 100MVA

% %Bus1: Slack
% bus_a = bus.slack(1.06,0,shunt);
% testNet_14BS.add_bus(bus_a);

%Bus69: PQ Load
bus_b = bus.PQ(-0.217,-0.127,shunt);
exPand_Bus28and48.add_bus(bus_b);

%Bus70: PQ Load
bus_c = bus.PQ(-0.942,-0.19,shunt);
% bus_3 = bus.PV_2comp(0,1.01,[0.942,0.19],shunt);
exPand_Bus28and48.add_bus(bus_c);

%Bus71: PQ Load
bus_d = bus.PQ(-0.478,0.039,shunt);
exPand_Bus28and48.add_bus(bus_d);

%Bus72: PQ Load
bus_e = bus.PQ(-0.076,-0.016,shunt);
% bus_5 = bus.PQ(0.076,0.016,shunt);
exPand_Bus28and48.add_bus(bus_e);

%Bus73: PQ Load
bus_f = bus.PQ(-0.112,-0.075,shunt);
exPand_Bus28and48.add_bus(bus_f);

%Bus74: Transformer
bus_g = bus.PQ(0,0,shunt);
exPand_Bus28and48.add_bus(bus_g);

%Bus75 Zero PQ Load
bus_h = bus.PQ(0,0,shunt);
exPand_Bus28and48.add_bus(bus_h);

%Bus76: PQ Load
bus_i = bus.PQ(-0.295,-0.166,[0, 0.19]);
% bus_9 = bus.PQ(0.295,0.166,[0, 0.19]);
exPand_Bus28and48.add_bus(bus_i);

%Bus77: PQ Load
bus_j = bus.PQ(-0.09,-0.058,shunt);
% bus_9 = bus.PQ(0.09,0.058,shunt);
exPand_Bus28and48.add_bus(bus_j);

%Bus78: PQ Load
bus_k = bus.PQ(-0.035,-0.018,shunt);
% bus_10 = bus.PQ(0.035,0.018,shunt);
exPand_Bus28and48.add_bus(bus_k);

%Bus79: PQ Load
bus_l = bus.PQ(-0.061,-0.016,shunt);
% bus_11 = bus.PQ(0.061,0.016,shunt);
exPand_Bus28and48.add_bus(bus_l);

%Bus80: PQ Load
bus_m = bus.PQ(-0.135,-0.058,shunt);
% bus_12 = bus.PQ(0.135,0.058,shunt);
exPand_Bus28and48.add_bus(bus_m);

%Bus81: PQ Load
bus_n= bus.PQ(-0.149,-0.05,shunt);
% bus_13 = bus.PQ(0.149,0.05,shunt);
exPand_Bus28and48.add_bus(bus_n);




%Bus82: PQ Load
bus_b1 = bus.PQ(-0.217,-0.127,shunt);
exPand_Bus28and48.add_bus(bus_b1);

%Bus83: PQ Load
bus_c1 = bus.PQ(-0.942,-0.19,shunt);
exPand_Bus28and48.add_bus(bus_c1);

%Bus84: PQ Load
bus_d1 = bus.PQ(-0.478,0.039,shunt);
exPand_Bus28and48.add_bus(bus_d1);

%Bus85: PQ Load
bus_e1 = bus.PQ(-0.076,-0.016,shunt);
exPand_Bus28and48.add_bus(bus_e1);

%Bus86: PQ Load
bus_f1 = bus.PQ(-0.112,-0.075,shunt);
exPand_Bus28and48.add_bus(bus_f1);

%Bus87: Transformer
bus_g1 = bus.PQ(0,0,shunt);
exPand_Bus28and48.add_bus(bus_g1);

%Bus88 Zero PQ Load
bus_h1 = bus.PQ(0,0,shunt);
exPand_Bus28and48.add_bus(bus_h1);

%Bus89: PQ Load
bus_i1 = bus.PQ(-0.295,-0.166,[0, 0.19]);
exPand_Bus28and48.add_bus(bus_i1);

%Bus90: PQ Load
bus_j1 = bus.PQ(-0.09,-0.058,shunt);
exPand_Bus28and48.add_bus(bus_j1);

%Bus91: PQ Load
bus_k1 = bus.PQ(-0.035,-0.018,shunt);
exPand_Bus28and48.add_bus(bus_k1);

%Bus92: PQ Load
bus_l1 = bus.PQ(-0.061,-0.016,shunt);
exPand_Bus28and48.add_bus(bus_l1);

%Bus93: PQ Load
bus_m1 = bus.PQ(-0.135,-0.058,shunt);
exPand_Bus28and48.add_bus(bus_m1);

%Bus94: PQ Load
bus_n1 = bus.PQ(-0.149,-0.05,shunt);
exPand_Bus28and48.add_bus(bus_n1);

%%%%%%%%%% Branch defination %%%%%%%%%%
%Branch 28 to 69
branch_ab = branch.pi(28,69,[0.01938, 0.05917], 0.0528/2);
exPand_Bus28and48.add_branch(branch_ab);

%Branch 28 to 72
branch_ae = branch.pi(28,72,[0.05403, 0.22304], 0.0492/2);
exPand_Bus28and48.add_branch(branch_ae);

%Branch 69 to 70
branch_bc = branch.pi(69,70,[0.04699, 0.19797], 0.0438/2);
exPand_Bus28and48.add_branch(branch_bc);

%Branch 69 to 71
branch_bd = branch.pi(69,71,[0.05811, 0.17632], 0.034/2);
exPand_Bus28and48.add_branch(branch_bd);

%Branch 69 to 72
branch_be = branch.pi(69,72,[0.05695, 0.17388], 0.0346/2);
exPand_Bus28and48.add_branch(branch_be);

%Branch 70 to 71
branch_cd = branch.pi(70,71,[0.06701, 0.17103], 0.0128/2);
exPand_Bus28and48.add_branch(branch_cd);

%Branch 71 to 72
branch_de = branch.pi(71,72,[0.01335, 0.04211], 0);
exPand_Bus28and48.add_branch(branch_de);

%Branch 71 to 74
branch_dg = branch.pi_transformer(71,74,[0, 0.20912],0,0.978,0);
exPand_Bus28and48.add_branch(branch_dg);

%Branch 71 to 76
branch_di = branch.pi_transformer(71,76,[0, 0.55618],0,0.969,0);
exPand_Bus28and48.add_branch(branch_di);

%Branch 72 to 73
branch_ef = branch.pi_transformer(72,73,[0, 0.25202],0,0.932,0);
exPand_Bus28and48.add_branch(branch_ef);

%Branch 73 to 78
branch_fk = branch.pi(73,78,[0.09498, 0.1989],0);
exPand_Bus28and48.add_branch(branch_fk);

%Branch 73 to 79
branch_fl = branch.pi(73,79,[0.12291, 0.25581],0);
exPand_Bus28and48.add_branch(branch_fl);

%Branch 73 to 80
branch_fm = branch.pi(73,80,[0.06615, 0.13027],0);
exPand_Bus28and48.add_branch(branch_fm);

%Branch 74 to 75
branch_gh = branch.pi_transformer(74,75,[0, 0.17615],0,1,0);
exPand_Bus28and48.add_branch(branch_gh);

%Branch 74 to 76
branch_gi = branch.pi_transformer(74,76,[0, 0.11001],0,1,0);
exPand_Bus28and48.add_branch(branch_gi);

%Branch 76 to 77
branch_ik = branch.pi(76,77,[0.03181, 0.0845],0);
exPand_Bus28and48.add_branch(branch_ik);

%Branch 76 to 81
branch_in = branch.pi(76,81,[0.12711, 0.27038],0);
exPand_Bus28and48.add_branch(branch_in);

%Branch 77 to 78
branch_jk = branch.pi(77,78,[0.08205, 0.19207],0);
exPand_Bus28and48.add_branch(branch_jk);

%Branch 79 to 80
branch_lm = branch.pi(79,80,[0.22092, 0.19988],0);
exPand_Bus28and48.add_branch(branch_lm);

%Branch 80 to 81
branch_mn = branch.pi(80,81,[0.17093, 0.34802],0);
exPand_Bus28and48.add_branch(branch_mn);




%Branch 48 to 82
branch_ab1 = branch.pi(48,82,[0.01938, 0.05917], 0.0528/2);
exPand_Bus28and48.add_branch(branch_ab1);

%Branch 48 to 85
branch_ae1 = branch.pi(48,85,[0.05403, 0.22304], 0.0492/2);
exPand_Bus28and48.add_branch(branch_ae1);

%Branch 82 to 83
branch_bc1 = branch.pi(82,83,[0.04699, 0.19797], 0.0438/2);
exPand_Bus28and48.add_branch(branch_bc1);

%Branch 82 to 84
branch_bd1 = branch.pi(82,84,[0.05811, 0.17632], 0.034/2);
exPand_Bus28and48.add_branch(branch_bd1);

%Branch 82 to 85
branch_be1 = branch.pi(82,85,[0.05695, 0.17388], 0.0346/2);
exPand_Bus28and48.add_branch(branch_be1);

%Branch 83 to 84
branch_cd1 = branch.pi(83,84,[0.06701, 0.17103], 0.0128/2);
exPand_Bus28and48.add_branch(branch_cd1);

%Branch 84 to 85
branch_de1 = branch.pi(84,85,[0.01335, 0.04211], 0);
exPand_Bus28and48.add_branch(branch_de1);

%Branch 84 to 87
branch_dg1 = branch.pi_transformer(84,87,[0, 0.20912],0,0.978,0);
exPand_Bus28and48.add_branch(branch_dg1);

%Branch 84 to 89
branch_di1 = branch.pi_transformer(84,89,[0, 0.55618],0,0.969,0);
exPand_Bus28and48.add_branch(branch_di1);

%Branch 85 to 86
branch_ef1 = branch.pi_transformer(85,86,[0, 0.25202],0,0.932,0);
exPand_Bus28and48.add_branch(branch_ef1);

%Branch 86 to 91
branch_fk1 = branch.pi(86,91,[0.09498, 0.1989],0);
exPand_Bus28and48.add_branch(branch_fk1);

%Branch 86 to 92
branch_fl1 = branch.pi(86,92,[0.12291, 0.25581],0);
exPand_Bus28and48.add_branch(branch_fl1);

%Branch 86 to 93
branch_fm1 = branch.pi(86,93,[0.06615, 0.13027],0);
exPand_Bus28and48.add_branch(branch_fm1);

%Branch 87 to 88
branch_gh1 = branch.pi_transformer(87,88,[0, 0.17615],0,1,0);
exPand_Bus28and48.add_branch(branch_gh1);

%Branch 87 to 89
branch_gi1 = branch.pi_transformer(87,89,[0, 0.11001],0,1,0);
exPand_Bus28and48.add_branch(branch_gi1);

%Branch 89 to 90
branch_ik1 = branch.pi(89,90,[0.03181, 0.0845],0);
exPand_Bus28and48.add_branch(branch_ik1);

%Branch 89 to 94
branch_in1 = branch.pi(89,94,[0.12711, 0.27038],0);
exPand_Bus28and48.add_branch(branch_in1);

%Branch 90 to 91
branch_jk1 = branch.pi(90,91,[0.08205, 0.19207],0);
exPand_Bus28and48.add_branch(branch_jk1);

%Branch 92 to 93
branch_lm1 = branch.pi(92,93,[0.22092, 0.19988],0);
exPand_Bus28and48.add_branch(branch_lm1);

%Branch 93 to 94
branch_mn1 = branch.pi(93,94,[0.17093, 0.34802],0);
exPand_Bus28and48.add_branch(branch_mn1);


%%%%%%%%%% Component defination %%%%%%%%%%
    
%system frequency
% omega0 = 60*2*pi;

%Bus69 Load
component_b = component.load.impedance();
% component_b = component.load.power();
exPand_Bus28and48.a_bus{69}.set_component(component_b);

%Bus70 Load
component_c = component.load.impedance();
% component_c = component.load.power();
exPand_Bus28and48.a_bus{70}.set_component(component_c);

%Bus71 load
component_d = component.load.impedance();
% component_d = component.load.power();
exPand_Bus28and48.a_bus{71}.set_component(component_d);

%Bus72 load
component_e = component.load.impedance();
% component_e = component.load.power();
exPand_Bus28and48.a_bus{72}.set_component(component_e);

%Bus73 load
component_f = component.load.impedance();
% component_f = component.load.power();
exPand_Bus28and48.a_bus{73}.set_component(component_f);

%Bus74 load
% component_g = component.load.impedance();
% component_g = component.empty();
% exPand_Bus28and48.a_bus{74}.set_component(component_g);

%Bus75 load
% component_h = component.load.impedance();
% component_h = component.empty();
% exPand_Bus28and48.a_bus{75}.set_component(component_h);

%Bus76 load
component_i = component.load.impedance();
% component_i = component.load.power();
exPand_Bus28and48.a_bus{76}.set_component(component_i);

%Bus77 load
component_j = component.load.impedance();
% component_j = component.load.power();
exPand_Bus28and48.a_bus{77}.set_component(component_j);

%Bus78 load
component_k = component.load.impedance();
% component_k = component.load.power();
exPand_Bus28and48.a_bus{78}.set_component(component_k);

%Bus79 load
component_l= component.load.impedance();
% component_l= component.load.power();
exPand_Bus28and48.a_bus{79}.set_component(component_l);

%Bus80 load 
component_m = component.load.impedance();
% component_m = component.load.power();
exPand_Bus28and48.a_bus{80}.set_component(component_m);

%Bus81 load 
component_n = component.load.impedance();
% component_n = component.load.power();
exPand_Bus28and48.a_bus{81}.set_component(component_n);





%Bus82 Load
component_b1 = component.load.impedance();
% component_b1 = component.load.power();
exPand_Bus28and48.a_bus{82}.set_component(component_b1);

%Bus83 Load
component_c1 = component.load.impedance();
% component_c1 = component.load.power();
exPand_Bus28and48.a_bus{83}.set_component(component_c1);

%Bus84 load
component_d1 = component.load.impedance();
% component_d1 = component.load.power();
exPand_Bus28and48.a_bus{84}.set_component(component_d1);

%Bus85 load
component_e1 = component.load.impedance();
% component_e1 = component.load.power();
exPand_Bus28and48.a_bus{85}.set_component(component_e1);

%Bus86 load
component_f1 = component.load.impedance();
% component_f1 = component.load.power();
exPand_Bus28and48.a_bus{86}.set_component(component_f1);

%Bus87 load
% component_g1 = component.load.impedance();
% component_g1 = component.empty();
% exPand_Bus28and48.a_bus{87}.set_component(component_g1);

%Bus88 load
% component_h1 = component.load.impedance();
% component_h1 = component.empty();
% exPand_Bus28and48.a_bus{88}.set_component(component_h1);

%Bus89 load
component_i1 = component.load.impedance();
% component_i1 = component.load.power();
exPand_Bus28and48.a_bus{89}.set_component(component_i1);

%Bus90 load
component_j1 = component.load.impedance();
% component_j1 = component.load.power();
exPand_Bus28and48.a_bus{90}.set_component(component_j1);

%Bus91 load
component_k1 = component.load.impedance();
% component_k1 = component.load.power();
exPand_Bus28and48.a_bus{91}.set_component(component_k1);

%Bus92 load
component_l1 = component.load.impedance();
% component_l1 = component.load.power();
exPand_Bus28and48.a_bus{92}.set_component(component_l1);

%Bus93 load 
component_m1 = component.load.impedance();
% component_m1 = component.load.power();
exPand_Bus28and48.a_bus{93}.set_component(component_m1);

%Bus94 load 
component_n1 = component.load.impedance();
% component_n1 = component.load.power();
exPand_Bus28and48.a_bus{94}.set_component(component_n1);



exPand_Bus28and48.initialize;
powerflow_exPand_Bus28and48 = (exPand_Bus28and48.V_equilibrium).*conj(exPand_Bus28and48.I_equilibrium);

% Display the result of simulation
% for pu, Power base is 100MVA.

%check active power
disp('------ACTIVE POWER[MW]------')
disp(real(powerflow_exPand_Bus28and48)*100)
disp('----------------------------')

%check active power
disp('------REACTIVE POWER[MVAR]------')
disp(imag(powerflow_exPand_Bus28and48)*100)
disp('----------------------------')

%check power loss
disp('------POWER LOSS[MVA]------')
disp(sum(powerflow_exPand_Bus28and48)*100)
disp('----------------------------')

%check bus voltage
disp('------BUS VOLTAGE[p.u.]------')
disp(abs(exPand_Bus28and48.V_equilibrium))
disp('----------------------------')

%check bus voltage' phase
disp('------BUS VOLTAGE PHASE[rad]------')
disp(angle(exPand_Bus28and48.V_equilibrium))
disp('----------------------------')

%check bus voltage' phase
disp('------BUS VOLTAGE PHASE[degree]------')
disp(rad2deg(angle(exPand_Bus28and48.V_equilibrium)))
disp('----------------------------')

%% simul(fault)
% out_exPand_Bus28and48 = exPand_Bus28and48.simulate([0,20],'fault',{{[10,10.01],48}});
out_exPand_Bus28and48 = exPand_Bus28and48.simulate([0,15],'fault',{{[1,1.01],94},{[3,3.01],86},{[5,5.01],83},{[9,9.01],89}});
% out_exPand_Bus28and48 = exPand_Bus28and48.simulate([0,20],'fault',{{[10,10.01],82:94}});
out_exPand_Bus28and48.plot('para', 'omega')