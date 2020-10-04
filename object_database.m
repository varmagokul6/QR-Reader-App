clear
clc
aisle = 'A';
perpAisle = 2;
itemLib = readtable('Item Library.xlsx');
posMatrix(size(itemLib,1),size(itemLib,2)) = ['A'];
for i = 1:size(itemLib,2)-perpAisle
    posMatrix(:,i)= [char(aisle+fix(i/2))];
end
for n = 1:perpAisle
    posMatrix(:,size(itemLib,2)-perpAisle+n)= [char(posMatrix(1,size(itemLib,2)-perpAisle)+n)];
end