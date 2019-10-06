roadwidth=3;
eyeheight=2;viewangle = 2;roadwidth=3;lookahead=3;sensangle=10;
vehi=[0,2;1,1;1,-1;-1,-1;-1,1;0,2;nan,nan;-sensangle,lookahead;sensangle,lookahead]';
plot(vehi(1,:),vehi(2,:)); axis equal ;axis([-10,10,-10,10]);
