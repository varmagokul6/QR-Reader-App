
fileName = 'listOutput.txt';
% my sample text contains ---> apple, baseball, car, donut, & elephant in single column.
FID = fopen(fileName);
data = textscan(FID,'%s');
fclose(FID);
groceries = string(data{:});


image = imread('storelayout.png');
imageres = imresize(image,1/100);     %add dynamic resolution based on number of store_items
grayimage = rgb2gray(imageres);
bwimage = grayimage < 0.5;
map = binaryOccupancyMap(bwimage);

locations = [];
for i = 1:length(groceries)
    locations = [locations; object_database(groceries(i))];
end
    
store = store_layout;

waypoints = [0, 0];
for i = 1:length(locations)
    row = mod(store(locations(i, :)), 20);
    col = 1 + (store(locations(i, :)) - row)/20;
    waypoints = [waypoints; row, col];
end
waypoints = [waypoints; 0, 0];

prmSimple = mobileRobotPRM(map,100);
%show(prmSimple)



rngState = rng;
prm = mobileRobotPRM(map,100);
size_way = size(waypoints);

for i = 1:(size_way(1)-1)
    startLocation = waypoints(i, :);
    endLocation = waypoints(i+1, :);
    path = findpath(prm,startLocation,endLocation);
    hold on
    show(prm)
end


