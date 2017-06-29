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



(* ::Input:: *)
SetDirectory["/home/julian/mathematica/ecsf_new_trial"];
ClearSystemCache[];
Needs["Splines`"];
Needs["DifferentialEquations`NDSolveProblems`"];
Needs["DifferentialEquations`NDSolveUtilities`"];
Needs["DifferentialEquations`InterpolatingFunctionAnatomy`"];


(* ::Input:: *)
SetOptions[Interpolation, InterpolationOrder -> 4, PeriodicInterpolation -> True];
Options[Interpolation]


(* ::Input:: *)
SetOptions[NIntegrate, MaxRecursion -> 20];
Options[NIntegrate, MaxRecursion]


(* ::Input:: *)
SetOptions[NDSolve`FiniteDifferenceDerivative, DifferenceOrder -> 6, PeriodicInterpolation -> True];
Options[NDSolve`FiniteDifferenceDerivative]


(* ::Input:: *)
SetOptions[NDSolve, MaxSteps -> 15000];
Options[NDSolve, {MaxSteps, InterpolationOrder}]


(* ::Input:: *)
SetOptions[NDSolve`ProcessEquations, MaxSteps -> 15000];
Options[NDSolve`ProcessEquations, MaxSteps]


(* ::Input:: *)
Clear[pcg,rpcg];
pcg[num_,xy__List]:=
Module[{pts,n,spline,
fpts=50,order=8,xpts,ypts,xexp,yexp,xfk,yfk,xpara,ypara,xfitdat,yfitdat,
initialcurve,area,length,centroid},

pts=xy;
n=Length[pts];
pts=Append[pts,First[pts]];
pts=Join[{pts[[-3]],pts[[-2]]},pts,{pts[[2]],pts[[3]]}];
spline=SplineFit[pts,Cubic];

xpts=Table[{i 2\[Pi]/fpts,spline[2+(n)i/fpts][[1]]},{i,0,fpts}];
ypts=Table[{i 2\[Pi]/fpts,spline[2+(n)i/fpts][[2]]},{i,0,fpts}];
xexp[u_]:=Sum[Subscript[xfk, i] Cos[i u]+Subscript[xfk, order+i]Sin[i u],{i,0,order}];
yexp[u_]:=Sum[Subscript[yfk, i] Cos[i u]+Subscript[yfk, order+i]Sin[i u],{i,0,order}];
xpara=Table[Subscript[xfk, i] ,{i,0,2 order}];
ypara=Table[Subscript[yfk, i] ,{i,0,2 order}];
xfitdat=FindFit[xpts,xexp[u],xpara ,u];
yfitdat=FindFit[ypts,yexp[u],ypara ,u];
initialcurve[u_]:={xexp[u]/.xfitdat,yexp[u]/.yfitdat};

 area=1/2 
NIntegrate[Evaluate[(initialcurve[u][[2]])( \!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(\(initialcurve[u]\)[\([\)\(1\)\(]\)]\)\))-(initialcurve[u][[1]])(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(\(initialcurve[u]\)[\([\)\(2\)\(]\)]\)\))],{u,0,2\[Pi]}
];
length=NIntegrate[Sqrt[Evaluate[(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(initialcurve[u]\)\)).(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(initialcurve[u]\)\))]],{u,0,2\[Pi]}];
centroid=1/length 
NIntegrate[initialcurve[u] Sqrt[Evaluate[(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(initialcurve[u]\)\)).(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(initialcurve[u]\)\))]],{u,0,2\[Pi]},AccuracyGoal->9];

Subscript[curve, num][u_]:=10Sqrt[2\[Pi]/area](initialcurve[u]-centroid);
Subscript[inilen, num]=10Sqrt[2\[Pi]/area]length;

Show[
ListPlot[10Sqrt[2\[Pi]/area]Table[xy[[i]]-centroid,{i,1,n}],PlotStyle->{Red,PointSize[Medium]},AspectRatio->Full],
ListPlot[Table[Subscript[curve, num][2Pi i/100],{i,0,100}],AspectRatio->Full],
ParametricPlot[Subscript[curve, num][u],{u,0,2Pi}]]

];


rpcg[num_,xy__List]:=
Module[{pts,n,spline,
fpts=50,order=8,xpts,ypts,xexp,yexp,xfk,yfk,xpara,ypara,xfitdat,yfitdat,
initialcurve,area,length,centroid,curve},

pts=xy;
n=Length[pts];
pts=Append[pts,First[pts]];
pts=Join[{pts[[-3]],pts[[-2]]},pts,{pts[[2]],pts[[3]]}];
spline=SplineFit[pts,Cubic];

xpts=Table[{i 2\[Pi]/fpts,spline[2+(n)i/fpts][[1]]},{i,0,fpts}];
ypts=Table[{i 2\[Pi]/fpts,spline[2+(n)i/fpts][[2]]},{i,0,fpts}];
xexp[u_]:=Sum[Subscript[xfk, i] Cos[i u]+Subscript[xfk, order+i]Sin[i u],{i,0,order}];
yexp[u_]:=Sum[Subscript[yfk, i] Cos[i u]+Subscript[yfk, order+i]Sin[i u],{i,0,order}];
xpara=Table[Subscript[xfk, i] ,{i,0,2 order}];
ypara=Table[Subscript[yfk, i] ,{i,0,2 order}];
xfitdat=FindFit[xpts,xexp[u],xpara ,u];
yfitdat=FindFit[ypts,yexp[u],ypara ,u];
initialcurve[u_]:={xexp[u]/.xfitdat,yexp[u]/.yfitdat};

 area=1/2 
NIntegrate[Evaluate[(initialcurve[u][[2]])( \!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(\(initialcurve[u]\)[\([\)\(1\)\(]\)]\)\))-(initialcurve[u][[1]])(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(\(initialcurve[u]\)[\([\)\(2\)\(]\)]\)\))],{u,0,2\[Pi]}
];
length=NIntegrate[Sqrt[Evaluate[(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(initialcurve[u]\)\)).(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(initialcurve[u]\)\))]],{u,0,2\[Pi]}];
centroid=1/length 
NIntegrate[initialcurve[u] Sqrt[Evaluate[(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(initialcurve[u]\)\)).(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(initialcurve[u]\)\))]],{u,0,2\[Pi]},AccuracyGoal->9];

Subscript[curve, num][u_]:=10Sqrt[2\[Pi]/area](initialcurve[u]-centroid);

Print[
TableForm[{{
ParametricPlot[spline[u],{u,0,Length[pts]}],
Show[
ListPlot[xy,PlotStyle->{Red,PointSize[Medium]},AspectRatio->Full],
ListPlot[Table[spline[2+(n)i/100],{i,0,100}]],
ParametricPlot[spline[u],{u,2,2+n}]],
Show[
ListPlot[xy,PlotStyle->{Red,PointSize[Medium]},AspectRatio->Full,Axes->False],
ListPlot[Table[initialcurve[2Pi i/100],{i,0,100}]],
ParametricPlot[initialcurve[u],{u,0,2Pi}],
Graphics[{Green,PointSize[Medium],Point[centroid]}]],
Show[
ListPlot[10Sqrt[2\[Pi]/area]Table[xy[[i]]-centroid,{i,1,n}],PlotStyle->{Red,PointSize[Medium]},AspectRatio->Full],
ListPlot[Table[Subscript[curve, num][2Pi i/100],{i,0,100}],AspectRatio->Full],
ParametricPlot[Subscript[curve, num][u],{u,0,2Pi}]]
}}]
];
]


(* ::Input:: *)
Clear[lineplot3d,erplot,evoplot3d,cenplot,cenplot3d,multicenplot3d,meancenplot,meancenplot3d];

lineplot3d[sol_List,scale_:1,opts___]:=
Module[{plots,n,t1,t2},

n=Length[sol]/2-1;
{t1,t2}=First[First[sol][[2]]][[1]];
If[t2<=99&&t2>1,t2=t2-1];

plots=Table[{scale  Subscript[x, i][t]/.sol[[i+1]],scale  Subscript[y, i][t]/.sol[[i+n+2]],t},{i,0,n}
];
ParametricPlot3D[plots//Evaluate,{t,t1,t2},AspectRatio->1,PerformanceGoal->"Speed",opts]
];

erplot[sol_List,tt1_:0,tt2_:100]:=
Module[{t1,t2},
{t1,t2}=First[First[sol][[2]]][[1]];
If[tt1>t1,t1=tt1];
If[tt2<t2  ,t2=tt2];
Plot[{error[sol,t]},{t,t1,t2},PerformanceGoal->"Speed"]
];

evoplot3d[num_Integer,scale_:3,opts___]:=
Module[{sol,n,curplot,lineplots},
sol=Subscript[solution, num];
n=Length[sol];

curplot=ParametricPlot3D[
{{scale Subscript[curve, num][u][[1]],scale  Subscript[curve, num][u][[2]],0},{0,0,100}},
{u,0,2\[Pi]},PlotRange->All,PerformanceGoal->"Speed",opts];
lineplots=Table[lineplot3d[sol[[i]],scale,PlotStyle->{{Black,Thin}}],{i,1,n}];

Show[curplot,lineplots]
];

cenplot[num_,t1_:0,t2_:99.9]:=
ParametricPlot[centroid[num,t],{t,t1,t2},PerformanceGoal->"Speed",PlotRange->Full];

cenplot3d[num_,scale_:10,opts___]:=
Show[
evoplot3d[num,scale,opts],ParametricPlot3D[{scale centroid[num,t][[1]],scale centroid[num,t][[2]],t},{t,0,99.9},PerformanceGoal->"Speed",PlotRange->Full,PlotStyle->{Thick,Black}]
];

multicenplot3d[n_,scale_:3,opts___]:=ParametricPlot3D[Table[Flatten[{scale centroid[i,t],t}],{i,1,n}],{t,0,99.5},PerformanceGoal->"Speed",opts];

c2plot[n_,opts___]:=
Plot[{(c[t]/.Subscript[zsol, n][[1]])^2},{t,0,99.9},PlotRange->All,opts];

meancenplot3d[num_]:=
ParametricPlot3D[Flatten[{ meancen[num,t],t/100}],{t,0,99},PlotRange->All,PerformanceGoal->"Speed",MaxRecursion->2];

meancenplot[n_]:=
ParametricPlot[Table[meancen[i,t],{i,1,n}],{t,0,99},PlotRange->All,PerformanceGoal->"Speed",MaxRecursion->1,PlotStyle->{Red,Blue}];


(* ::Input:: *)
Clear[curgrdpts];

curgrdpts[num_Integer,n_Integer:150]:=
Block[{pts},
pts=Thread[Subscript[curve, num][2\[Pi] Range[0,n]/n]];
Table[{2\[Pi] i/n,pts[[i+1]]},{i,0,n}]
];


(* ::Input:: *)
Clear[proequ];

proequ[t0_:0,icpts_List]:=
Module[{n,grdpts,ugrid,X,Y,xu,xuu,yu,yuu,v,xeqns,yeqns,ic,xic,yic},

n=Length[icpts]-1;
grdpts=Range[0,n];
ugrid=icpts[[All,1]];

X[t_]=Through[Thread[Subscript[x, grdpts]][t]];
Y[t_]=Through[Thread[Subscript[y, grdpts]][t]];

xu=NDSolve`FiniteDifferenceDerivative[Derivative[1],ugrid,X[t]];
yu=NDSolve`FiniteDifferenceDerivative[Derivative[1],ugrid,Y[t]];
xuu=NDSolve`FiniteDifferenceDerivative[Derivative[2],ugrid,X[t]];
yuu=NDSolve`FiniteDifferenceDerivative[Derivative[2],ugrid,Y[t]];
v=Sqrt[xu^2+yu^2];

xeqns = Thread[\!\(
\*SubscriptBox[\(\[PartialD]\), \(t\)]\(X[t]\)\) ==v^(-2)(-v^(-2)(xu xuu +yu yuu)xu+xuu)];
yeqns = Thread[\!\(
\*SubscriptBox[\(\[PartialD]\), \(t\)]\(Y[t]\)\) ==v^(-2)(-v^(-2)(xu xuu +yu yuu)yu+yuu)];

ic=Flatten@Table[Thread[{Subscript[x, i][t0],Subscript[y, i][t0]}==icpts[[i+1,2]]],{i,0,n}];

First[
NDSolve`ProcessEquations[
Join[xeqns,yeqns,ic],
Join[Thread[Subscript[x, grdpts]],Thread[Subscript[y, grdpts]]],
t]
]

];


(* ::Input:: *)
Clear[length,area];

length[sol_List,t_]:=
Block[{n,grid,X,Y,fddf},

n=Length[sol]/2-1;
grid=Range[0,n];
X=Through[Thread[Subscript[x, grid]][t]]/.sol;
Y=Through[Thread[Subscript[y, grid]][t]]/.sol;
fddf = NDSolve`FiniteDifferenceDerivative[Derivative[1], grid];

Total[Drop[Sqrt[fddf[X]^2 +fddf[Y]^2],1]]

];

area[sol_List,t_]:=
Block[{n,grid,X,Y,fddf},

n=Length[sol]/2-1;
grid=Range[0,n];
X=Through[Thread[Subscript[x, grid]][t]]/.sol;
Y=Through[Thread[Subscript[y, grid]][t]]/.sol;
fddf = NDSolve`FiniteDifferenceDerivative[Derivative[1], grid];

Total[Drop[fddf[X]Y -fddf[Y]X,1]]/2

];


(* ::Input:: *)
Clear[pretest];
pretest[state_NDSolve`StateData]:=
Block[{sta,t,sol,n,grid,X,Y,fddf},
sta=state;
t=First[state@"CurrentTime"];
NDSolve`Iterate[sta,t];
sol=NDSolve`ProcessSolutions[sta];

n=Length[sol]/2-1;
grid=Range[0,n];
X=Through[Thread[Subscript[x, grid]][t]]/.sol;
Y=Through[Thread[Subscript[y, grid]][t]]/.sol;
fddf = NDSolve`FiniteDifferenceDerivative[Derivative[1], grid];

1000Abs[
Total[Drop[Y  fddf[X] -X  fddf[Y],1]]/2+2\[Pi] t -200\[Pi]
]

]


(* ::Input:: *)
error[sol_List,t_]:=
Block[{t1,t2,n,grid,X1,Y1,X,Y,fddf},

{t1,t2}=First[First[sol][[2]]][[1]];
n=Length[sol]/2-1;
grid=Range[0,n];
fddf = NDSolve`FiniteDifferenceDerivative[Derivative[1], grid];

X1=Through[Thread[Subscript[x, grid]][t1]]/.sol;
Y1=Through[Thread[Subscript[y, grid]][t1]]/.sol;
X=Through[Thread[Subscript[x, grid]][t]]/.sol;
Y=Through[Thread[Subscript[y, grid]][t]]/.sol;

1000Abs[
(Total[Drop[fddf[X]Y -fddf[Y]X,1]]-Total[Drop[fddf[X1]Y1 -fddf[Y1]X1,1]])/2
+2\[Pi] ( t-t1 )]

];


(* ::Input:: *)
Clear[cut];

cut[sol_List]:=
Module[{n,t1,t2,grid,X1,Y1,X2,Y2,fddf,
dist,dmin,l1,l2,l,i,j,d,
newdist,nnew,newX,newY,newgrid},

{t1,t2}=First[First[sol][[2]]][[1]]-{0,1};
n=Length[sol]/2-1;
grid=Range[0,n];
fddf = NDSolve`FiniteDifferenceDerivative[Derivative[1], grid];

X1=Through[Thread[Subscript[x, grid]][t1]]/.sol;
Y1=Through[Thread[Subscript[y, grid]][t1]]/.sol;
dist=Sqrt[fddf[X1]^2 +fddf[Y1]^2];
l1=Total[Drop[dist,1]];
dmin=1Min@dist;

X2=Through[Thread[Subscript[x, grid]][t2]]/.sol;
Y2=Through[Thread[Subscript[y, grid]][t2]]/.sol;
dist=Sqrt[fddf[X2]^2 +fddf[Y2]^2];
l2=Total[Drop[dist,1]];

newdist=Reap[
For[i=1;j=0,i<= n,i++,
d=Sum[dist[[m]],{m,j+1,i}];
If[i==n,Sow[{i,d}];Break[],None,Print["Error while fitting: Break at i=n"]];
If[d>= dmin,j=i;Sow[{i,d}],None,Print["Error while fitting: Sow for d>dmin"]];
];
][[2,1]];
nnew=Length[newdist];

If[l2!=Total[newdist[[All,2]]],Print["Error after fitting: Fitted length unequal original length"];
];
Subscript[l, 0]=0;
Do[Subscript[l, i]=Subscript[l, i-1]+newdist[[i,2]],{i,1,nnew}];

newX=Through[Thread[Subscript[x, newdist[[All,1]]]][t2]]/.sol;
newY=Through[Thread[Subscript[y, newdist[[All,1]]]][t2]]/.sol;
newgrid=Table[{2\[Pi] Subscript[l, i]/l2,{newX[[i]],newY[[i]]}},{i,1,nnew}];
Prepend[newgrid,{0,Last[newgrid][[2]]}]

]


(* ::Input:: *)
Clear[fit];

fit[sol_List]:=
Module[{n,t1,t2,grid,X1,Y1,X2,Y2,fddf,
dist,dmin,l1,l2,l,i,j,d,
newdist,nnew,newX,newY,newgrid,
xmdp,ymdp,order,xexp,yexp,xfk,yfk,xpara,ypara,yfitdat,xfitdat,fc},

{t1,t2}=First[First[sol][[2]]][[1]]-{0,1};
n=Length[sol]/2-1;
grid=Range[0,n];
fddf = NDSolve`FiniteDifferenceDerivative[Derivative[1], grid];

X1=Through[Thread[Subscript[x, grid]][t1]]/.sol;
Y1=Through[Thread[Subscript[y, grid]][t1]]/.sol;
dist=Sqrt[fddf[X1]^2 +fddf[Y1]^2];
l1=Total[Drop[dist,1]];
dmin=1Min@dist;

X2=Through[Thread[Subscript[x, grid]][t2]]/.sol;
Y2=Through[Thread[Subscript[y, grid]][t2]]/.sol;
dist=Sqrt[fddf[X2]^2 +fddf[Y2]^2];
l2=Total[Drop[dist,1]];

newdist=Reap[
For[i=1;j=0,i<= n,i++,
d=Sum[dist[[m]],{m,j+1,i}];
If[i==n,Sow[{i,d}];Break[],None,Print["Error while fitting: Break at i=n"]];
If[d>= dmin,j=i;Sow[{i,d}],None,Print["Error while fitting: Sow for d>dmin"]];
];
][[2,1]];
nnew=Length[newdist];

If[l2!=Total[newdist[[All,2]]],Print["Error after fitting: Fitted length unequal original length"];
];
;
Subscript[l, 0]=0;
Do[Subscript[l, i]=Subscript[l, i-1]+newdist[[i,2]],{i,1,nnew}];

newX=Through[Thread[Subscript[x, newdist[[All,1]]]][t2]]/.sol;
newY=Through[Thread[Subscript[y, newdist[[All,1]]]][t2]]/.sol;
newgrid=Table[{2\[Pi] Subscript[l, i]/l2,{newX[[i]],newY[[i]]}},{i,1,nnew}];
newgrid=Prepend[newgrid,{0,Last[newgrid][[2]]}];

xmdp=Table[{newgrid[[i,1]],newgrid[[i,2,1]]},{i,1,nnew+1}];
ymdp=Table[{newgrid[[i,1]],newgrid[[i,2,2]]},{i,1,nnew+1}];

order=16-IntegerPart[t2/8];
xexp[u_]:=Sum[Subscript[xfk, i] Cos[i u]+Subscript[xfk, order+i]Sin[i u],{i,0,order}];
yexp[u_]:=Sum[Subscript[yfk, i] Cos[i u]+Subscript[yfk, order+i]Sin[i u],{i,0,order}];
xpara=Table[Subscript[xfk, i] ,{i,0,2 order}];
ypara=Table[Subscript[yfk, i] ,{i,0,2 order}];
xfitdat=FindFit[xmdp,xexp[u],xpara ,u];
yfitdat=FindFit[ymdp,yexp[u],ypara ,u];

fc[u_]:={xexp[u]/.xfitdat,yexp[u]/.yfitdat};
Print["Fit at time ",t2," Deviation in curve length: ",100(NIntegrate[Sqrt[Evaluate[(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(fc[u]\)\)).(\!\(
\*SubscriptBox[\(\[PartialD]\), \(u\)]\(fc[u]\)\))]],{u,0,2\[Pi]}]-l2)/l2,
"%"
];

Table[{2\[Pi] i/ nnew,fc[2\[Pi] i/nnew]},{i,0,nnew}]
]


(* ::Input:: *)
Clear[evolution];

evolution[num_Integer,n_Integer:150]:=
Module[{grid,state,dt,sol,er,t,tfinal},
Subscript[solution, num]={};

grid=curgrdpts[num,n];
state=proequ[0,grid];
er=pretest[state];
If[er>.5,Return[Print["Pretest failed at t=",0," the error was ",er," (wild curve)"]]];

For[t=0,t<100,t++,
NDSolve`Iterate[state,t];
sol=NDSolve`ProcessSolutions[state];
er=error[sol,t];
If[er>2,
Subscript[solution, num]=Append[Subscript[solution, num],sol];
Block[{t1,t2,newgrid,newstate,newsol,newer},
{t1,t2}=First[First[sol][[2]]][[1]];
newgrid=fit[sol];
newstate=proequ[t2-1,newgrid];
NDSolve`Iterate[newstate,t2];
newsol=NDSolve`ProcessSolutions[newstate];
newer=error[newsol,t2];
If[newer>= 2,
Print["Error after iteration of fitted state. The error was ",newer, "(",er,") at time ",t2,"(",t2-1,")"];
Abort[];
];
state=newstate;
];
];
];
tfinal=area[sol,99]/(2\[Pi])+99;
NDSolve`Iterate[state,tfinal];
sol=NDSolve`ProcessSolutions[state];

Subscript[solution, num]=Append[Subscript[solution, num],sol];
]


Clear[selector,picker];
selector[sol_,t_]:=
Module[{n,ttab,i,grid,X,Y},
n=Length[sol];
ttab=Table[First[First[sol[[i]]][[2]]][[1]][[1]],{i,1,n}];
ttab=Append[ttab,First[First[sol[[n]]][[2]]][[1]][[2]]];
If[t<0||t>ttab[[n+1]],
Print["Error (selector): time value (",t,") lies outside the range of data."];
Abort[];
];
For[i=1,i<=n&&t>ttab[[i+1]],i++
];
grid=Range[0,Length[sol[[i]]]/2 -1];
X=Through[Thread[Subscript[x, grid]][t]]/.sol[[i]];
Y=Through[Thread[Subscript[y, grid]][t]]/.sol[[i]];
{X,Y}
];

picker[sol_,t_]:=
Module[{n,ttab,i,grid,X,Y},
n=Length[sol];
ttab=Table[First[First[sol[[i]]][[2]]][[1]][[1]],{i,1,n}];
ttab=Append[ttab,First[First[sol[[n]]][[2]]][[1]][[2]]];
If[t<0||t>ttab[[n+1]],
Print["Error (selector): time value (",t,") lies outside the range of data."];
Abort[];
];
For[i=1,i<=n&&t>ttab[[i+1]],i++
];
i
]


Clear[centroid];
centroid[num_,t_]:=
Module[{X,Y,n,v,l},
{X,Y}=selector[Subscript[solution, num],t];
n=Length@X-1;
fddf = NDSolve`FiniteDifferenceDerivative[Derivative[1], Range[0,n],DifferenceOrder->6];
v=Sqrt[fddf[X]^2 +fddf[Y]^2];
l=Total[Drop[v,1]];

{Total[Drop[X v,1] ],Total[Drop[Y v,1]]}/l

];


Clear[flength,farea,isofit,action];

flength[num_,t_]:=
Module[{sol,i},
sol=Subscript[solution, num];
i=picker[sol,t];
length[sol[[i]],t]
]

farea[num_,t_]:=
Module[{sol,i},
sol=Subscript[solution, num];
i=picker[sol,t];
area[sol[[i]],t]
];

isofit[num_,fitpts_:100,order_:20]:=
Block[{tt=99.9,list,ifi},
list=Append[Table[{tt i/fitpts,flength[num,tt i/fitpts]^2/farea[num,tt i/fitpts]},{i,0,fitpts}],{100,4\[Pi]}];
Subscript[iso, num][t_]=Fit[list,Thread[t^Range[0,order]],t];
Subscript[l, num][t_]=Sqrt[Subscript[iso, num][t](200\[Pi]-2\[Pi] t)];

];

action[n_,num_,t_]:=(Subscript[iso, num][t](1+(c[t]/.Subscript[zsol, n][[1]])/Subscript[l, num][t]));


Clear[zpde];
zpde[n_]:=
Block[{clist=Range[1,n],noc,pde,bc,c},
noc=Length[clist];
z[t_]:=Sum[Exp[-Subscript[iso, num][t](1+c[t]/Subscript[l, num][t])],{num,clist}];
pde=Evaluate[\!\(
\*SubscriptBox[\(\[PartialD]\), \(t\)]\(z[t]\)\)] ==0;
bc=Sum[Subscript[l, num][t] Exp[-Subscript[iso, num][0](1+c[t]/Subscript[l, num][t])] /.t->0,{num,clist}]/z[0]==Sum[Subscript[l, num][t]/.t->0,{num,clist}]/noc;
Subscript[co, noc]=c[0]/.FindRoot[bc,{c[0],-290}];
Print[{noc,Subscript[co, noc]}];

Timing[Subscript[zsol, noc]=NDSolve[{pde,c[0]==Subscript[co, noc]},c,{t,0,99.9}]]//Print;
]


Clear[c2fit,vtab,ktab];

c2fit[n_Integer,t1_,t2_,pts_:50]:=
Block[{data,expr,pars,cf},
data=Table[{t1 +(t2-t1)i/pts,(c[t1 +(t2-t1)i/pts]/.Subscript[zsol, n][[1]])^2},{i,0,pts}];
expr=k Abs[(100-t)]^v;
pars={{k,400},{v,1}};
cf=FindFit[data,expr,pars,t];
{Sqrt[k],v/2}/.cf
];

vtab[n_Integer,t1_,t2_,int_:10]:=
Quiet[
TableForm[Table[c2fit[i,t1+(t2-t1)( j-1)/int,t1+(t2-t1) j/int][[2]],{j,1,int},{i,1,n}],
TableHeadings->{Table[{t1+(t2-t1)( j-1)/int,t1+(t2-t1) j/int},{j,1,int}],Table[i,{i,1,n}]}]
];

ktab[n_Integer,t1_,t2_,int_:10]:=
Quiet[
TableForm[Table[c2fit[i,t1+(t2-t1)( j-1)/int,t1+(t2-t1) j/int][[1]],{j,1,int},{i,1,n}],
TableHeadings->{Table[{t1+(t2-t1)( j-1)/int,t1+(t2-t1) j/int},{j,1,int}],Table[i,{i,1,n}]}]
]


Clear[meancen,varcen];
meancen[n_,t_]:=
Sum[centroid[num,t] Exp[-action[n,num,t]],{num,1,n}]/Sum[Exp[-action[n,num,t]],{num,1,n}];

varcen[n_,t_]:=
Sqrt[
Sum[centroid[num,t]^2 Exp[-action[n,num,t]],{num,1,n}]/Sum[Exp[-action[n,num,t]],{num,1,n}]-meancen[n,t]^2
];

varcen2[n_,t_]:=
Sqrt[
Sum[(centroid[num,t]-meancen[n,t])^2 Exp[-action[n,num,t]],{num,1,n}]/Sum[Exp[-action[n,num,t]],{num,1,n}]
];


