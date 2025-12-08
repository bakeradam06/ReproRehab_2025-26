% week5 main

% For the code below:
% Break the single function into smaller functions where each has a single purpose
% Give meaningful and consistent names to functions and variables
% Add input validation to ensure arguments are of expected types and in valid ranges
% Use argument blocks or default parameter values to make inputs flexible
% Add docstrings or comments explaining the purpose, inputs, outputs, and behavior of each function


%% unedited code we were initially given
% (my edits are below this section):
% 
function [s, avg, max_val, min_val] = calc(vals)
    s = 0;
    for i = 1:length(vals)
        s = s + vals(i);
     end

    avg = s/length(vals);
    max_val = max(vals);
    min_val = min(vals);

    fprintf('Sum: %d Average: %.2f Maximum: %d Minimum: %d', s, avg, max_val, min_val);
end

values = [5, 10, 15, 20];
calc(values);

% -------------------------------------------------------- %
%% AB: comments below are my notes re the code.
% helps me figure out how to break the larger function into smaller functions.

%% get
        % ------------------ %
        function [s] = calc1() % defining function, inputs & outputs
            s = 0; % define s
        end
        % ------------------ %

        values = [5, 10, 15, 20]; % list the values to be used in the function
        [s] = calc1(); % run function. s returns 0 to start.

%% loop
    
        % ------------------ %
        function [s, values] = loop(s, values)
            for i = 1:length(values) % initiate loop, length of vals variable
                s = s + values(i); % iterate over ever instace of s starting with 0
            end 
        end
        % ------------------ %

        [s, values] = loop(s, values); % run function

%% calc
      
         % ------------------ %
        function [avg, max_val, min_val] = calculate(values,s)
            avg = s/length(values); % calculate avg of s/length(vals)
            max_val = max(values); % find max 
            min_val = min(values); % find min 
        end
         % ------------------ %

        [avg, max_val, min_val] = calculate(values, s); % run function
    
%% disp

        % ------------------ %
        function [s, avg, max_val, min_val] = printing(s, avg, max_val, min_val)
            d = fprintf(' Sum: %d | Average: %.2f | Maximum: %d | Minimum: %d', s, avg, max_val, min_val); % print avg, min, max
        end
        % ------------------ %

        [d] = printing(s, avg, max_val, min_val);