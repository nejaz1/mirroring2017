function recipe_mirroring2017
%% Open-source data from the Mirroring paper 
% 
% Recipe file requires the following code repositories:
%   - plotlib:      https://github.com/nejaz1/plotlib
%   - dataframe:    https://github.com/jdiedrichsen/dataframe
%
% Email:    nejaz2@uwo.ca


%% 0. Data Format
%  Mirror movements and fine-finger function was measured in N=53 patients
%  and N=14 age-matched controls. Participants were measured within the
%  first 2 weeks after stroke and at weeks 4, 12, 24 and 52 over the year.
%  Data is saved in a dataframe format in the file 'data_mirroring2017.mat'
%  Each row in the dataframe corresponds to one measurement per
%  participant/session. The dataframe has the fields:
%       SN          : unique subject identifier
%       grp         : group identifier 
%                           1. control
%                           2. non-paretic hand
%                           3. paretic hand
%       week        : week at which measurement was carried out
%       severe      : severity of patient group which was used for paretic
%                     analysis in paper
%                           0. not-defined
%                           1. patients with MEP at week 2
%                           2. patients with no MEP at week 2
%       FM          : Fugl-Meyer score on the upper-limb (out of 66)
%       mvf         : average strength on the hand (in newtons)
%       mm          : degree of mirroring on this hand
%       mm_hom      : degree of mirroring on homologous pair on this hand
%       mm_het      : degree of mirroring on heterologous pair on this hand
%       mm_pattern  : pattern of mirroring across fingers of the hand
%       ens         : degree of enslaving on this hand
D = load('./data_mirroring2017.mat');
disp(D);


%% 1. Plot time-changes in mirroring and enslaving for paretic finger presses (Fig 2)
%   - get data for controls and paretic hand
T   = getrow(D,ismember(D.grp,[1 3]));
sty = style.custom({'green','blue'});

plt.subplot(121);
plt.line(T.week,T.mm,'style',sty,'split',T.grp,'leg',{'controls','non-paretic'});
plt.labels('week',{'force on passive fingers','(N per 1N applied force)'},'mirroring');

plt.subplot(122);
plt.line(T.week,T.ens,'style',sty,'split',T.grp,'leg','none');
plt.labels('week',[],'enslaving');

plt.set(gcf,'match','ylim','ytick',-6:1:0,'yticklabel',round(exp(-6:1:0),3));

