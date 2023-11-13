(* ::Package:: *)

MonteCarloIzracunPi[n_Integer]:=Module[{TockeVKrogu,VseTocke,Razmerje,IzracunanPi,NakljucneTocke,ZacetniN},
	ZacetniN=n;

	Do[
		TockeVKrogu=0;
		VseTocke=ZacetniN;
		NakljucneTocke=RandomReal[{-1,1},{VseTocke,2}];
		TockeVKrogu=Count[Map[Norm[#]<=1&,NakljucneTocke],True];
		Razmerje=TockeVKrogu/VseTocke;
		IzracunanPi=N[4 Razmerje];
(*Prikaz rezultatov*)
		Print["Poiskus: ",i];
		Print["\[CapitalSHacek]tevilo to\[CHacek]k: ",VseTocke];
		Print["To\[CHacek]k v krogu: ",TockeVKrogu];
		Print["Ocenjeno \[SHacek]tevilo \[Pi]: ",IzracunanPi];
(*Grafi*)
		Print[
		Graphics[{Purple,Thickness[0.01], Circle[],
			PointSize[Small], Point[NakljucneTocke], 
			Black, Point[Select[NakljucneTocke, Norm[#] > 1 &]], 
			Red, Point[Select[NakljucneTocke, Norm[#] <= 1 &]]}, 
		PlotLabel -> Style["Izra\[CHacek]unan \[Pi] = " <> ToString[IzracunanPi], 15], 
		AxesLabel -> {"x", "y"}, Axes -> True]
		];

		ZacetniN=10 ZacetniN;(*pove\[CHacek]a n za 10-krat*)
		Print["------------------------------------------------------"];
		,{i,4}
	]
]
