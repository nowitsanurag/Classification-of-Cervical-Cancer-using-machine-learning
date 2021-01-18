   load SCORE_GLCM
   data = score1;  
    trainset=[data(1:18,:);data(24:49,:);data(55:129,:);data(135:175,:);data(181:202,:)];
    testset=[data(19:23,:);data(50:54,:);data(130:134,:);data(176:180,:);data(203:207,:)];
        % image 1-23 : allergic, 24-54 : bacterial, 55-134 : normal, 135-180 : viral
        % image 181-207 : normal red
class=zeros(1,182);
class(1,1:18)=1; % sending all data related to trainset of allergic to class1
class(1,19:44)=2; %sending all data related to trainset of bacterial to class2
class(1,41:119)=3; %sending all data related to trainset of normal eyes to class3
class(1,116:160)=4; %sending all data related to trainset of viral to class4
class(1,157:182)=5;%sending all data related to trainset of normal red eyes to class5
result = multisvm1(trainset, class, testset);
counter=1;
for k=1:length(result)
    switch result(k)
        case 1
            expression=1;  %allergic
        case 2
            expression=2;   %bacterial
        case 3
            expression=3;   %normal eye
        case 4
            expression=4;    %viral
        case 5
            expression=5;    %normalred
        
    end
    t1{counter}=expression;
    counter=counter+1;

end
output=zeros(5,25);
for l1=1:25
    output(t1{l1},l1)=1;
end
target = zeros(5,25);
target(1,1:5) = 1;
target(2,6:10) = 2;
target(3,11:15) = 3;
target(4,16:20) = 4;
target(5,20:25) = 5;
plotconfusion(target,output)