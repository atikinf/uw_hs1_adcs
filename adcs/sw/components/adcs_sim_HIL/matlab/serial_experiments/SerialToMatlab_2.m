% %% Extrinsic declarations to bypass code generation in simulink
% coder.extrinsic('serial');

%% Persistent Variables

% persistent s cmd_persistent;
% if isempty(s)
%     s = serial('COM8');
%     fopen(s);
%     s
% end
instrreset;

% Whatever port the uart2serial adapter is connected to
s = serial('COM5');
s.InputBufferSize = 100;
fopen(s);
s
s.ReadAsyncMode = 'continuous';
s.Terminator = '';


% Persists between method calls in case of no update in data
% if isempty(cmd_persistent)
% end

%% Reading shit hell yeah

mtq_packet_length = 6;
% length of packet meta data (3 bytes)
packet_meta_length = 3;

% data packet header of mtq commands
mtq_header = [252, 6, 126];

%% Async Solution

cmd_persistent = [0, 0, 0];

pause(0.5);
while(1)
    out = unicode2native(fscanf(s));
    header_indices = strfind(out, mtq_header);
    if ~isempty(header_indices)
        header_index = header_indices(1);
        if header_index + mtq_packet_length < length(out)
            cmd_persistent(1) = out(header_index + packet_meta_length);
            cmd_persistent(2) = out(header_index + packet_meta_length + 1);
            cmd_persistent(3) = out(header_index + packet_meta_length + 2);
        end
        cmd_out = cmd_persistent;
        cmd_out
    end
end

%% Proposed Solution 1
% while(1)
%     %read_result = fread(s, 1);
%     while fread(s, 1) ~= 252 % skips until packet start
%         %read_result = fread(s, 1);
%     end
%     packet_length = fread(s, 1);
%     packet_id = fread(s, 1);
%     data = rot90(fread(s, packet_length - 3));
%     if packet_id == 126
%         cmd_persistent(1) = data(1);
%         cmd_persistent(2) = data(2);
%         cmd_persistent(3) = data(2);
%     end
% %     read_result = fread(s, 1);
%     
%     cmd_out = cmd_persistent;
%     cmd_out
% end
    
%% Initial Solution
% read_result = fread(s, 100);
% read_result = rot90(read_result); % matrix of rows to matrix of cols
% 
% header_indices = strfind(read_result, mtq_header);
% header_index = header_indices(1);
% class(header_index)
% 
% if ~isempty(header_index) && header_index + mtq_packet_length < length(read_result)
%     cmd_persistent(1) = read_result(header_index + packet_meta_length);
%     cmd_persistent(2) = read_result(header_index + packet_meta_length + 1);
%     cmd_persistent(3) = read_result(header_index + packet_meta_length + 2);
% end



fclose(s);
delete(s);
instrreset;