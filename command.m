clc;clear;
close all;
Angle = [90,180];                               %Angle,Options:90,135,180,270 plus:0,45,225,315
if(exist('SetupStruc','var'))
    [s,sOri,Unmix_s,~] = readData(Angle,ISM_setup);
else
    [s,sOri,Unmix_s,SetupStruc] = readData(Angle,ISM_setup);    % 's' is the muli-channel mixture signal,size:Length*7,
end                                            % 'sOri' is the each single singal of the 1st channel corresponding to the angle,size:Length*N
method = {'DSB'                1;
          'DSB_Mask'           1;
          'MVDR'               1;
          'MVDR_ESB'           1;
          'MVDR_AESB'          1;
          'MVDR_PCA'           1;
          'MVDR_Search'        1;
          'MVDR_AESB_Search'   1;
          'LCMV'               1;
          'LCMV_ESB'           1;
          'LCMV_AESB'          1;
          'LCMV_Search'        1;
          'ICA_funda'          0;
          'ICA_initial'        0;
          'ICA_Sawada'         0;
          'FastICA_HO_Sawada'  0;
          'IVA'                0;
          'IVA_woDR'           0;
          'AuxIVA'             0;
          'OverIVA'            0;
          'OverILRMA'          0;
          'ILRMA_woDR'         0;
          'ILRMA'              0;
          'ILRMA_PF'           0;
          'FastMNMF1'          0;
          'FastMNMF2'          0;
          'FastFCA_AS'         0; %%%% remaining to be written
          'maxSNR'             1;
          %%%%%%% Dereverberation
          'WPE'                0;
          %%%%%%% Compound method
          'cGMM_maxSNR'        1;
          'ALL'                0
          };
SetupStruc.unS = Unmix_s;
[Re,SetupStruc] = Process(method,s,SetupStruc);
[Me] = Cal_metrics(Re,Unmix_s,sOri,SetupStruc);


