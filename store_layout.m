

image = imread('storelayout.png');

J = imresize(image,1/100);

grayimage = rgb2gray(J);
bwimage = grayimage < 0.5;
graph = binaryOccupancyMap(bwimage);

show(graph);
hold on

x = checkOccupancy(graph);

y = find(x);

x_coord = 0;
y_coord = 0;
hold on
for i = 1:12
    plot(x_coord, y_coord, 
end

