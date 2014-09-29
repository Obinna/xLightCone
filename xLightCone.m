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



xAct`xLightCone`$Version={"0.0.1",{2014,09,29}};


xAct`xLightCone`$xTensorVersionExpected={"1.1.1",{2014,9,28}};
xAct`xLightCone`$xPertVersionExpected={"1.0.5",{2014,9,28}};


(* xLightCone:  *)

(* Copyright (C) 2015- Obinna Umeh, Cyril Pitrou *)

(* This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License as
 published by the Free Software Foundation; either version 2 of
 the License,or (at your option) any later version.

This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 General Public License for more details.

You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place-Suite 330, Boston, MA 02111-1307,
  USA. 
*)


(* :Title: xLightCone *)

(* :Author: Obinna Umeh & Cyril Pitrou*)

(* :Context: xAct`xLightCone` *)

(* :Copyright: Obinna Umeh & Cyril Pitrou (2015-) *)

(* :Keywords: *)

(* :Source: xLightCone.nb *)

(* :Warning: *)

(* :Mathematica Version: 9.0 and later *)

(* :Limitations: *)


If[Unevaluated[xAct`xCore`Private`$LastPackage]===xAct`xCore`Private`$LastPackage,xAct`xCore`Private`$LastPackage="xAct`xLightCone`"];


Off[General::nostdvar]
Off[General::nostdopt]
BeginPackage["xAct`xLightCone`",{"xAct`xPert`","xAct`xTensor`","xAct`xPerm`","xAct`xCore`","xAct`ExpressionManipulation`"}]


If[Not@OrderedQ@Map[Last,{$xTensorVersionExpected,xAct`xTensor`$Version}],Throw@Message[General::versions,"xTensor",xAct`xTensor`$Version,$xTensorVersionExpected]]

If[Not@OrderedQ@Map[Last,{$xPertVersionExpected,xAct`xPert`$Version}],Throw@Message[General::versions,"xPert",xAct`xPert`$Version,$xPertVersionExpected]]


Print[xAct`xCore`Private`bars];
Print["Package xAct`xLight`  version ",$Version[[1]],", ",$Version[[2]]];
Print["CopyRight (C) 2015-, Obinna Umeh under the General Public License."];


Off[General::shdw]
xAct`xLightCone`Disclaimer[]:=Print["These are points 11 and 12 of the General Public License:\n\nBECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM `AS IS\.b4 WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.\n\nIN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES."]
On[General::shdw]


If[xAct`xCore`Private`$LastPackage==="xAct`xLightCone`",
Unset[xAct`xCore`Private`$LastPackage];
Print[xAct`xCore`Private`bars];
Print["These packages come with ABSOLUTELY NO WARRANTY; for details type Disclaimer[]. This is free software, and you are welcome to redistribute it under certain conditions. See the General Public License for details."];
Print[xAct`xCore`Private`bars]];


$CovDFormat="Prefix";
Message[General::nostdvar,"$CovDFormat","Prefix"];


(*** VERSIONS ***)

$Version::usage="$Version is a global variable giving the version of the package xLightCone in use.";

$xTensorVersionExpected::usage="$xTensorVersionExpected is a global variable giving the oldest possible version of the package xTensor which is required by the version of the package xLightCone in use.";

$xPertVersionExpected::usage="$xPertVersionExpected is a global variable giving the oldest possible version of the package xPert which is required by the version of the package xLightCone in use.";


DefMatterFields::usage  = "";

DefMetricFields::usage = "";

DefScreenProjecteTensor::usage = "";

SetSlicingUpToScreenSpace::usage = "";

SplitMetric ::usage = "";

ToLightConeFromRules::usage = "";


Begin["xAct`xLightCone`Private`"]


(***PRIVATE BOOLEAN FUNCTIONS***)(**Miscellaneous**)$DefInfoQ=True;
(*If set to'False',the information messages are not printed.*)

(**Testing expressions**)

AnyIndicesListQ[inds_List]:=Cases[inds,AnyIndices[_]]=!={}
(*If the list of indices contains the head'AnyIndices',then AnyIndicesListQ[inds] returns'True';otherwise it returns'False'.*)

DefTensorQ[symb_]:=Cases[$Tensors,symb]==={symb}
(*If'symb' has been defined as a tensor,then DefTensorQ[symb] returns'True';otherwise it returns'False'.*)

GaugeQ[strg_]:=Cases[{"AnyGauge","ComovingGauge","FlatGauge","IsoDensityGauge","NewtonGauge","SynchronousGauge"},strg]==={strg}
(*If'strg' matches one of the element in the list,then GaugeQ[strg] returns'True';otherwise it returns'False'.*)

InducedMetricQ[symb_]:=If[MetricQ[symb],InducedFrom[symb]=!=Null,False]
(*If'symb' is not defined as a metric,then InducedMetricQ[symb] returns'False'.Otherwise,it checks whether'symb' is an induced metric.If this is the case,then InducedMetricQ[symb] gives'True';otherwise it gives'False'.*)

SpaceTimeQ[strg_]:=Cases[{"Anisotropic","BianchiB","BianchiA","BianchiI","FLCurved","FLFlat","Minkowski"},strg]==={strg}
(*If'strg' matches one of the element of the list,then SpaceTimeQ[strg] returns'True';otherwise it returns'False'.*)

TensorNullQ[tens_]:=If[Cases[SlotsOfTensor[tens],Labels]=!={},Print["** Warning: the function TensorNullQ is only suited to test tensors defined without label-indices. ",tens],With[{inds=DummyIn/@SlotsOfTensor[tens]},tens@@inds===0]]
(*TensorNullQ[tens] returns'True' if'tens' is a null tensor and'False' otherwise.This function is not suited to test tensors defined with label-indices.*)

(**Type of manifolds**)
(* Will probably disappear since we will only do curved and flat FL *)

BianchiBool[Spacetype_]:=(Spacetype==="BianchiB"||Spacetype==="BianchiA"||Spacetype==="BianchiI")
FlatSpaceBool[Spacetype_]:=(Spacetype==="BianchiI"||Spacetype==="FLFlat"||Spacetype==="Minkowski")
NoAnisotropyBool[Spacetype_]:=(Spacetype==="FLCurved"||Spacetype==="FLFlat"||Spacetype==="Minkowski")
AnisotropyBool[Spacetype_]:=(Spacetype==="Anisotropic")
(*The name'AnisotropyBool' should be changed.*)


DirectionVectorQ[expr_]:=False;

SetSlicingUpToScreenSpace[g_?MetricQ,u_,normu_:-1,h_,cd_,{cdpost_String,cdpre_String},n_,normn_:1,NSS_,cd2_,{cd2post_String,cd2pre_String}]:=Module[{m,p,q,DummyS,DummyV,DummyT,ui,indsdimminustwo,indsdim,dim,prot,Silenth},
With[{Manifold=ManifoldOfCovD@CovDOfMetric[g],CD=CovDOfMetric[g]},
dim=DimOfManifold[Manifold];

With[{ind1=DummyIn[Tangent[Manifold]],ind2=DummyIn[Tangent[Manifold]],ind3=DummyIn[Tangent[Manifold]],ind4=DummyIn[Tangent[Manifold]],ind5=DummyIn[Tangent[Manifold]],ind6=DummyIn[Tangent[Manifold]],ind7=DummyIn[Tangent[Manifold]],i1=DummyIn[Tangent[Manifold]],i2=DummyIn[Tangent[Manifold]],i3=DummyIn[Tangent[Manifold]],i4=DummyIn[Tangent[Manifold]],i5=DummyIn[Tangent[Manifold]],dummy=DummyIn[Tangent[Manifold]]},



DefTensor[u[-ind1],{Manifold},PrintAs->"\!\("<>ToString[ind1]<>"\&-\)"]
        
(*Induced Metric *)
Off[DefMetric::old];
DefMetric[1,h[-ind1,-ind2],cd,{cdpost,cdpre},InducedFrom->{g,u},PrintAs->"\!\("<>ToString[h]<>"\&-\)"];
(*Another induced metric, I used the cd for the angular derivative, it is cheating I will sort it later*)

DefTensor[n[-ind1],{Manifold},OrthogonalTo->{u[ind1]},ProjectedWith->{h[ind1,-ind2]},PrintAs->"\!\("<>ToString[n]<>"\&-\)"];

DirectionVectorQ[n]=True;


(* I use NSS as the screen space metric because the Silent metric is 3-D, I will clean up these later*)
(* CP: OK Obinna I see what you do !*)
DefTensor[NSS[-ind1,-ind2],{Manifold},Symmetric[{-ind1,-ind2}],OrthogonalTo->{u[ind1],u[ind2],n[ind1],n[ind2]},ProjectedWith->{h[ind1,-ind4],h[ind2,-ind5](*,NSS[ind1,-ind4],NSS[ind2,-ind5]*)},PrintAs->"\!\("<>ToString[NSS]<>"\&-\)"];

(* So let me try to define separately the CovD, So That I suppress this definition *)
(*DefMetric[1,Silenth[-ind1,-ind2],cd2,{cd2post,cd2pre},InducedFrom->{g,n},PrintAs->"\!\("<>ToString[h]<>"\&-\)"];*)

(* CP: Let me try this implementation for the CovD twice projected*)
(* This seems cleaner than to define a Silent Metric.*)

DefCovD[cd2[-ind1],{cd2post,cd2pre}];
cd2[ind1_][NSS[ind2_,ind3_]]:=0;
AutomaticRules[NSS,MakeRule[{NSS[ind1,ind2] n[-ind2],0}]];
AutomaticRules[NSS,MakeRule[{NSS[ind1,ind2] u[-ind2],0}]];

(*I used AutomaticRule to assign rules to NSS...*)
(* Well it doesn't work well*)
(*NSS[-ind1,-ind2]^:=2/;ind1+ind2==0;
NSS[-ind1,-ind2]NSS[ind1,ind2]^:=2;*)

(*AutomaticRules[NSS,MakeRule[{NSS[-ind1,-ind2],h[-ind1,-ind2]-n[-ind1]n[-ind2]}]]*)AutomaticRules[NSS,MakeRule[{NSS[ind1,ind2] NSS[-ind2,-ind3],NSS[ind1,-ind3]}]];
AutomaticRules[NSS,MakeRule[{NSS[-ind1,-ind2] NSS[ind2,ind3],NSS[-ind1,ind3]}]];
AutomaticRules[NSS,MakeRule[{NSS[-ind1,ind1] ,dim-2}]];
(* Who knows we might allow for 1+1+n splitting so here that should be n-2.*)

On[DefMetric::old];
(*We remove automatic Leibniz rule when there is a Scalar Head.This is to ensure that the induced derivative does not spoil an'InducedDecomposition'*)
prot=Unprotect[cd];
cd[a_][Scalar[expr_]]=.;
cd2[a_][Scalar[expr_]]=.;
Protect[prot];

(* CP. Do you remember why we had this? *)
$Rulecdh[h1_]:={
h1[-a_,b_] cd[a_][expr1_]:>cd[b][expr1],
h1[a_,b_] cd[-a_][expr1_]:>cd[b][expr1],
h1[b_,-a_] cd[a_][expr1_]:>cd[b][expr1],
h1[b_,a_] cd[-a_][expr1_]:>cd[b][expr1],
h1[-a_,b_] cd[c_]@cd[a_][expr1_]:>cd[c]@cd[b][expr1],h1[a_,b_] cd[c_]@cd[-a_][expr1_]:>cd[c]@cd[b][expr1],
h1[b_,-a_] cd[c_]@cd[a_][expr1_]:>cd[c]@cd[b][expr1],h1[b_,a_] cd[c_]@cd[-a_][expr1_]:>cd[c]@cd[b][expr1]};

$Rulecdh[NSS1_]:={NSS1[-a_,b_] cd2[a_][expr1_]:>cd2[b][expr1],
NSS[a_,b_] cd2[-a_][expr1_]:>cd2[b][expr1],
NSS1[b_,-a_] cd2[a_][expr1_]:>cd2[b][expr1],
NSS[b_,a_] cd2[-a_][expr1_]:>cd2[b][expr1],
NSS1[-a_,b_] cd2[c_]@cd2[a_][expr1_]:>cd2[c]@cd2[b][expr1],NSS1[a_,b_] cd2[c_]@cd2[-a_][expr1_]:>cd2[c]@cd2[b][expr1],NSS1[b_,-a_] cd2[c_]@cd2[a_][expr1_]:>cd2[c]@cd2[b][expr1],NSS1[b_,a_] cd2[c_]@cd2[-a_][expr1_]:>cd2[c]@cd2[b][expr1]};





(*SpaceType[h]^=SpaceTimeType;*)

(*The default positionof indices for the extrinsic curvature and the acceleration is down*)
(* CP This could be rewritten in a more compact form gathering n and u, h and silenth*)

(SlotsOfTensor[#]^:={-Tangent[Manifold],-Tangent[Manifold]})&/@{ExtrinsicK[h]};
(SlotsOfTensor[#]^:={-Tangent[Manifold]})&/@{Acceleration[u]};


(SlotsOfTensor[#]^:={-Tangent[Manifold],-Tangent[Manifold]})&/@{ExtrinsicK[Silenth]};
(SlotsOfTensor[#]^:={-Tangent[Manifold]})&/@{Acceleration[n]};

(*The acceleration should vanish for homogeneous spacetimes.*)

Acceleration[u][ind1_]=0;
AutomaticRules[u,MakeRule[{u[ind1] u[-ind1],normu}]];
AutomaticRules[u,MakeRule[{u[-ind1] g[ind1,ind2],u[ind2]}]];
(*AutomaticRules[u,MakeRule[{g[ind1,ind2] u[-ind2] u[-ind1],normu}]];*)


(* CP Here it is because we assume non Binachi for n. Otherwise this is more general probably. Even if we now we specialize to FL, the 1+1+2 splitting would be great if it could be as general as possible. So here we should extend this definition and have it restricted to 0 only if the TypeOfPScaetime is non Bianchi.*)
Acceleration[n][ind1_]=0;
AutomaticRules[n,MakeRule[{n[ind1] n[-ind1],normn}]];
AutomaticRules[n,MakeRule[{n[-ind1] g[ind1,ind2],n[ind2]}]];
(*AutomaticRules[n,MakeRule[{g[ind1,ind2] n[-ind2] n[-ind1],normn}]];*)


If[IntegerQ@dim&&dim>=2,indsdim=GetIndicesOfVBundle[Tangent@Manifold,dim,{ind5}];
AutomaticRules[epsilon[g],MakeRule[Evaluate[{epsilon[g]@@indsdim u[-indsdim[[1]]] h[-indsdim[[2]],ind5],ReplaceIndex[Evaluate[epsilon[g]@@indsdim],indsdim[[2]]->ind5] u[-indsdim[[1]]]}]]];
];
]
]
];


ToInducedDerivativeScreenSpace[expr_,supercd_,cd_]:=
ToInducedDerivative[expr,supercd,cd];


ToInducedDerivativeScreenSpace[expr_,supercd_,cd_,cd2_]:=expr/.supercd[ind_][expr1:(_?xTensorQ[___]|_?InertHeadQ[___]|cd[_][_]|LieD[_][_])]:>-cd[ind][expr1]+With[{frees=FindFreeIndices[expr1]},
ToInducedDerivative[supercd[ind][expr1],supercd,cd]+ToInducedDerivative[cd[ind][expr1],cd,cd2]];


Options[DefScreenProjecteTensor]={PrintAs->Identity,TensorProperties->{"SymmetricTensor","Traceless","Transverse"},SpaceTimesOfDefinition->{"Background","Perturbed"}};

DefScreenProjecteTensorQ[Name_,h___]:=False;
PropertiesList[Name_]:={};
InducedMetricOf[Name_]:={};

(* Review all these properties.*)


DefScreenProjecteTensor[Name_[inds___],h_?InducedMetricQ,n_?DirectionVectorQ,options___?OptionQ]:=(If[DefScreenProjectedTensorQ[Name,h],

If[$DefInfoQ,
Throw@Print["** DefScreenProjectedTensor: The projection properties on the hypersurfaces associated with the induced metric ", h," and direction vector", n," have already been defined for the tensor ", Name,"."],
Throw[Null]
];
];

If[DefScreenProjectedTensorQ[Name],

If[$DefInfoQ,
Print["** DefScreenProjectedTensor: Projection properties for the tensor ", Name," have been defined for another slicing. New projection properties on the hypersurfaces associated with the induced metric", h," and direction vector", n," are now added."]
];
];
)


(* etc... *)

SetNumberOfArguments[DefScreenProjectedTensor,{3,Infinity}]
Protect[DefScreenProjectedTensor];


DefinedPerturbationParameter[x_]:=False;


DefMetricFields[g_?MetricQ,dg_,h_?InducedMetricQ,n_?DirectionVectorQ,PerturbParameter_:\[Epsilon]]:=Print["Dobidoouah"];

SetNumberOfArguments[DefMetricFields,{4,5}];
Protect[DefMetricFields];


DefMatterFields[uf_,duf_,h_?InducedMetricQ,n_?DirectionVectorQ, PerturbParameter_:\[Epsilon]]:=Print["Dobidoouah"];

SetNumberOfArguments[DefMatterFields,{4,5}]
Protect[DefMatterFields];


SplitMetric[g_?MetricQ,dg_,h_?InducedMetricQ,n_?DirectionVectorQ,gauge_?GaugeQ]:=Print["Dobidoouah"];


IndicesDown[expr_]:= Fold[SeparateMetric[First@$Metrics][#1,#2]&,expr,Select[IndicesOf[Up][expr],Not@LIndexQ[#]&]]
IndicesUp[expr_]:= Fold[SeparateMetric[First@$Metrics][#1,#2]&,expr,Select[IndicesOf[Down][expr],Not@LIndexQ[#]&]]


IndicesDown[0]:=0 ;(* This is to avoid bugs...*)
IndicesUp[0]:=0 ;


ConformalMetricName[g_?MetricQ,1]:=g;
ConformalMetricName[g_?MetricQ,conffactor_]:=SymbolJoin[g,conffactor,2];


DefConformalMetric[g_?MetricQ,conffactor_]:=Module[{n,q},Catch@With[{M=ManifoldOfCovD@CovDOfMetric@g,CD=CovDOfMetric@g},
With[{i1=DummyIn[Tangent[M]],i2=DummyIn[Tangent[M]],sy1=SymbolOfCovD[CD][[1]],sy2=SymbolOfCovD[CD][[2]],metlist=Select[$Metrics,InducedFrom[#]===Null&]},


If[Not@DefTensorQ[conffactor],DefTensor[conffactor[LI[n],LI[q]],{M},PrintAs->ToString[conffactor]]];


Off[DefMetric::old];(* Annoying message turned off*)
If[Not[DefTensorQ[ConformalMetricName[g,conffactor]]],


DefMetric[-1,ConformalMetricName[g,conffactor][-i1,-i2],SymbolJoin[CD,conffactor,2],{":",StringJoin[sy2,ToString[conffactor],ToString[2]]},PrintAs->StringJoin["[",PrintAs[g],"\!\("<>PrintAs[conffactor]<>"\^2\)","]"(*ToString[conffactor],ToString[2]*)],ConformalTo->{g[-i1,-i2],conffactor[LI[0],LI[0]]^2}];

];
On[DefMetric::old];

(* We have to ensure it is safe*)
Perturbation[conffactor[LI[0],LI[q_],indices___],n_]^:=0/;n>=1;


Off[ConformalRules::unknown];
(* We use the error sent by ConformalRules to chekc whether or not the metric in the list metlist is conformallyr elated to the metric g.
If it is the case we enforce transitivity of the conformal relations.*)
If[Catch@ConformalRules[g,#]=!=Null,
SetConformalTo[SymbolJoin[g,conffactor,2][-i1,-i2], {#[-i1, -i2],ConformalFactor[g,#]* conffactor[LI[0],LI[0]]^2}]]&/@metlist;
On[ConformalRules::unknown];

]
]
]

SetNumberOfArguments[DefConformalMetric,2]
Protect[DefConformalMetric];


ConfHead[_,_][delta[\[Mu]_,\[Nu]_]]:=delta[\[Mu],\[Nu]](* Because I know that when there is delta function in an expression, it is always with one index up and one down...so this should be fine.*)

 
ConfHead[metric1_?MetricQ,metric2_?MetricQ][ConfHead[metric2_?MetricQ,metric1_?MetricQ][expr_]]:=expr (* Not necessary *)
ConfHead[metric1_?MetricQ,metric1_?MetricQ][expr_]:=expr
ConfHead[metric2_?MetricQ,metric3_?MetricQ][ConfHead[metric1_?MetricQ,metric2_?MetricQ][expr_]]:=ConfHead[metric1,metric3][expr]


(* Thanks to Jolyon and Leo Stein, the definition below should be much more general. *)
(* The main reason is that the delta tensor is greedy and wants to contract through expressions like
ConfHead[...][f[Scalar[phi[]]]].*)
ConfHead/:IsIndexOf[ConfHead[_,_][_],_,delta]:=False;


$BoolBasicConformalWeight=True;

WeightOfIndicesList[indices_List]:=With[{aindex=Select[indices,Not[LIndexQ[#]]&]},Length@Select[aindex,DownIndexQ]-Length@Select[aindex,UpIndexQ]]

(* Conformal weight of a tensor *)
ConformalWeight[tens_?xTensorQ]:=0;
ConformalWeight[tens_?xTensorQ[indices___]]:=ConformalWeight[tens]+WeightOfIndicesList[{indices}]

ConformalWeight[f_?ScalarFunctionQ]:=0;

MyChangeChristoffel[expr_,cd_,cd_]:=expr

MyChangeChristoffel[expr_,cd2list_List,cd1_]:=Fold[MyChangeChristoffel[#1,#2,cd1]&,expr,cd2list]

MyChangeChristoffel[expr_,cd2_,cd1_]:=With[{vb=Tangent[ManifoldOfCovD[cd1]]},With[{chr1=Head[(Christoffel[cd1])[DummyIn[vb],-DummyIn[vb],-DummyIn[vb]]],chr2=Head[(Christoffel[cd2])[DummyIn[vb],-DummyIn[vb],-DummyIn[vb]]],chr21=Head[(Christoffel@@Sort[{cd2,cd1}])[DummyIn[vb],-DummyIn[vb],-DummyIn[vb]]],sign=Order[cd2,cd1]},
expr/.chr2[i1_,i2_,i3_]:>chr1[i1,i2,i3]+sign*chr21[i1,i2,i3]
]
]


ExistInertHead[head_]:=Length@Cases[$InertHeads,head]>0

RulesConf[metric1_?MetricQ,metric2_?MetricQ]:=(
Module[{cd1,cd2,confa2,confa,M,res,inds},cd1=CovDOfMetric[metric1];cd2=CovDOfMetric[metric2];


confa2=ConformalFactor[metric2,metric1];
confa=Sqrt[ConformalFactor[metric2,metric1]]/.Sqrt[x_^n_?EvenQ]:>x^(n/2);
(*In principle this should give a or 1/a depending if we go from metric1 to metric2 or metric2 to metric1*)

M=ManifoldOfCovD[cd1];
inds=DummyIn/@Table[Tangent[M],{Range[4]}];
With[{i1=inds[[1]],i2=inds[[2]],i3=inds[[3]],i4=inds[[4]]},

(* Once confheads are put on expression (as a result of a formal conformal transformation) then we remove them by expressing what they mean in function of the original tensors and the scale factor *)
res=
{RuleDelayed@@Hold[ConfHead[metric1,metric2][(Riemann@cd1)[i1_,i2_,i3_,i4_]],confa^(WeightOfIndicesList[{i1,i2,i3,i4}]-2)(Riemann@cd2)[i1,i2,i3,i4]],
RuleDelayed@@Hold[ConfHead[metric1,metric2][(Ricci@cd1)[i1_,i2_]],confa^(WeightOfIndicesList[{i1,i2}]-2)(Ricci@cd2)[i1,i2]],
RuleDelayed@@Hold[ConfHead[metric1,metric2][(RicciScalar@cd1)[]],(RicciScalar@cd2)[]],
RuleDelayed@@Hold[ConfHead[metric1,metric2][(Christoffel@cd1)[i1_,i2_,i3_]],confa^(WeightOfIndicesList[{i1,i2,i3}]-1)*(Christoffel@cd2)[i1,i2,i3]],
RuleDelayed@@Hold[ConfHead[metric1,metric2][(Determinant[metric1,AIndex])[]],(* This is removed because now xTensor is patched confa2^DimOfManifold[M]. Thanks to Leo Stein.*)(Determinant[metric2,AIndex])[]],

(* This line below is not working well.  The problem should be considered later when xTensor knows how to handle the epsilon of a frozen metric. So this really works only when metric1 is the ambient metric... *)
RuleDelayed@@Hold[ConfHead[metric1,metric2][(epsilon@metric1)[inds__?(Length[{#}]===DimOfManifold[M]&)]],(*confa2^(DimOfManifold[M]/2)*)confa^(WeightOfIndicesList[{inds}])(epsilon@metric1)[inds]],

(* Not really satisfactory but minimalist for scalar functions *)
(* Following Leo Stein suggestion, we allow the scalar function to have several arguments *)
ConfHead[metric1,metric2][f_?ScalarFunctionQ[arg___]]:>Simplify[confa2^((ConformalWeight[f])/2),Assumptions->confa>0]f[arg],

ConfHead[metric1,metric2][tens_?xTensorQ[indss___]]:>Simplify[confa2^(ConformalWeight[tens[indss]]/2),Assumptions->confa>0]tens[indss]
};

res
]
]
)


RemoveInducedDerivative[expr_,cd_]:=Module[{res},With[{h=MetricOfCovD@cd},
If[InducedFrom@h===Null,expr,
With[{g=First@InducedFrom@h},
With[{CD=CovDOfMetric@g},
res=(expr//.cd[ind_][Expr___]:>Projector[h][CD[ind][Expr]])/.Projector[h]->ProjectWith[h];
If[res=!=expr,Print["** Warning: you are using ToMetric or Conformal with induced covariant derivatives. \nThese induced derivatives are first expressed in function of the covariant derivative form which they are induced since we do not know very well how to handle that. **"];];
res
]
]
]
]
];

RemoveAllInducedDerivatives[expr_]:=With[{InducedMetrics=Select[$Metrics,InducedFrom[#]=!=Null&]},
Fold[RemoveInducedDerivative[#1,CovDOfMetric[#2]]&,expr,InducedMetrics]
];


ToMetric[expr_,metric1_?MetricQ]:=If[InducedFrom@metric1=!=Null,expr,
Module[{res,preexpression},
Off[ConformalRules::unknown];
With[{cd1=CovDOfMetric[metric1],$CovDsNotInduced=Select[Rest@$CovDs,InducedFrom[MetricOfCovD[#]]===Null&]},
With[{$CovDsNotInducedRelatedTocd1=Select[$CovDsNotInduced,(Catch@ConformalRules[metric1,MetricOfCovD[#]]=!=Null)&]},

preexpression=(RemoveAllInducedDerivatives[expr]//ProjectorToMetric//EinsteinToRicci//WeylToRiemann//ContractMetric//ToCanonical);

res=ChangeCovD[#,$CovDsNotInduced,cd1]&@
ChristoffelToGradConformal[#,$CovDsNotInducedRelatedTocd1,cd1]&@
MyChangeChristoffel[#,$CovDsNotInducedRelatedTocd1,cd1]&@
ChangeCovD[#,$CovDsNotInduced,cd1]&@
ChangeCurvature[#,$CovDsNotInduced,cd1]&@preexpression;
Off[ConformalRules::unknown];

Fold[(#1/.ConformalRules[MetricOfCovD[#2],metric1])&,res,$CovDsNotInducedRelatedTocd1]
]
]
]
];

ToMetric[expr_]:=ToMetric[expr,First@$Metrics];

SetNumberOfArguments[ToMetric,{1,2}]
Protect[ToMetric];


InverseMetricQ[x_?xTensorQ]:=With[{tid=TensorID@x},(Length@tid>0)&&(tid[[1]]===xAct`xTensor`Private`InvMetric)]
InverseMetricQ[_]:=False


SeparateIndicesDownOfInverseMetric[invmetric_?InverseMetricQ][expr_]:=Fold[SeparateMetric[First@$Metrics][#1,#2]&,expr,IndicesOf[Down,invmetric][expr]];
SeparateIndicesDownOfInverseMetric[_][expr_]:=expr


Conformal[metricbase_?MetricQ][metric1_?MetricQ,metric2_?MetricQ][expr_]:=Module[{cdb,cd1,cd2,res,res2,(*oldpre,*)resbis,exprnoproj,M,i1,i2,beforeputtingconfheads,IDInvMetric},
(* The conflict with CreenDollarIndicea has now been solved. So there is no need to redefine tempararoly $PrePrint*)
(*oldpre=$PrePrint;$PrePrint=Identity;*)

(* we define the Covds associated with the metric. The starting metric is metric1, the conformally transformed metric is metric2, and metricbase i the base metric for raising and lowering indiced. It might be one of the other two, but it might not be...*)
cdb=CovDOfMetric[metricbase];
cd1=CovDOfMetric[metric1];Off[ConformalFactor::"unknown"];
cd2=CovDOfMetric[metric2];

exprnoproj=expr//ProjectorToMetric;
M=ManifoldOfCovD[cd1];
i1=DummyIn[Tangent[M]];
i2=DummyIn[Tangent[M]];

IDInvMetric=SeparateIndicesDownOfInverseMetric[Inv[metric1]];

beforeputtingconfheads=IDInvMetric[(IndicesDown@ToMetric[exprnoproj,metric1])
/.Scalar[ex_]:>Scalar[IndicesDown[ex]]/.sf_?ScalarFunctionQ[args___]:>sf@@IndicesDown/@{args}]
/.Scalar[ex_]:>Scalar[IDInvMetric[ex]]/.sf_?ScalarFunctionQ[args___]:>sf@@IDInvMetric/@{args};
(* Above we make sure that IndicesDown and SeparateIndicesDownOfInverseMetric goes inside the scalar Head*)

(*We use ToMetric to have only references to the metric1 and its associated CovD and curvature tensors *)
(*Print["beforeputtingconfheads ",beforeputtingconfheads];*)

(* Then we place the ConfHead on every expression to perform formally the conformal transformation. *)
res=(beforeputtingconfheads
(* Dirty case of scalar functions *)
/.f_?ScalarFunctionQ[ex___]:>ConfHead[metric1,metric2][f[ex]]
(* tensors *)
/.tens_?xTensorQ[inds___]:>ConfHead[metric1,metric2][tens[inds]]
(* Covariant derivatives *)
/.cd1[i1_?DownIndexQ]:>cd2[i1]
(* Now that we have ConfHead everywhere we need to remove the head by specifying the change*)
(* First Obvious rules for metric and inverse metric*)
/.ConfHead[metric1,metric2][metric1[i1_?DownIndexQ,i2_?DownIndexQ]]:>metric2[i1,i2]
/.ConfHead[metric1,metric2][Inv[metric1][i1_?UpIndexQ,i2_?UpIndexQ]]:>Inv[metric2][i1,i2]);

(* And then all other rules to remove the ConfHead*)

resbis=res//.RulesConf[metric1,metric2];


(* So here we have conformally transformed the expression, but now we want to express it in function of the original metric and orginal covD etc...
Indeed at that point, we still have the second metric, and the Riemann of the second metric for instance. SO we use again ToMetric*)

(*$PrePrint=oldpre;*)

On[ConformalFactor::"unknown"];
Off[ToCanonical::"cmods"];

res2=ToCanonical@ContractMetric@NoScalar[ToMetric[resbis,metricbase]];
On[ToCanonical::"cmods"];
res2
]

(* In case the base metric is unspecified, it is the base metric of course...*)
Conformal[metric1_?MetricQ,metric2_?MetricQ][expr_]:=Conformal[First@$Metrics][metric1,metric2][expr]


SplitPerturbations[expr_,ListPairs_List,h_?InducedMetricQ,n_?DirectionVectorQ]:=Print["Dobidoouah"];
SplitPerturbations[expr_,h_?InducedMetricQ,n_?DirectionVectorQ]:=SplitPerturbations[expr,{},h,n]
SetNumberOfArguments[SplitPerturbations,{3,4}]
Protect[SplitPerturbations];


ToLightConeFromRules[expr_,RulesList_List,h_?InducedMetricQ,n_?DirectionVectorQ,order_(*?IntegerQ*)]:=Print["Dobidoouah"];

SetNumberOfArguments[ToLightConeFromRules,{4,5}]
Protect[ToLightConeFromRules]


ExtractComponents[expr_,h_?InducedMetricQ,n_?DirectionVectorQ,roj_List,ListIndsToContract_List]:=Print["Dobidoouah"];

SetNumberOfArguments[ExtractComponents,{3,5}];
Protect[ExtractComponents];

VisualizeTensor[expr_,h_?InducedMetricQ,n_?DirectionVectorQ]:=Print["Dobidoouah"];

SetNumberOfArguments[VisualizeTensor,3];
Protect[VisualizeTensor];


On[RuleDelayed::rhs];


End[]
EndPackage[]
