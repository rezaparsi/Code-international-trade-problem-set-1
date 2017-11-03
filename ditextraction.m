% Distance extraction for 40 countries in HW1 international trade
% Reza Parsi




clear;
clc;

% Main Folder

savepath = fullfile('/Users/rezaparsi/Desktop/International Trade/P1/');



distnace = table2cell(readtable(fullfile(savepath,'Raw Data/distance.csv')));

% List of the countries needed for the HW

c40 = {'ARE','AUS','AUT','BEL','BRA','CAN','CHE','CHL','CHN','CZE',...
    'DEU','DNK','ESP','FRA','GBR','HKG','HUN','IDN','IND','IRL',...
    'IRN','ITA','JPN','KOR','MEX','MYS','NGA','NLD','NOR',...
    'POL','QAT','RUS','SAU','SGP','SWE','THA','TUR','USA','VNM','ZAF'}';

index1 = zeros(224,40);
index2 = zeros(224,40);

for ii = 1:40 
k = strfind(distance(:,1),c40(ii));
for i = 1:length(k)
if isempty(k{i})
k{i} = 0;
end
end
k = cell2mat(k);
index1(:,ii) = find(k==1);
end


for ii = 1:40 
k = strfind(distance(:,2),c40(ii));
for i = 1:length(k)
if isempty(k{i})
k{i} = 0;
end
end
k = cell2mat(k);
index2(:,ii) = find(k==1);
end


index = intersect(index1,index2);
dni   = distance(index,3);
dni   = reshape(dni,40,40);
dni   = cell2mat(dni);

csvwrite(fullfile(savepath,'Clean Data/dni-matrix-version.csv'),dni);



