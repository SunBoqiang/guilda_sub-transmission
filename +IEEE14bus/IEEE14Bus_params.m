%% Generator (Park model) - Dynamical parameters
% base: 100MVA

% Gen 1 (Synchronous generator): (Pg = 2.324, Vg = 1.06, Qg_max = 9.9, Qg_min = -9.9)
S_n1 = 615/100;
X_ls1 = 0.2396;
% R_a1 = 0;
Xd1 = 0.8979; 
Xd_p1 = 0.2995; 
Xd_pp1 = 0.23; 
Td_p1 = 7.4;
Td_pp1 = 0.03;
Xq1  = 0.646; 
Xq_p1 = 0.646; 
Xq_pp1 = 0.4; 
Tq_p1 = 0;
Tq_pp1 = 0.033;
D1 = 2; 
M1 = 2*5.148; % 2*H

% Gen 2 (Synchronous generator): (Pg = 0.4, Vg = 1.045, Qg_max = 0.5, Qg_min = -0.4)
S_n2 = 60/100;
X_ls2 = 0;
% R_a2 = 0.0031;
Xd2 = 1.05; 
Xd_p2 = 0.185; 
Xd_pp2 = 0.13; 
Td_p2 = 6.1;
Td_pp2 = 0.04;
Xq2 = 0.98; 
Xq_p2 = 0.36; 
Xq_pp2 = 0.13; 
Tq_p2 = 0.3;
Tq_pp2 = 0.099;
D2 = 2; 
M2 = 2*6.54;

% Gen 3 (Synchronous compensator): (Pg = 0, Vg = 1.01, Qg_max = 0.4, Qg_min = 0.0)
S_n3 = 60/100;
X_ls3 = 0;
R_a3 = 0.0031;
Xd3 = 1.05; 
Xd_p3 = 0.185; 
Xd_pp3 = 0.13; 
Td_p3 = 6.1;
Td_pp3 = 0.04;
Xq3 = 0.98; 
Xq_p3 = 0.36; 
Xq_pp3 = 0.13; 
Tq_p3 = 0.3;
Tq_pp3 = 0.099;
D3 = 2; 
M3 = 2*6.54; 

% Gen 4 (Synchronous compensator): (Pg = 0, Vg = 1.07, Qg_max = 0.24, Qg_min = -0.06)
S_n4 = 25/100;
X_ls4 = 0.134;
% R_a4 = 0.0041;
Xd4 = 1.25; 
Xd_p4 = 0.232; 
Xd_pp4 = 0.12; 
Td_p4 = 4.75;
Td_pp4 = 0.06;
Xq4 = 1.22; 
Xq_p4 = 0.715; 
Xq_pp4 = 0.12; 
Tq_p4 = 1.5;
Tq_pp4 = 0.21;
M4 = 2*5.06; 
D4 = 2; 

% Gen 5 (Synchronous compensator): (Pg = 0, Vg = 1.09, Qg_max = 0.24, Qg_min = -0.06)
S_n5 = 25/100;
X_ls5 = 0.134;
R_a5 = 0.0041;
Xd5 = 1.25; 
Xd_p5 = 0.232; 
Xd_pp5 = 0.12; 
Td_p5 = 4.75;
Td_pp5 = 0.06;
Xq5 = 1.22; 
Xq_p5 = 0.715; 
Xq_pp5 = 0.12; 
Tq_p5 = 1.5;
Tq_pp5 = 0.21;
M5 = 2*5.06;
D5 = 2; 

%% AVR parameters
% AVR 1: (Vr_max = 9.9, Vr_min = 0)
Ka_1 = 200;
Ta_1 = 0.02;
Kf_1 = 0.0012;
Tf_1 = 1.0;
Ke_1 = 1.0;
Te_1 = 0.19;
Tr_1 = 0.001;
Ae_1 = 0.0006;
Be_1 = 0.9;

% AVR 2: (Vr_max = 2.05, Vr_min = 0)
Ka_2 = 20;
Ta_2 = 0.02;
Kf_2 = 0.001;
Tf_2 = 1.0;
Ke_2= 1.0;
Te_2 = 1.98;
Tr_2 = 0.001;
Ae_2 = 0.0006;
Be_2 = 0.9;

% AVR 3: (Vr_max = 1.7, Vr_min = 0)
Ka_3 = 20;
Ta_3 = 0.02;
Kf_3 = 0.001;
Tf_3 = 1.0;
Ke_3 = 1.0;
Te_3 = 1.98;
Tr_3 = 0.001;
Ae_3 = 0.0006;
Be_3 = 0.9;

% AVR 4: (Vr_max = 2.2, Vr_min = 1.0)
Ka_4 = 20;
Ta_4 = 0.02;
Kf_4 = 0.001;
Tf_4 = 1.0;
Ke_4 = 1.0;
Te_4 = 0.7;
Tr_4 = 0.001;
Ae_4 = 0.0006;
Be_4 = 0.9;

% AVR 5: (Vr_max = 2.2, Vr_min = 1.0)
Ka_5 = 20;
Ta_5 = 0.02;
Kf_5 = 0.001;
Tf_5 = 1.0;
Ke_5 = 1.0;
Te_5 = 0.7;
Tr_5 = 0.001;
Ae_5 = 0.0006;
Be_5 = 0.9;

%% Turbine governer parameters
% for Gen1 and Gen2 (P_max = 1.2, P_min = 0.3)
R_droop = 0.02; %Droop
Ts_gov = 0.1;
Tc_gov = 0.45;
T3_gov = 0;
T4_gov = 0;
T5_gov = 50.0;

%% PSS parameters
% for AVR 1 (Vs_max = 0.1, Vs_min = -0.1)
Kw = 5.0;
Tw = 10.0;
T1_pss = 0.28;
T2_pss = 0.02;
T3_pss = 0.28;
T4_pss = 0.02;

%% Bus and Transmission line parameters
% Buses
% Bus 1 (Slack)
Bus1_kV = 69.0;
Bus1_Pl = 0;
Bus1_Ql = 0;

% Bus 2 (PV)
Bus2_kV = 69.0;
Bus2_Pl = 0.217;
Bus2_Ql = 0.127;

% Bus 3 (PV)
Bus3_kV = 69.0;
Bus3_Pl = 0.942;
Bus3_Ql = 0.19;

% Bus 4 (PQ)
Bus4_kV = 69.0;
Bus4_Pl = 0.478;
Bus4_Ql = -0.039;

% Bus 5 (PQ)
Bus5_kV = 13.8;
Bus5_Pl = 0.076;
Bus5_Ql = 0.016;

% Bus 6 (PV)
Bus6_kV = 13.8;
Bus6_Pl = 0.112;
Bus6_Ql = 0.075;

% Bus 7 (PQ)
Bus7_kV = 13.8;
Bus7_Pl = 0;
Bus7_Ql = 0;

% Bus 8 (PV)
Bus8_kV = 18.0;
Bus8_Pl = 0;
Bus8_Ql = 0;

% Bus 9 (PQ)
Bus9_kV = 13.8;
Bus9_Pl = 0.295;
Bus9_Ql = 0.166;
Bus9_shunt = 0.19;

% Bus 10 (PQ)
Bus10_kV = 13.8;
Bus10_Pl = 0.09;
Bus10_Ql = 0.058;

% Bus 11 (PQ)
Bus11_kV = 13.8;
Bus11_Pl = 0.035;
Bus11_Ql = 0.018;

% Bus 12 (PQ)
Bus12_kV = 13.8;
Bus12_Pl = 0.061;
Bus12_Ql = 0.016;

% Bus 13 (PQ)
Bus13_kV = 13.8;
Bus13_Pl = 0.135;
Bus13_Ql = 0.058;

% Bus 14 (PQ)
Bus14_kV = 13.8;
Bus14_Pl = 0.149;
Bus14_Ql = 0.05;

%% Transmission lines
% Bus 1 to Bus 2
R_trl12 = 0.01938;
X_trl12 = 0.05917;
B_trl12 = 0.0528;

% Bus 1 to Bus 5
R_trl15 = 0.05403;
X_trl15 = 0.22304;
B_trl15 = 0.0492;

% Bus 2 to Bus 3
R_trl23 = 0.04699;
X_trl23 = 0.19797;
B_trl23 = 0.0438;

% Bus 2 to Bus 4
R_trl24 = 0.05811;
X_trl24 = 0.17632;
B_trl24 = 0.034;

% Bus 2 to Bus 5
R_trl25 = 0.05695;
X_trl25 = 0.17388;
B_trl25 = 0.0346;

% Bus 3 to Bus 4
R_trl34 = 0.06701;
X_trl34 = 0.17103;
B_trl34 = 0.0128;

% Bus 4 to Bus 5
R_trl45 = 0.01335;
X_trl45 = 0.04211;
B_trl45 = 0.0;

% Bus 4 to Bus 7 (transformer)
R_trl47 = 0.0;
X_trl47 = 0.20912;
B_trl47 = 0.0;
m_trl47 = 0.978;

% Bus 4 to Bus 9 (transformer)
R_trl49 = 0.0;
X_trl49 = 0.55618;
B_trl49 = 0.0;
m_trl49 = 0.969;

% Bus 5 to Bus 6 (transformer)
R_trl56 = 0.0;
X_trl56 = 0.25202;
B_trl56 = 0.0;
m_trl56 = 0.932;

% Bus 6 to Bus 11
R_trl611 = 0.09498;
X_trl611 = 0.1989;
B_trl611 = 0.0;

% Bus 6 to Bus 12
R_trl612 = 0.12291;
X_trl612 = 0.25581;
B_trl612 = 0.0;

% Bus 6 to Bus 13
R_trl613 = 0.06615;
X_trl613 = 0.13027;
B_trl613 = 0.0;

% Bus 7 to Bus 8 (transformer)
R_trl78 = 0.0;
X_trl78 = 0.17615;
B_trl78 = 0.0;
m_trl78 = 1.0;

% Bus 7 to Bus 9
R_trl79 = 0.0;
X_trl79 = 0.11001;
B_trl79 = 0.0;

% Bus 9 to Bus 10
R_trl910 = 0.03181;
X_trl910 = 0.0845;
B_trl910 = 0.0;

% Bus 9 to Bus 14
R_trl914 = 0.12711;
X_trl914 = 0.27038;
B_trl914 = 0.0;

% Bus 10 to Bus 11
R_trl1011 = 0.08205;
X_trl1011 = 0.19207;
B_trl1011 = 0.0;

% Bus 12 to Bus 13
R_trl1213 = 0.22092;
X_trl1213 = 0.19988;
B_trl1213 = 0.0;

% Bus 13 to Bus 14
R_trl1314 = 0.17093;
X_trl1314 = 0.34802;
B_trl1314 = 0.0;
