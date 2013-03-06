%This script is meant to produce a landscape plot

close
figure(200)
clf
hh = axes;
set(hh,'FontSize',16)


%COBE
%from Maggiore review
loglog([3e-18 1e-16],1.4e-13*[(1e-16/3e-18)^2 1],'k-','linewidth',2)
hold on
text(3e-17,1e-11,'CMB Large','FontSize',18,'Color','k')
text(8e-17,2e-12,'Angle','FontSize',18,'Color','k')

%3G
tt=fill([0.1 1000 1000 0.1],[1e-15 1e-15 1e-12 1e-12],[0.7 0.7 0.7]);
set(tt,'EdgeColor',[0 0 0]);
text(0.2,1e-13,'3G','FontSize',18,'Color',[0 0 0])

%pulsar limit
%from McHugh PRD54 5993 (1996)
%loglog([4e-9 4e-8],[1 1]*1.8e-7,'k--','linewidth',2)
%loglog([4e-8 4e-4],[1 (4e-4/4e-8)^2]*1.8e-7,'k--','linewidth',2)
%text(1e-9,3e-3,'Pulsar','FontSize',18)
%text(1e-9,3e-4,'Limit','FontSize',18)

%from Janet etal, astro-ph/0609013
f0 = [1 1/8 1/20] / (365*24*3600);
lim0 = [1 1 1]*2.0e-8/0.72^2;
loglog(f0,lim0,'g-','linewidth',2)
text(2e-12,1e-7,'Pulsar','FontSize',18,'Color','g')
text(2e-12,2e-8,'Limit','FontSize',18,'Color','g')

if 0 %Cassini limit, Armstrong paper
xx = logspace(-6,-3,10);
yy = 10.^((-1.65 + 0.6) / (-6 + 4) * (log10(xx) + 4) - 0.6) / 0.75^2;
loglog(xx,yy,'g-','linewidth',2)
text(5e-11,1e-0,'Doppler','FontSize',18,'Color','g')
text(5e-11,1e-1,'Tracking','FontSize',18,'Color','g')
end

%LIGO
%from S1 and S3 papers, and my calculations for expectations
%loglog([40 314],[23 23]/0.72^2,'k-','linewidth',3)
%text(600,23,'LIGO S1','FontSize',18,'Color','k')

%loglog([69 156],[1 1]*8.4e-4,'k-','linewidth',3)
%text(600,8.4e-4,'LIGO S3','FontSize',18,'Color','k')

loglog([51 150],[1 1]*6.5e-5,'k-','linewidth',3)
text(600,6.7e-5,'LIGO S4','FontSize',18,'Color','k')

loglog([40 300],[1 1]*8e-10,'k-','linewidth',3)
%fill([40 300 300 40],[8e-10 8e-10 8e-9 8e-9],[0 0 0],'EdgeColor',[0 0 0])
text(600,0.6e-9,'AdvLIGO','FontSize',18,'Color',[0 0 0])

%BBN
%from PBB paper, and ref in there
loglog([1e-10 1e10],[1 1]*1.5e-5,'r-','linewidth',3)
text(1e-5,3e-5,'BBN','FontSize',18,'Color','r')

%CMB + LSS 
%from Smith et al, astroph/0603144
loglog([1e-15 1e10],[1 1]*1.3e-5,'b--','linewidth',3)
text(1.2e-18,3e-5,'CMB & Matter','FontSize',18,'Color','b')
text(1.2e-18,7e-6,'Spectra','FontSize',18,'Color','b')

%Planck projection
%from Smith et al, astroph/0603144
loglog([1e-15 1e10],[1 1]*2.7e-6,'m--','linewidth',3)
text(1.2e-15,1e-6,'Planck','FontSize',18,'Color','m')

%inflation 
%from Maggiore review
%loglog([3e-18 1e-16],1.3e-13*[(1e-16/3e-18)^2 1]*0.7,'--','Color',[0.5 0.5 0.5],'linewidth',2)
%loglog([1e-16 1e9],[1 1]*1.3e-13*0.7,'--','Color',[0.5 0.5 0.5],'linewidth',2)
%text(1e-15,1e-14,'Inflation','FontSize',18,'Color',[0.5 0.5 0.5])
loglog([3e-18 2e-16],7e-11*[1 (3e-18/2e-16)^2]*0.82,'b--','linewidth',3)
loglog([2e-16 1e9],[1 1]*1.3e-14,'b--','linewidth',3)
text(1e-15,4e-14,'Inflation','FontSize',18,'Color','b')

%LISA from Phinney pages
xx = load('LISA20pmrtHzPSD.dat');
omega = (xx(:,2)/4.1e-22).^2 .* (xx(:,1)/100).^3;
loglog(xx(:,1),omega,'m-','linewidth',2)
text(2e-6,4e-11,'LISA','FontSize',18,'Color','m');

if 0%PBB
%from the model based on Buonanno, Maggiore, Ungarelli
ff = [0.01:0.01:0.99 1:0.1:400 1e3 1e5 1e8];
cd ../../PBB
[omega,aa,bb,cc,dd] = pbb(ff,1.5,30,8e10);
loglog(ff,omega/0.72^2,'b--','linewidth',2)
cd ../stoch/stochS4
text(1,1e-11,'Pre-Big-Bang','FontSize',18,'Color','b')
else
[ff,omega] = pbb;
loglog(ff/10,omega,'g--','linewidth',2)
text(0.1,1e-11,'Pre-Big-Bang','FontSize',18,'Color','g')
end

if 0%cosmic string
%from an old slide, modified slightly
%loglog([1e-13 1e-7],[4e-6 3e-8]/0.72^2,'--','Color',[0.5 0.5 0.5],'linewidth',2)
%loglog([1e-7 1e8],[3e-8 0.5e-8]/0.72^2,'--','Color',[0.5 0.5 0.5],'linewidth',2)
cd ../../cosmstr
ff = logspace(-10,10,1000);
yy = zeros(size(ff));
for kk = 1:length(ff)
  yy(kk) = cosmstr(ff(kk),1,1e-1,7e-5,1e-8,1);
end
cut = yy == 0;
ff(cut) = [];
yy(cut) = [];
ff2 = [ff(1) ff];
yy2 = [1e-16 yy];
loglog(ff2,yy2,'r--','linewidth',2)
cd ../stoch/stochS4
text(1e-6,2e-8,'Cosmic','FontSize',18,'Color','r')
text(1e-6,3e-9,'Strings','FontSize',18,'Color','r')
else
[ff2,yy2] = cs;
loglog(ff2,yy2,'r--','linewidth',2)
text(6,2.2e-8,'Cosmic','FontSize',18,'Color','r')
text(2e5,2.2e-8,'Strings','FontSize',18,'Color','r')
end

%LIGO S5
loglog([41.5 169.25],[1 1]*9e-6,'k-','linewidth',4)
%fill([40 300 300 40],[4.9e-7 4.9e-7 5e-6 5e-6],[0 0 0],'EdgeColor',[0 0 0])
text(1e4,3e-7,'LIGO S5','FontSize',18,'Color',[0 0 0])

%magnetars
loglog([10 200 1e3 2e3 2e3],[1e-15 1e-9 3e-9 1e-10 1e-15],'m--','linewidth',2)
text(5e3,3e-13,'Magnetars','FontSize',18,'Color','m')

%white dwarfs
loglog([1e-5 0.012 0.02],[2e-14 2e-11 1e-15],'k-','linewidth',2)
text(5e-7,3e-12,'White','FontSize',18,'Color','k')
text(3e-7,4e-13,'Dwarfs','FontSize',18,'Color','k')


axis([1e-18 1e10 1e-15 1e-3])
grid on
xlabel('Frequency (Hz)','FontSize',16)
ylabel('\Omega_{GW}','FontSize',16)
set(hh,'YTick',[1e-14 1e-12 1e-10 1e-8 1e-6 1e-4])
set(hh,'XTick',[1e-18 1e-16 1e-14 1e-12 1e-10 1e-8 1e-6 1e-4 1e-2 1 1e2 1e4 1e6 1e8 1e10])

gg = scribe.arrow;
set(gg,'X',[0.8 0.683],'Y',[0.71 0.79]);

print -djpeg landscape_PFC.jpg
print -dpng landscape_PFC.png
print -depsc landscape_PFC.eps





