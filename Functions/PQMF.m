function C = PQMF()

fid=fopen('filters.txt');
Rdata = textscan(fid, '%s');
Rdata=Rdata{1};
a=[];
for j=1:length(Rdata)
  if length(Rdata{j})==1
      a=cat(1,a,str2num(Rdata{j}));
  end
end
fclose(fid);
C = str2double(Rdata)';
C(1) = 0;
c2 = flip(C);
C = [C c2(2:end)];


end 