model Windkessel2Dizertace "Two-element Windkessel model"
  extends Modelica.Icons.Example;
  Physiolibrary.Hydraulic.Sources.UnlimitedPump heart(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-50, 38}, {-30, 58}})));
  Physiolibrary.Hydraulic.Components.ElasticVessel arteries(ZeroPressureVolume(displayUnit = "l") = 0.00085, volume_start(displayUnit = "m3") = 0.00097, Compliance(displayUnit = "m3/Pa") = 1.0500862061839e-08) annotation(Placement(transformation(extent = {{-14, 38}, {6, 58}})));
  Physiolibrary.Hydraulic.Components.Conductor resistance(useConductanceInput = false, Conductance(displayUnit = "m3/(Pa.s)") = 8.1006650191331e-09) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {18, 34})));
  Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-40, 20})));
  Utilities.Pulses pulses(HR = 1.2, QP(displayUnit = "l/min") = 0.000424) annotation(Placement(transformation(extent = {{-84, 58}, {-64, 78}})));
  HydraulicFlowSource hydraulicFlowSource annotation(Placement(transformation(extent = {{-50, -38}, {-30, -18}})));
  HydraulicElastance hydraulicElastance(V0 = 0, p0 = 0, C = 1.0500862061839e-08, V(start = 0.00097)) annotation(Placement(transformation(extent = {{-22, -36}, {-2, -16}})));
  HydraulicConductor hydraulicConductor(G = 8.1006650191331e-09) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {20, -40})));
  HydraulicContraPressure hydraulicContraPressure(contrapressure = 0) annotation(Placement(transformation(extent = {{-46, -64}, {-26, -44}})));
equation
  connect(heart.q_out, arteries.q_in) annotation(Line(points = {{-30, 48}, {-4, 48}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
  connect(resistance.q_out, veins.y) annotation(Line(points = {{18, 24}, {18, 20}, {-30, 20}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
  connect(pulses.volumeflowrate, heart.solutionFlow) annotation(Line(points = {{-65, 68}, {-40, 68}, {-40, 55}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(resistance.q_in, arteries.q_in) annotation(Line(points = {{18, 44}, {18, 48}, {-4, 48}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
  connect(hydraulicFlowSource.qout, hydraulicElastance.qin) annotation(Line(points = {{-33.2, -28}, {-22, -28}, {-22, -26}, {-12, -26}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(hydraulicFlowSource.desiredflow, pulses.volumeflowrate) annotation(Line(points = {{-39.9, -24.9}, {-39.9, -22.45}, {-65, -22.45}, {-65, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(hydraulicElastance.qin, hydraulicConductor.qin) annotation(Line(points = {{-12, -26}, {20, -26}, {20, -31}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(hydraulicConductor.qout, hydraulicContraPressure.qin) annotation(Line(points = {{20, -49}, {-6, -49}, {-6, -54}, {-30.8, -54}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-74, 90}, {46, 80}}, lineColor = {175, 175, 175}, textString = "2-element Windkessel model")}), Documentation(revisions = "<html>
<ul>
<li><i>Sep 2014</i> by Tomas Kulhanek:
<br/>Updated pulse generator and diagram to conform electric analogy diagrams.
</li>
<li><i>May 2014 </i> by Marek Matejak:
<br/>Created.
</li>
</ul>
</html>", info = "<html>
<p>Two-element windkessel model consisting of resistance and compliance element.</p>
<ul>
<li>Frank O (1899) Die Grundform des arteriellen Pulses. Z Biol 37:483&ndash;526</li>
<li>Westerhof, N., Lankhaar, J.-W., &AMP; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &AMP; Biological Engineering &AMP; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
<li><a href=\"http://en.wikipedia.org/wiki/Windkessel_effect\">http://en.wikipedia.org/wiki/Windkessel_effect</a></li>
</ul>
</html>"), experiment(StopTime = 5));
end Windkessel2Dizertace;