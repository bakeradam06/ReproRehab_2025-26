% week 1 main script

%% prompt 1: 
% Write a for loop to iterate from 1 to 10, printing out results

x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

for index = 1:length(x)
    disp(x(index));
end

%% prompt 2: 
% Write a for loop to iterate from 10 to 30, printing out numbers that 
% are divisible by 5

y = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,...
    26, 27, 28, 29, 30];

for index2 = 1:length(y)
    if mod(y(index2),5) == 0 
        disp(y(index2))
    end
end

% lesson (this took me a while): 
% the mod command says "ok, take first argument (which here is (y(index2)),
% divide it by the second (Here, its 5), and see if there is any remainder.
% If no remainder, then print the number (as it's divisible by 5.
% Otherwise, move on with ya life.

% i did not use AI to write this code, but learned of the mod command
% through matlab copilot after asking if i could ask matlab in code whether
% i could denote if something was a whole number or not. Then, i applied
% that mod command it returned to this situation

%% prompt 3: 
% Write a while loop that counts from 1 to 10, and stops after 10 iterations, 
% printing out results

z = 0;
a = 1;

while z < 10
    z = a + z;
    disp(z)
end