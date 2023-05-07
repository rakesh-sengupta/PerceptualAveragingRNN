% Copyright (C) 2022 Rakesh Sengupta
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>.

% -*- texinfo -*-
% @deftypefn {} {@var{retval} =} new_summary_plot (@var{input1}, @var{input2})
%
% @seealso{}
% @end deftypefn

% Author: Rakesh Sengupta <rakesh@CCC-SRU>
% Created: 2022-12-14

function new_summary_plot (file)

load(file)
  
  
h = figure;
plot(params.nstim,squeeze(squeeze(params.memberPerf(1,:,1))),"linewidth",2)
hold on
plot(params.nstim,squeeze(squeeze(params.memberPerf(2,:,1))),'r',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.memberPerf(3,:,1))),'g',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.memberPerf(4,:,1))),'c',"linewidth",2)
xlabel('Stimulus presentation time (ms)')
ylabel('input-output distance (Hamming)')
legend('setsize 4','setsize 8','setsize 12','setsize 32','location','northeastoutside')
title('Member Task (low inhibition \beta = 0.02)')
%h = get(gcf, "currentaxes")
set(gca, "fontsize", 12, "linewidth",2)
%print -djpg results_member_task.jpg

h = figure;
plot(params.nstim,squeeze(squeeze(params.memberPerf(1,:,2))),"linewidth",2)
hold on
plot(params.nstim,squeeze(squeeze(params.memberPerf(2,:,2))),'r',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.memberPerf(3,:,2))),'g',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.memberPerf(4,:,2))),'c',"linewidth",2)
xlabel('Stimulus presentation time (ms)')
ylabel('input-output distance (Hamming)')
legend('setsize 4','setsize 8','setsize 12','setsize 32','location','northeastoutside')
%legend (g, "location", "northeastoutside");
title('Member Task (medium inhibition \beta = 0.05)')
%h = get(gcf, "currentaxes")
set(gca, "fontsize", 12, "linewidth",2)
%print -djpg results_member_task1.jpg

h = figure;
plot(params.nstim,squeeze(squeeze(params.memberPerf(1,:,3))),"linewidth",2)
hold on
plot(params.nstim,squeeze(squeeze(params.memberPerf(2,:,3))),'r',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.memberPerf(3,:,3))),'g',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.memberPerf(4,:,3))),'c',"linewidth",2)
xlabel('Stimulus presentation time (ms)')
ylabel('input-output distance (Hamming)')
legend('setsize 4','setsize 8','setsize 12','setsize 32','location','northeastoutside')
title('Member Task (medium inhibition \beta = 0.07)')
%h = get(gcf, "currentaxes")
set(gca, "fontsize", 12, "linewidth",2)
%print -djpg results_member_task2.jpg


h = figure;
plot(params.nstim,squeeze(squeeze(params.memberPerf(1,:,4))),"linewidth",2)
hold on
plot(params.nstim,squeeze(squeeze(params.memberPerf(2,:,4))),'r',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.memberPerf(3,:,4))),'g',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.memberPerf(4,:,4))),'c',"linewidth",2)
xlabel('Stimulus presentation time (ms)')
ylabel('input-output distance (Hamming)')
legend('setsize 4','setsize 8','setsize 12','setsize 32','location','northeastoutside')
title('Member Task (high inhibition \beta = 0.1)')
%h = get(gcf, "currentaxes")
set(gca, "fontsize", 12, "linewidth",2)
%print -djpg results_member_task3.jpg


h = figure;
plot(params.nstim,squeeze(squeeze(params.meanPerf(1,:,1))),"linewidth",2)
hold on
plot(params.nstim,squeeze(squeeze(params.meanPerf(2,:,1))),'r',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf(3,:,1))),'g',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf(4,:,1))),'c',"linewidth",2)
xlabel('Stimulus presentation time (ms)')
ylabel('input-output Correlation')
ylim([0 1])
legend('setsize 4','setsize 8','setsize 12','setsize 32','location','northeastoutside')
title('Mean Task (low inhibition \beta = 0.02)')
%h = get(gcf, "currentaxes")
set(gca, "fontsize", 12, "linewidth",2)
%print -djpg results_mean1_task.jpg

h = figure;
plot(params.nstim,squeeze(squeeze(params.meanPerf(1,:,2))),"linewidth",2)
hold on
plot(params.nstim,squeeze(squeeze(params.meanPerf(2,:,2))),'r',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf(3,:,2))),'g',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf(4,:,2))),'c',"linewidth",2)
xlabel('Stimulus presentation time (ms)')
ylabel('input-output Correlation')
ylim([0 1])
legend('setsize 4','setsize 8','setsize 12','setsize 32','location','northeastoutside')
title('Mean Task (medium inhibition \beta = 0.05)')
%h = get(gcf, "currentaxes")
set(gca, "fontsize", 12, "linewidth",2)
%print -djpg results_mean1_task1.jpg

h = figure;
plot(params.nstim,squeeze(squeeze(params.meanPerf(1,:,3))),"linewidth",2)
hold on
plot(params.nstim,squeeze(squeeze(params.meanPerf(2,:,3))),'r',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf(3,:,3))),'g',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf(4,:,3))),'c',"linewidth",2)
xlabel('Stimulus presentation time (ms)')
ylabel('input-output Correlation')
ylim([0 1])
legend('setsize 4','setsize 8','setsize 12','setsize 32','location','northeastoutside')
title('Mean Task (medium inhibition \beta = 0.07)')
%h = get(gcf, "currentaxes")
set(gca, "fontsize", 12, "linewidth",2)
%print -djpg results_mean1_task2.jpg



h = figure;
plot(params.nstim,squeeze(squeeze(params.meanPerf(1,:,4))),"linewidth",2)
hold on
plot(params.nstim,squeeze(squeeze(params.meanPerf(2,:,4))),'r',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf(3,:,4))),'g',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf(4,:,4))),'c',"linewidth",2)
xlabel('Stimulus presentation time (ms)')
ylabel('input-output Correlation')
ylim([0 1])
legend('setsize 4','setsize 8','setsize 12','setsize 32','location','northeastoutside')
title('Mean Task (high inhibition \beta = 0.1)')
%h = get(gcf, "currentaxes")
set(gca, "fontsize", 12, "linewidth",2)
%print -djpg results_mean1_task3.jpg

h = figure;
plot(params.nstim,squeeze(squeeze(params.meanPerf1(1,:,1))),"linewidth",2)
hold on
plot(params.nstim,squeeze(squeeze(params.meanPerf1(2,:,1))),'r',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf1(3,:,1))),'g',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf1(4,:,1))),'c',"linewidth",2)
xlabel('Stimulus presentation time (ms)')
ylabel('input-output Correlation')
ylim([0 1])
legend('setsize 4','setsize 8','setsize 12','setsize 32','location','northeastoutside')
title('Mean Task (low inhibition \beta = 0.02)')
%h = get(gcf, "currentaxes")
set(gca, "fontsize", 12, "linewidth",2)
%print -djpg results_mean2_task.jpg

h = figure;
plot(params.nstim,squeeze(squeeze(params.meanPerf1(1,:,2))),"linewidth",2)
hold on
plot(params.nstim,squeeze(squeeze(params.meanPerf1(2,:,2))),'r',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf1(3,:,2))),'g',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf1(4,:,2))),'c',"linewidth",2)
xlabel('Stimulus presentation time (ms)')
ylabel('input-output Correlation')
ylim([0 1])
legend('setsize 4','setsize 8','setsize 12','setsize 32','location','northeastoutside')
title('Mean Task (medium inhibition \beta = 0.05)')
%h = get(gcf, "currentaxes")
set(gca, "fontsize", 12, "linewidth",2)
%print -djpg results_mean2_task1.jpg

h = figure;
plot(params.nstim,squeeze(squeeze(params.meanPerf1(1,:,3))),"linewidth",2)
hold on
plot(params.nstim,squeeze(squeeze(params.meanPerf1(2,:,3))),'r',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf1(3,:,3))),'g',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf1(4,:,3))),'c',"linewidth",2)
xlabel('Stimulus presentation time (ms)')
ylabel('input-output Correlation')
ylim([0 1])
legend('setsize 4','setsize 8','setsize 12','setsize 32','location','northeastoutside')
title('Mean Task (medium inhibition \beta = 0.07)')
%h = get(gcf, "currentaxes")
set(gca, "fontsize", 12, "linewidth",2)
%print -djpg results_mean2_task2.jpg



h = figure;
plot(params.nstim,squeeze(squeeze(params.meanPerf1(1,:,4))),"linewidth",2)
hold on
plot(params.nstim,squeeze(squeeze(params.meanPerf1(2,:,4))),'r',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf1(3,:,4))),'g',"linewidth",2)
plot(params.nstim,squeeze(squeeze(params.meanPerf1(4,:,4))),'c',"linewidth",2)
xlabel('Stimulus presentation time (ms)')
ylabel('input-output Correlation')
ylim([0 1])
legend('setsize 4','setsize 8','setsize 12','setsize 32','location','northeastoutside')
title('Mean Task (high inhibition \beta = 0.1)')
%h = get(gcf, "currentaxes")
set(gca, "fontsize", 12, "linewidth",2)
%print -djpg results_mean2_task3.jpg






