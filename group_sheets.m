clc
clear
close all

fn='Chemin du document';        
data=[];
opt=detectImportOptions(fn,"VariableNamingRule","preserve");
% wanted/need options code/fixup here...
shts=sheetnames(fn);
for i=1:numel(shts)
  ftable = readtable(fn,opt,'Sheet',shts(i));
  data=[data;ftable];
end

writetable(data, "Chemin du nouveau document");

