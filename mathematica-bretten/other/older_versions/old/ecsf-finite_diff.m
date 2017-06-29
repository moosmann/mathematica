(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



SetDirectory["mathematica"];
ClearSystemCache[];
Needs["DifferentialEquations`NDSolveProblems`"];
Needs["DifferentialEquations`NDSolveUtilities`"];
Needs["DifferentialEquations`InterpolatingFunctionAnatomy`"];


SetOptions[Interpolation,InterpolationOrder->4,PeriodicInterpolation->True];
Options[Interpolation]


SetOptions[NIntegrate,MaxRecursion->20];
Options[NIntegrate,MaxRecursion]


SetOptions[NDSolve`FiniteDifferenceDerivative,DifferenceOrder->6,PeriodicInterpolation->True];
Options[NDSolve`FiniteDifferenceDerivative]


SetOptions[NDSolve,MaxSteps->15000];
Options[NDSolve,{MaxSteps,InterpolationOrder}]


SetOptions[NDSolve`ProcessEquations,MaxSteps->15000];
Options[NDSolve`ProcessEquations,MaxSteps]


Subscript[curve, 0,1][u_]:=10Sqrt[2]{Sin[u],Cos[u]};Subscript[tf, 0,0]=0;
Clear[scg,sp,rcg,rp];

scg[num_,width_,height_,kink_,touch_,asymmetrie_,diagonaldistortion_]:=Module[{u,lo,initialcurve,aoi},
Subscript[tf, num,0]=0;
initialcurve[u_]:=Exp[asymmetrie (Sin[u]-1)]({width (1-kink Cos[u]^2)(Sin[u]),height  (1-touch Cos[u]^2)(Cos[u])}+diagonaldistortion {Sin[u],Sin[u]});
aoi=-1/2 NIntegrate[(initialcurve[u][[1]])(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(\(initialcurve[u]\)[\([\)\(2\)\(]\)]\)\))-(initialcurve[u][[2]])( \!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(\(initialcurve[u]\)[\([\)\(1\)\(]\)]\)\)),{u,0,2\[Pi]},WorkingPrecision->MachinePrecision];
Subscript[curve, num,1][u_]:=10initialcurve[u]/Sqrt[aoi/(2\[Pi])];
Subscript[il, num]=NIntegrate[Sqrt[(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(
\(\*SubscriptBox[\(curve\), \(num, 1\)]\)[u]\)\)).(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(
\(\*SubscriptBox[\(curve\), \(num, 1\)]\)[u]\)\))],{u,0,2\[Pi]},MaxRecursion->20,WorkingPrecision->MachinePrecision];
];

sp[num_,width_,height_,kink_,touch_,asymmetrie_,diagonaldistortion_]:=(
scg[num,width,height,kink,touch,asymmetrie,diagonaldistortion];
ParametricPlot[Subscript[curve, num,1][u],{u,0,2\[Pi]}])

rcg[num_]:=Module[{rpn=7,order=8 ,fpts=44,intord=4,aoi,xint,yint,rpts,xpts,ypts,xxpts,yypts,xexp,yexp,xfk,yfk,xpara,ypara,yfitdat,xfitdat,initialcurve},
Subscript[tf, num,0]=0;
rpts=Table[1+3RandomReal[],{i,0,rpn}];
xpts=Table[{i 2\[Pi]/rpn ,rpts[[i+1]] Sin[i 2\[Pi]/rpn]},{i,0,rpn}];
xpts[[rpn+1,2]]=xpts[[1,2]];
ypts=Table[{i 2\[Pi]/rpn ,rpts[[i+1]] Cos[i 2\[Pi]/rpn]},{i,0,rpn}];
ypts[[rpn+1,2]]=ypts[[1,2]];
xint=Interpolation[xpts,InterpolationOrder->intord];
yint=Interpolation[ypts,InterpolationOrder->intord];
xxpts=Table[{i 2\[Pi]/fpts,xint[i 2\[Pi]/fpts]},{i,0,fpts}];
yypts=Table[{i 2\[Pi]/fpts,yint[i 2\[Pi]/fpts]},{i,0,fpts}];
xexp[u_]:=Sum[Subscript[xfk, i] Cos[i u]+Subscript[xfk, order+i]Sin[i u],{i,0,order}];
yexp[u_]:=Sum[Subscript[yfk, i] Cos[i u]+Subscript[yfk, order+i]Sin[i u],{i,0,order}];
xpara=Table[Subscript[xfk, i] ,{i,0,2 order}];
ypara=Table[Subscript[yfk, i] ,{i,0,2 order}];
xfitdat=FindFit[xxpts,xexp[u],xpara ,u];
yfitdat=FindFit[yypts,yexp[u],ypara ,u];
initialcurve[u_]:={xexp[u]/.xfitdat,yexp[u]/.yfitdat};
aoi=1/2 NIntegrate[Evaluate[(initialcurve[u][[2]])( \!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(\(initialcurve[u]\)[\([\)\(1\)\(]\)]\)\))-(initialcurve[u][[1]])(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(\(initialcurve[u]\)[\([\)\(2\)\(]\)]\)\))],{u,0,2\[Pi]},WorkingPrecision->MachinePrecision];
Subscript[curve, num,1][u_]:=10initialcurve[u]/Sqrt[aoi/(2\[Pi])];
Subscript[il, num]=NIntegrate[Sqrt[Evaluate[(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(
\(\*SubscriptBox[\(curve\), \(num, 1\)]\)[u]\)\)).(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(
\(\*SubscriptBox[\(curve\), \(num, 1\)]\)[u]\)\))]],{u,0,2\[Pi]},WorkingPrecision->MachinePrecision];
];

rp[num_]:=(
rcg[num];
ParametricPlot[Subscript[curve, num,1][u],{u,0,2\[Pi]}]//Print)


Clear[flow,fp];
flow[num_,step_,dt_,grid_:150,opts___]:=Module[{n=grid,grdpts,ugrid,t1,t2,X,Y,xu,yu,xuu,yuu,v,xeqns,yeqns,xic,yic,xicval,yicval},

grdpts=Range[0,n];
ugrid=2\[Pi]/n grdpts;
t1=Subscript[tf, num,step-1];
t2=Subscript[tf, num,step]=t1+dt;

X[t_]=Through[Thread[Subscript[x, grdpts]][t]];
Y[t_]=Through[Thread[Subscript[y, grdpts]][t]];

xu=NDSolve`FiniteDifferenceDerivative[Derivative[1],ugrid,X[t]];
yu=NDSolve`FiniteDifferenceDerivative[Derivative[1],ugrid,Y[t]];
xuu=NDSolve`FiniteDifferenceDerivative[Derivative[2],ugrid,X[t]];
yuu=NDSolve`FiniteDifferenceDerivative[Derivative[2],ugrid,Y[t]];
v=Table[Sqrt[(xu[[i]])^2+(yu[[i]])^2],{i,1,n+1}];

xeqns = Thread[\!\(
\*SubscriptBox[\(\[PartialD]\), \(t\)]\(X[t]\)\) ==v^(-2)(-v^(-2)(xu xuu +yu yuu)xu+xuu)];
yeqns = Thread[\!\(
\*SubscriptBox[\(\[PartialD]\), \(t\)]\(Y[t]\)\) ==v^(-2)(-v^(-2)(xu xuu +yu yuu)yu+yuu)];

xic=Thread[X[t1]==Subscript[curve, num,step][u][[1]]/.u->ugrid];
yic=Thread[Y[t1]==Subscript[curve, num,step][u][[2]]/.u->ugrid];

Subscript[sol, num,step]=
NDSolve[
Join[xeqns,yeqns,xic,yic],Join[Table[Subscript[x, i],{i,0,n}],
Table[Subscript[y, i],{i,0,n}]],
{t,t1,t2},
opts
];

If[step==1,Subscript[gpn, num,1]=grid;Subscript[dmin, num]=Min[Table[dist[num,1,0,i,i-1],{i,1,grid}]],None,Print["Error bei gpn Zuweisung und dmin Ermittelung"]
];

];

fp[num_,step_,dt_,grid___,opts___]:=
Module[{plot,time},
time=Timing[flow[num,step,dt,grid,opts];][[1]];
Print[
"grid points: ",Subscript[gpn, num,step],
", minimum distance at t=0: ", Subscript[dmin, num],
", evaluation time: ",time
];
plot3d[num,step]
];





Clear[plot3d,plot,evoplot,dplot,fplot];
plot3d[num_,step_,stretch_:1]:=
Module[{plots,n=Subscript[gpn, num,step],t1=Subscript[tf, num,step-1],t2=Subscript[tf, num,step]},
plots=Table[{stretch Subscript[x, i][t]/.Subscript[sol, num,step][[1,i+1]],stretch Subscript[y, i][t]/.Subscript[sol, num,step][[1,i+n+2]],t},{i,0,n}
];
ParametricPlot3D[plots//Evaluate,{t,t1,t2},AspectRatio->1,PerformanceGoal->"Speed"]
];

plot[num_,step_,t_,intord_:6]:=
Module[{xint,yint,tt=t,n=Subscript[gpn, num,step]},
xint=Interpolation[
Evaluate[Table[{2\[Pi] i/n,Subscript[x, i][tt]/.Subscript[sol, num,step][[1,i+1]]},{i,0,n}]],InterpolationOrder->intord
];
yint=Interpolation[
Evaluate[Table[{2\[Pi] i/n,Subscript[y, i][tt]/.Subscript[sol, num,step][[1,i+n+2]]},{i,0,n}]],InterpolationOrder->intord
];
ParametricPlot[{xint[u],yint[u]},{u,0,2\[Pi]},PerformanceGoal->"Speed"]
];

evoplot[num_]:=Block[{n=Subscript[steps, num],stretch=3},
Show[
ParametricPlot3D[
{{stretch Subscript[curve, num,1][u][[1]],stretch Subscript[curve, num,1][u][[2]],0},{0,0,Subscript[tf, num,n]}},
{u,0,2\[Pi]},PlotRange->All,PerformanceGoal->"Speed"],
Table[
plot3d[num,i,stretch],{i,1,n}]
]
];

dplot[num_,comp_:1]:=Show[Plot[Evaluate[{\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(\(
\(\*SubscriptBox[\(curve\), \(num, 0\)]\)[u]\)[\([\)\(comp\)\(]\)]\)\),\!\(
\*SubscriptBox[\(\[PartialD]\), \(u, u\)]\(\(
\(\*SubscriptBox[\(curve\), \(num, 0\)]\)[u]\)[\([\)\(comp\)\(]\)]\)\),,2\!\(
\*SubscriptBox[\(\[PartialD]\), \(u, u, u\)]\(\(
\(\*SubscriptBox[\(curve\), \(num, 0\)]\)[u]\)[\([\)\(comp\)\(]\)]\)\)}],{u,0,2\[Pi]}]];

fplot[nn_]:=
Show[Plot[{lt[nn,t]^2/at[nn,t],Subscript[iso, nn][t],4\[Pi]},{t,0,99},PerformanceGoal->"Speed",PlotRange->All],ListPlot[lla[nn]]];


Clear[clength,carea,les,ars,length,area];
clength[num_,step_,opts___]:=Module[{c=\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(
\(\*SubscriptBox[\(curve\), \(num, step\)]\)[u]\)\)},
NIntegrate[Sqrt[Evaluate[(c).(c)]],{u,0,2\[Pi]},opts]];

carea[num_,step_,opts___]:= Module[{c=Subscript[curve, num,step][u]},NIntegrate[(c[[2]])( \!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(c[\([\)\(1\)\(]\)]\)\))-(c[[1]])(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(c[\([\)\(2\)\(]\)]\)\)),{u,0,2\[Pi]},opts]/2];

ars[num_,step_,t_]:=
Block[{n=Subscript[gpn, num,step],grid,x,y,tt,fddf},

grid=Range[1,n];
x=Through[Thread[Subscript[x, grid]][t]]/.Subscript[sol, num,step][[1]];
y=Through[Thread[Subscript[y, grid]][t]]/.Subscript[sol, num,step][[1]];
fddf = NDSolve`FiniteDifferenceDerivative[Derivative[1], Range[0,n]];

Abs[
Total[fddf[x] y -fddf[y]x]/2
]
];

les[num_,step_,t_]:=
Block[{n=Subscript[gpn, num,step],grid,x,y,tt,fddf},

grid=Range[1,n];
x=Through[Thread[Subscript[x, grid]][t]]/.Subscript[sol, num,step][[1]];
y=Through[Thread[Subscript[y, grid]][t]]/.Subscript[sol, num,step][[1]];
fddf = NDSolve`FiniteDifferenceDerivative[Derivative[1], Range[0,n]];

Total[Sqrt[fddf[x]^2 +fddf[y]^2]]

];

length[num_,step_,t_,opts___]:=
Module[{xint,yint,n=Subscript[gpn, num,step]},
xint=Interpolation[
Evaluate[Table[{2\[Pi] i/n,Subscript[x, i][t]/.Subscript[sol, num,step][[1,i+1]]},{i,0,n}]]
];
yint=Interpolation[
Evaluate[Table[{2\[Pi] i/n,Subscript[y, i][t]/.Subscript[sol, num,step][[1,i+n+2]]},{i,0,n}]]
];
NIntegrate[
Evaluate[Sqrt[(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(xint[u]\)\))^2+(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(yint[u]\)\))^2]],{u,0,2\[Pi]},Method->"LocalAdaptive",opts]
];

area[num_,step_,t_,opts___]:=
Module[{xint,yint,n=Subscript[gpn, num,step]},
xint=Interpolation[
Evaluate[Table[{2\[Pi] i/n,Subscript[x, i][t]/.Subscript[sol, num,step][[1,i+1]]},{i,0,n}]],PeriodicInterpolation->True
];
yint=Interpolation[
Evaluate[Table[{2\[Pi] i/n,Subscript[y, i][t]/.Subscript[sol, num,step][[1,i+n+2]]},{i,0,n}]],PeriodicInterpolation->True
];
NIntegrate[yint[u](\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(xint[u]\)\))-xint[u](\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(yint[u]\)\)),{u,0,2\[Pi]},Method->"LocalAdaptive",opts]/2
];




Clear[dist];
dist[num_,step_,t_,i_,j_]:=Sqrt[((Subscript[x, i][t]/.Subscript[sol, num,step][[1,i+1]])-(Subscript[x, j][t]/.Subscript[sol, num,step][[1,j+1]]))^2+((Subscript[y, i][t]/.Subscript[sol, num,step][[1,i+Subscript[gpn, num,step]+2]])-(Subscript[y, j][t]/.Subscript[sol, num,step][[1,j+Subscript[gpn, num,step]+2]]))^2];


Clear[fit];
fit[num_,step_,t_]:=Module[{n,dm,d,i,j,mdp,lmdp,l,ll,umdp,xmdp,ymdp,order,xexp,yexp,xfk,yfk,xpara,ypara,yfitdat,xfitdat},
n=Subscript[gpn, num,step];
dm=Subscript[dmin, num];
mdp=
Reap[
For[
{i=1;j=0},
i<= n,
i++,
d=dist[num,step,t,i,j];
If[
d>= dm,
{Sow[{d,i}];j=i},None,Print["Error at mdp"]
]
]
][[2,1]];
lmdp=Length[mdp];
Subscript[l, 0]=0;
Do[Subscript[l, i]=Subscript[l, i-1]+mdp[[i,1]],{i,1,lmdp}];
ll=Subscript[l, lmdp];
mdp=Prepend[mdp,{0,0}];

xmdp=Table[{2\[Pi] Subscript[l, i]/ll,Subscript[x, mdp[[i+1,2]]][t]/.Subscript[sol, num,step][[1,mdp[[i+1,2]]+1]]},{i,0,lmdp}];
ymdp=Table[{2\[Pi] Subscript[l, i]/ll,Subscript[y, mdp[[i+1,2]]][t]/.Subscript[sol, num,step][[1,n+mdp[[i+1,2]]+2]]},{i,0,lmdp}];

order=16-IntegerPart[t/8];
xexp[u_]:=Sum[Subscript[xfk, i] Cos[i u]+Subscript[xfk, order+i]Sin[i u],{i,0,order}];
yexp[u_]:=Sum[Subscript[yfk, i] Cos[i u]+Subscript[yfk, order+i]Sin[i u],{i,0,order}];
xpara=Table[Subscript[xfk, i] ,{i,0,2 order}];
ypara=Table[Subscript[yfk, i] ,{i,0,2 order}];
xfitdat=FindFit[xmdp,xexp[u],xpara ,u];
yfitdat=FindFit[ymdp,yexp[u],ypara ,u];

Subscript[curve, num,step+1][u_]:={xexp[u]/.xfitdat,yexp[u]/.yfitdat};

Subscript[gpn, num,step+1]=lmdp
];

fip[num_,step_,t_,order___]:=
(
fit[num,step,t,order];
Show[
ParametricPlot[Subscript[curve, num,step+1][u],{u,0,2\[Pi]}],
ListPlot[Table[Subscript[curve, num,step+1][2\[Pi]/Subscript[gpn, num,step+1]i],{i,0,Subscript[gpn, num,step+1]}],PlotStyle->{Red}]
]
)





Clear[erf,erf2];
erf2[num_,step_,t_]:=
Block[{n=Subscript[gpn, num,step],grid,x,y,tt,fddf},

grid=Range[1,n];
x=Through[Thread[Subscript[x, grid]][t]]/.Subscript[sol, num,step][[1]];
y=Through[Thread[Subscript[y, grid]][t]]/.Subscript[sol, num,step][[1]];
fddf = NDSolve`FiniteDifferenceDerivative[Derivative[1], Range[0,n]];

1000Abs[
Total[fddf[x] y -fddf[y]x]/2+2\[Pi] t -200\[Pi]
]
];

erf[num_,step_,t_]:=1000Abs[carea[num,step]+2\[Pi] Subscript[tf, num,step-1]-(ars[num,step,t]+2\[Pi] t)]


Clear[staf];
staf[num_,step_,n_:150,t0_:0,opts___]:=Module[{grdpts,ugrid,X,Y,xu,xuu,yu,yuu,v,xeqns,yeqns,xic,yic},

grdpts=Range[0,n];
ugrid=2\[Pi]/n grdpts;

X[t_]=Through[Thread[Subscript[x, grdpts]][t]];
Y[t_]=Through[Thread[Subscript[y, grdpts]][t]];

xu=NDSolve`FiniteDifferenceDerivative[Derivative[1],ugrid,X[t]];
yu=NDSolve`FiniteDifferenceDerivative[Derivative[1],ugrid,Y[t]];
xuu=NDSolve`FiniteDifferenceDerivative[Derivative[2],ugrid,X[t]];
yuu=NDSolve`FiniteDifferenceDerivative[Derivative[2],ugrid,Y[t]];
v=Table[Sqrt[(xu[[i]])^2+(yu[[i]])^2],{i,1,n+1}];

xeqns = Thread[\!\(
\*SubscriptBox[\(\[PartialD]\), \(t\)]\(X[t]\)\) ==v^(-2)(-v^(-2)(xu xuu +yu yuu)xu+xuu)];
yeqns = Thread[\!\(
\*SubscriptBox[\(\[PartialD]\), \(t\)]\(Y[t]\)\) ==v^(-2)(-v^(-2)(xu xuu +yu yuu)yu+yuu)];

xic=Thread[X[t0]==Subscript[curve, num,step][u][[1]]/.u->ugrid];
yic=Thread[Y[t0]==Subscript[curve, num,step][u][[2]]/.u->ugrid];

First[
NDSolve`ProcessEquations[
Join[xeqns,yeqns,xic,yic],
Join[Thread[Subscript[x, grdpts]],Thread[Subscript[y, grdpts]]],
t,opts]
]
];


Clear[itf];
itf[num_,step_,n_,t1_,opts___]:=Module[{state,t,t2,a,d},
Subscript[gpn, num,step]=n;
state=staf[num,step,n,t1,opts];
t2=Catch[
For[t=t1,t<=100  ,t++,
If[t==100,t=99+ars[num,step,99]/2/\[Pi]];
NDSolve`Iterate[state, t];
Subscript[sol, num,step] = {NDSolve`ProcessSolutions[state]};
If[step==1,
Subscript[dmin, num]=Min[Table[dist[num,1,0,i,i-1],{i,1,n}]];
];
If[t>99,Throw[t];Break[]];
d=erf[num,step,t];
If[d>= 1,Print["Fit at t = ",t,", erf = ", d];Throw[t];,None,Print["Error at exit function, error = ",d,", t = ",t];Throw[t];
];
];
];
Subscript[tf, num,step]=t2
];


Clear[evo];
evo[num_,opts___]:=Module[{step,t=0,grid=150},
For[step=1,t<100,step++,
t=itf[num,step,grid,t,opts];
If[t>99,Break[]];
grid=fit[num,step,t];
];
Subscript[steps, num]=step
]


Clear[invar];
invar[num_,step_,n_,t1_,t2_,opts___]:=Module[{t,state,fsol,vv,vars,grid,XX,YY,xu,yu,invariant},
state=staf[num,step,n,t1,opts];
NDSolve`Iterate[state,t2];
fsol={NDSolve`ProcessSolutions[state]};
vv=state@"DependentVariables";
vars=Through[vv[t]];

grid=Range[0,n];
XX[t_]=Through[Thread[Subscript[x, grid]][t]];
YY[t_]=Through[Thread[Subscript[y, grid]][t]];
xu=NDSolve`FiniteDifferenceDerivative[Derivative[1],grid,XX[t],DifferenceOrder->6];
yu=NDSolve`FiniteDifferenceDerivative[Derivative[1],grid,YY[t],DifferenceOrder->6];
invariant=1000(Sum[YY[t][[i]] xu[[i]]-XX[t][[i]] yu[[i]],{i,1,n}]/2+2\[Pi] t-200\[Pi]);

InvariantErrorPlot[invariant,vars,t,fsol]
]


Clear[lt,at,lla,llafit,l];
lt[num_,t_]:=
Module[{i,l},
For[i=1,i<=Subscript[steps, num],i++,
If[Subscript[tf, num,i-1]<= t <= Subscript[tf, num,i],Break[]
]
];
les[num,i,t]
];

at[num_,t_]:=
Module[{i,l},
For[i=1,i<=Subscript[steps, num],i++,
If[Subscript[tf, num,i-1]<= t <= Subscript[tf, num,i],Break[]
]
];
ars[num,i,t]
];

lla[num_]:=
Append[Table[{t,lt[num,t]^2/at[num,t]},{t,0,99}],{100,4\[Pi]}];

llafit[num_]:=Fit[lla[num],Thread[t^Range[0,20]],t];

Subscript[l, num_][t_]:=Sqrt[Subscript[iso, num][t](200\[Pi]-2\[Pi] t)]



