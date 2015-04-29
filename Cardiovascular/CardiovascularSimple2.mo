within ;
package CardiovascularSimple2
    extends Modelica.Icons.Package;

  package Examples
    extends Modelica.Icons.ExamplesPackage;
    model Windkessel_2element "Two-element Windkessel model"
      extends Modelica.Icons.Example;
      Physiolibrary.Hydraulic.Sources.UnlimitedPump heart(useSolutionFlowInput=
            true)
        annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        ZeroPressureVolume(displayUnit="l") = 0.00085,
        volume_start(displayUnit="l") = 0.00095,
        Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08)
        annotation (Placement(transformation(extent={{-14,38},{6,58}})));
      Physiolibrary.Hydraulic.Components.Conductor resistance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
          8.1006650191331e-09) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={18,34})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-40,20})));
      Parts.Pulses pulses1(QP(displayUnit="m3/s") = 0.000424, HR=1.2)
        annotation (Placement(transformation(extent={{-64,58},{-44,78}})));
    equation
      connect(heart.q_out, arteries.q_in) annotation (Line(
          points={{-30,48},{-4,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistance.q_out, veins.y) annotation (Line(
          points={{18,24},{18,20},{-30,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulses1.volumeflowrate, heart.solutionFlow) annotation (Line(
          points={{-45,68},{-40,68},{-40,52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(resistance.q_in, arteries.q_in) annotation (Line(
          points={{18,44},{18,48},{-4,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
                  extent={{-74,90},{46,80}},
                  lineColor={175,175,175},
                  textString="2-element Windkessel model")}),
        Documentation(revisions="<html>
<ul>
<li><i>Sep 2014</i> by Tomas Kulhanek:
<br/>Updated pulse generator and diagram to conform electric analogy diagrams.
</li>
<li><i>May 2014 </i> by Marek Matejak:
<br/>Created.
</li>
</ul>
</html>", info="<html>
<p>Two-element windkessel model consisting of resistance and compliance element.</p>
<ul>
<li>Frank O (1899) Die Grundform des arteriellen Pulses. Z Biol 37:483&ndash;526</li>
<li>Westerhof, N., Lankhaar, J.-W., &AMP; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &AMP; Biological Engineering &AMP; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
<li><a href=\"http://en.wikipedia.org/wiki/Windkessel_effect\">http://en.wikipedia.org/wiki/Windkessel_effect</a></li>
</ul>
</html>"),
        experiment(StopTime=10));
    end Windkessel_2element;

    model TwoBaloon
      "Example of two elastic baloons with liquid connected via resistor"
      extends Modelica.Icons.Example;
      Physiolibrary.Hydraulic.Components.ElasticVessel balloon1(
        volume_start=0.000501,
        ZeroPressureVolume=0.0005,
        Compliance=1.5001231516913e-08)
        annotation (Placement(transformation(extent={{-40,-12},{-20,8}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel balloon2(
        volume_start=0.002,
        ZeroPressureVolume=0.0005,
        Compliance=7.5006157584566e-09)
        annotation (Placement(transformation(extent={{24,-12},{44,8}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(Conductance(
            displayUnit="ml/(mmHg.s)") = 7.5006157584566e-09) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={0,-2})));
    equation
      connect(balloon1.q_in, conductor.q_in) annotation (Line(
          points={{-30,-2},{-10,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(conductor.q_out, balloon2.q_in) annotation (Line(
          points={{10,-2},{34,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics), Documentation(revisions="<html>
<ul>
<li><i>Sep 2014</i> by Tomas Kulhanek: <br>Created. </li>
</ul>
</html>", info="<html>
<p>Experiment with liquid and two balloons connected with resistor. </p>
</html>"));
    end TwoBaloon;

    model Windkessel_3element "Three-element windkessel model"
      extends Modelica.Icons.Example;
      Physiolibrary.Hydraulic.Sources.UnlimitedPump heart(useSolutionFlowInput=
            true)
        annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        ZeroPressureVolume(displayUnit="l") = 0.00085,
        Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08,
        volume_start(displayUnit="l") = 0.00097)
        annotation (Placement(transformation(extent={{16,38},{36,58}})));
      Physiolibrary.Hydraulic.Components.Conductor resistance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)") = 8.1006650191331e-09)
                               annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={50,34})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-40,20})));
      Parts.Pulses pulses1(
        QP(displayUnit="m3/s") = 0.000424,
        TD1(displayUnit="s"),
        HR(displayUnit="1/min") = 1.2)
        annotation (Placement(transformation(extent={{-64,58},{-44,78}})));
      Physiolibrary.Hydraulic.Components.Conductor impedance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
          1.5001231516913e-06) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-6,50})));
    equation
      connect(resistance.q_out, veins.y) annotation (Line(
          points={{50,24},{50,20},{-30,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulses1.volumeflowrate, heart.solutionFlow) annotation (Line(
          points={{-45,68},{-40,68},{-40,52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heart.q_out, impedance.q_in) annotation (Line(
          points={{-30,48},{-24,48},{-24,50},{-16,50}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(impedance.q_out, arteries.q_in) annotation (Line(
          points={{4,50},{16,50},{16,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistance.q_in, arteries.q_in) annotation (Line(
          points={{50,44},{50,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
                  extent={{-74,90},{46,80}},
                  lineColor={175,175,175},
                  textString="3-element Windkessel model")}),
        Documentation(revisions="<html>
<ul>
<li><i>Sep 2014</i> by Tomas Kulhanek: <br>Created. </li>
</ul>
<p> </p>
</html>", info="<html>
<p>Three-element windkessel model, updated two-element windkessel model with an impedance element. Impedance can be approximated by resistance.</p>
<ul>
<li>Westerhof N, Elzinga G (1991) Normalized input impedance and arterial decay time over heart period are independent of animal size. Am J Physiol 261:R126&ndash;R133</li>
<li>Westerhof, N., Lankhaar, J.-W., &AMP; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &AMP; Biological Engineering &AMP; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
</ul>
</html>"),
        experiment(StopTime=10));
    end Windkessel_3element;

    model Windkessel_4element "Four-element windkessel model"
      extends Modelica.Icons.Example;
      Physiolibrary.Hydraulic.Sources.UnlimitedPump heart(useSolutionFlowInput=
            true)
        annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        ZeroPressureVolume(displayUnit="l") = 0.00085,
        Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08,
        volume_start(displayUnit="l") = 0.00097)
        annotation (Placement(transformation(extent={{16,38},{36,58}})));
      Physiolibrary.Hydraulic.Components.Conductor resistance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)") = 8.1006650191331e-09)
                               annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={48,34})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-40,20})));
      Parts.Pulses pulses1(HR=1.2, QP(displayUnit="m3/s") = 0.000424)
        annotation (Placement(transformation(extent={{-64,58},{-44,78}})));
      Physiolibrary.Hydraulic.Components.Conductor impedance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
          1.5001231516913e-06) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-6,48})));
      Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit=
              "mmHg.s2/ml") = 666611.937075, volumeFlow_start(displayUnit=
              "l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-16,56},{4,76}})));
    equation
      connect(resistance.q_out, veins.y) annotation (Line(
          points={{48,24},{48,20},{-30,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulses1.volumeflowrate, heart.solutionFlow) annotation (Line(
          points={{-45,68},{-40,68},{-40,52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heart.q_out, impedance.q_in) annotation (Line(
          points={{-30,48},{-16,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(impedance.q_out, arteries.q_in) annotation (Line(
          points={{4,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heart.q_out, inertia.q_in) annotation (Line(
          points={{-30,48},{-26,48},{-26,66},{-16,66}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(inertia.q_out, arteries.q_in) annotation (Line(
          points={{4,66},{12,66},{12,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistance.q_in, arteries.q_in) annotation (Line(
          points={{48,44},{48,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
                  extent={{-74,90},{46,80}},
                  lineColor={175,175,175},
                  textString="4-element Windkessel model")}),
        Documentation(revisions="<html>
<ul>
<li><i>Sep 2014</i> by Tomas Kulhanek: <br>Created. </li>
</ul>
</html>", info="<html>
<p>Four-element windkessel model, updated three-element windkessel model with an inertia element. </p>
<ul>
<li>Stergiopulos N, Westerhof BE, Westerhof N (1999) Total arterial inertance as the fourth element of the windkessel model. Am J Physiol 276:H81&ndash;H88</li>
<li>Westerhof, N., Lankhaar, J.-W., &AMP; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &AMP; Biological Engineering &AMP; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
</ul>
</html>"),
        experiment(StopTime=10));
    end Windkessel_4element;

  end Examples;

  package Models
    extends Modelica.Icons.ExamplesPackage;
    model NonPulsatileCirculation
      extends Physiolibrary.Icons.CardioVascular;
      Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryArteries(
        useV0Input=true,
        useComplianceInput=true,
        volume_start=0.000373)
        annotation (Placement(transformation(extent={{-40,28},{-20,48}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CAP(k=
            2.2576853432954e-08)
        annotation (Placement(transformation(extent={{-50,56},{-36,70}})));
      Physiolibrary.Types.Constants.VolumeConst V0AP(k=0.000327)
        annotation (Placement(transformation(extent={{-66,44},{-52,58}})));
      Physiolibrary.Hydraulic.Components.Conductor TotalPulmonaryResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-2,28},{18,48}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RP(k(
            displayUnit="(Pa.s)/m3") = 9332567.11905)
        annotation (Placement(transformation(extent={{-6,60},{6,70}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryVeins(
        useV0Input=true,
        useComplianceInput=true,
        volume_start=0.000704)
        annotation (Placement(transformation(extent={{42,28},{62,48}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CVP(k=
            2.250184727537e-07)
        annotation (Placement(transformation(extent={{36,60},{50,74}})));
      Physiolibrary.Types.Constants.VolumeConst V0VP(k=0.000435)
        annotation (Placement(transformation(extent={{20,48},{34,62}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel SystemicVeins(
        useV0Input=true,
        useComplianceInput=true,
        volume_start=0.003922)
        annotation (Placement(transformation(extent={{-46,-70},{-26,-50}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CVS(k=
            1.5001231516913e-06)
        annotation (Placement(transformation(extent={{-52,-42},{-38,-28}})));
      Physiolibrary.Types.Constants.VolumeConst V0VS(k=0.002845)
        annotation (Placement(transformation(extent={{-74,-54},{-60,-40}})));
      Physiolibrary.Hydraulic.Components.Conductor TotalSystemicResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{16,-70},{-4,-50}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RT(k(
            displayUnit="(Pa.s)/m3") = 133322387.415)
        annotation (Placement(transformation(extent={{-14,-50},{-4,-40}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel SystemicArteries(
        useV0Input=true,
        useComplianceInput=true,
        volume_start=0.000672)
        annotation (Placement(transformation(extent={{36,-70},{56,-50}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CAS(k=
            1.1250923637685e-08)
        annotation (Placement(transformation(extent={{30,-38},{44,-24}})));
      Physiolibrary.Types.Constants.VolumeConst V0AS(k=0.000529)
        annotation (Placement(transformation(extent={{14,-50},{28,-36}})));
      replaceable CardiovascularSimple2.Parts.HeartPump rightHeart(
          StarlingSlope(displayUnit="ml/(mmHg.s)") = 1.2503526469347e-07)
        annotation (Placement(transformation(extent={{-72,-10},{-48,16}})));
      replaceable CardiovascularSimple2.Parts.HeartPump leftHeart(
          StarlingSlope(displayUnit="m3/(Pa.s)") = 7.5006157584566e-08)
        annotation (Placement(transformation(extent={{74,-10},{52,10}})));
    equation
      connect(CAP.y, PulmonaryArteries.compliance) annotation (Line(
          points={{-34.25,63},{-30,63},{-30,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(V0AP.y, PulmonaryArteries.zeroPressureVolume) annotation (Line(
          points={{-50.25,51},{-50.25,50.5},{-38,50.5},{-38,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RP.y, TotalPulmonaryResistance.cond) annotation (Line(
          points={{7.5,65},{8,65},{8,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CVP.y, PulmonaryVeins.compliance) annotation (Line(
          points={{51.75,67},{52,67},{52,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CVS.y, SystemicVeins.compliance) annotation (Line(
          points={{-36.25,-35},{-36,-35},{-36,-52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RT.y, TotalSystemicResistance.cond) annotation (Line(
          points={{-2.75,-45},{6,-45},{6,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CAS.y, SystemicArteries.compliance) annotation (Line(
          points={{45.75,-31},{46,-31},{46,-52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PulmonaryArteries.q_in, TotalPulmonaryResistance.q_in)
        annotation (Line(
          points={{-30,38},{-2,38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(TotalPulmonaryResistance.q_out, PulmonaryVeins.q_in)
        annotation (Line(
          points={{18,38},{52,38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(PulmonaryVeins.q_in, leftHeart.inflow) annotation (Line(
          points={{52,38},{74,38},{74,4.44089e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.outflow, SystemicArteries.q_in) annotation (Line(
          points={{57.28,1.2},{57.28,-60},{46,-60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SystemicArteries.q_in, TotalSystemicResistance.q_in)
        annotation (Line(
          points={{46,-60},{16,-60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(TotalSystemicResistance.q_out, SystemicVeins.q_in) annotation (
          Line(
          points={{-4,-60},{-36,-60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SystemicVeins.q_in, rightHeart.inflow) annotation (Line(
          points={{-36,-60},{-78,-60},{-78,3},{-72,3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(PulmonaryVeins.zeroPressureVolume, V0VP.y) annotation (Line(
          points={{44,46},{40,46},{40,55},{35.75,55}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SystemicVeins.zeroPressureVolume, V0VS.y) annotation (Line(
          points={{-44,-52},{-52,-52},{-52,-47},{-58.25,-47}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(V0AS.y, SystemicArteries.zeroPressureVolume) annotation (Line(
          points={{29.75,-43},{38,-43},{38,-52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart.outflow, PulmonaryArteries.q_in) annotation (Line(
          points={{-53.76,4.56},{-53.76,38},{-30,38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),        graphics), Documentation(info="<html>
<p>Model of cardiovascular system using to demonstrate elastic and resistance features of veins and arteries in pulmonary and systemic circulation and influence of cardiac output on it. </p>
<ul>
<li>J. Kofranek, S. Matousek, J. Rusz, P. Stodulka, P. Privitzer,M. Matejak, M. Tribula, The Atlas of Physiology and Pathophysiology: Web-based multimedia enabled interactive simulations., Comput. Methods Programs Biomed. 104 (2) (2011) 143&ndash;53. doi:10.1016/j.cmpb.2010.12.007.</li>
<li><a href=\"http://physiome.cz/atlas/cirkulace/05/SimpleUncontrolledSimulation.html\">http://physiome.cz/atlas/cirkulace/05/SimpleUncontrolledSimulation.html</a></li>
</ul>
</html>",     revisions="<html>
<ul>
<li><i>Sep 2014 </i>by Martin Tribula and Tomas Kulhanek: <br>Created in Physiolibrary </li>
</ul>
</html>"));
    end NonPulsatileCirculation;

    model PulsatileCirculation
      extends CardiovascularSimple2.Models.NonPulsatileCirculation(
        redeclare CardiovascularSimple2.Parts.PulsatileHeartPump
          rightHeart(pulses(QP=0.000338)),
        redeclare CardiovascularSimple2.Parts.PulsatileHeartPump
          leftHeart(pulses(QP=0.000338)),
        CAS(k=7.2755972857029e-09),
        SystemicArteries(volume_start=0.000603),
        SystemicVeins(volume_start=0.003991));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),        graphics), Documentation(revisions="<html>
<ul>
<li><i>Sep 2014</i> by Tomas Kulhanek: <br>Created. </li>
</ul>
</html>"));
    end PulsatileCirculation;

    model Fernandez2013CVS_flat

      Physiolibrary.Hydraulic.Components.Conductor RPulmonaryVeins(
          useConductanceInput=false, Conductance(displayUnit="m3/(Pa.s)")=
          7.425609600872e-08)                                      annotation(Placement(visible = true, transformation(origin = {-220, 60}, extent = {{15, -15}, {-15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.Inertia pulmonaryVeinsInertia(
          volumeFlow_start(displayUnit="m3/s") = 2.225e-05, I(displayUnit=
              "Pa.s2/m3") = 410632.9532382)                            annotation(Placement(visible = true, transformation(origin={-278,60},    extent = {{15, -15}, {-15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.Conductor RPulmonaryArtery(
          useConductanceInput=false, Conductance(displayUnit="m3/(Pa.s)")=
          2.2216823876548e-07)                                      annotation(Placement(visible = true, transformation(origin={200,58},    extent = {{17.5, -17.5}, {-17.5, 17.5}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.Inertia pulmonaryArterialInertia(
          volumeFlow_start(displayUnit="ml/min") = 7.3233333333333e-07, I(
            displayUnit="mmHg.s2/ml") = 99991.79056125)                   annotation(Placement(visible = true, transformation(origin={158,58},    extent = {{15, -15}, {-15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(
        useComplianceInput=false,
        volume_start(displayUnit="ml") = 0.0006597,
        ZeroPressureVolume=0.0001,
        Compliance(displayUnit="ml/mmHg") = 3.5027875591992e-07)      annotation(Placement(visible = true, transformation(origin={-279,-3},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.IdealValve mitralValve(
                                  useLimitationInputs=false, _Gon(displayUnit=
             "ml/(mmHg.s)") = 1.9996641612045e-06)              annotation(Placement(visible = true, transformation(origin={-243,-3},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle(
          useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.0002097,
        ZeroPressureVolume=9e-05)                                    annotation(Placement(visible = true, transformation(origin={-209,-3},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.Conductor RLeftMyo(useConductanceInput=false,
          Conductance(displayUnit="m3/(Pa.s)") = 9.3757696980707e-08)
                                                            annotation(Placement(visible = true, transformation(origin={-181,-3},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.IdealValve aorticValve(_Gon(displayUnit="ml/(mmHg.s)")=
             1.9996641612045e-06, useLimitationInputs=false)    annotation(Placement(visible = true, transformation(origin={-143,-3},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.ElasticVessel aorta(
        volume_start=4.6e-05,
        ZeroPressureVolume=3e-05,
        Compliance(displayUnit="ml/mmHg") = 1.6501354668604e-09)
                                                             annotation(Placement(visible = true, transformation(origin={-111,-3},   extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.Conductor Raorta(useConductanceInput=false,
          Conductance(displayUnit="m3/(Pa.s)") = 1.1108411938274e-07)
                                                          annotation(Placement(visible = true, transformation(origin={-79,-3},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.Inertia aorticInertia(
          volumeFlow_start(displayUnit="m3/s") = 1.0385e-05, I(displayUnit=
              "Pa.s2/m3") = 109990.96961737)                   annotation(Placement(visible = true, transformation(origin={-37,-3},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        volume_start=0.000805,
        ZeroPressureVolume=0.0007,
        Compliance(displayUnit="ml/mmHg") = 1.0950899007347e-08)
                                                                annotation(Placement(visible = true, transformation(origin={-1,-3},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.Conductor RSystemic(useConductanceInput=false,
          Conductance(displayUnit="m3/(Pa.s)") = 7.5006157584566e-09)
                                                             annotation(Placement(visible = true, transformation(origin={31,-3},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.Inertia systemicInertia(
          volumeFlow_start(displayUnit="m3/s") = 7.935e-05, I(displayUnit=
              "Pa.s2/m3") = 479960.594694)                       annotation(Placement(visible = true, transformation(origin={75,-3},     extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.IdealValve tricuspidValve(
          useLimitationInputs=false, _Gon(displayUnit="ml/(mmHg.s)") = 1.9996641612045e-06)
                                                                   annotation(Placement(visible = true, transformation(origin={137,-3},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(
          useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.00018,
        ZeroPressureVolume=7e-05)                                     annotation(Placement(visible = true, transformation(origin={171,-3},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.Conductor RRightMyo(useConductanceInput=false,
          Conductance(displayUnit="m3/(Pa.s)") = 4.2858518443821e-07)
                                                             annotation(Placement(visible = true, transformation(origin={207,-3},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.IdealValve pulmonaryValve(_Gon(displayUnit=
             "ml/(mmHg.s)") = 1.9996641612045e-06, useLimitationInputs=false)
                                                                   annotation(Placement(visible = true, transformation(origin={245,-3},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArtery(
        volume_start=2.1e-05,
        ZeroPressureVolume=2e-05,
        Compliance(displayUnit="m3/Pa") = 6.7505541826109e-10)         annotation(Placement(visible = true, transformation(origin={243,57},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArterioles(
        volume_start=0.000637,
        ZeroPressureVolume=0.0006,
        Compliance(displayUnit="ml/mmHg") = 2.0026644075079e-08)           annotation(Placement(visible = true, transformation(origin={124,58},    extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Physiolibrary.Hydraulic.Components.ElasticVessel veins(
        volume_start(displayUnit="ml") = 0.002443,
        ZeroPressureVolume=0.00237,
        Compliance(displayUnit="ml/mmHg") = 1.5001231516913e-07)
        annotation (Placement(visible=true, transformation(
            origin={105,-3},
            extent={{-15,-15},{15,15}},
            rotation=0)));
      CardiovascularSimple2.Parts.TimeVaryingElastance timeVaryingElastanceLeft(
        Ed(displayUnit="mmHg/ml") = 13332238.7415,
        Es(displayUnit="mmHg/ml") = 183318282.69563,
        Pi0(displayUnit="mmHg") = 6666.11937075)
        annotation (Placement(transformation(extent={{-222,16},{-202,36}})));
      CardiovascularSimple2.Parts.TimeVaryingElastance timeVaryingElastanceRight(
        Ed(displayUnit="mmHg/ml") = 3999671.62245,
        Es(displayUnit="mmHg/ml") = 43729743.0721,
        Pi0(displayUnit="mmHg") = 3199.73729796)
        annotation (Placement(transformation(extent={{164,18},{184,38}})));
      Physiolibrary.Types.Constants.FrequencyConst heartRate(k(displayUnit=
              "Hz") = 1.2)
        annotation (Placement(transformation(extent={{-262,30},{-244,42}})));
    equation
      connect(aorta.q_in, Raorta.q_in) annotation (Line(
          points={{-111,-3},{-94,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Raorta.q_out, aorticInertia.q_in) annotation (Line(
          points={{-64,-3},{-52,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicInertia.q_out, veins.q_in) annotation (Line(
          points={{90,-3},{105,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(timeVaryingElastanceLeft.C, leftVentricle.compliance)
        annotation (Line(
          points={{-212,17},{-209,17},{-209,9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(timeVaryingElastanceRight.C, rightVentricle.compliance)
        annotation (Line(
          points={{174,19},{174,9},{171,9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(veins.q_in, tricuspidValve.q_in) annotation (Line(
          points={{105,-3},{122,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(timeVaryingElastanceLeft.Pi, leftVentricle.externalPressure)
        annotation (Line(
          points={{-205,17},{-205,16.5},{-197,16.5},{-197,9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(timeVaryingElastanceRight.Pi, rightVentricle.externalPressure)
        annotation (Line(
          points={{181,19},{181,9},{183,9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartRate.y, timeVaryingElastanceLeft.HR) annotation (Line(
          points={{-241.75,36},{-232.375,36},{-232.375,33.6},{-220.6,33.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(aorticInertia.q_out, arteries.q_in) annotation (Line(
          points={{-22,-3},{-1,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arteries.q_in, RSystemic.q_in) annotation (Line(
          points={{-1,-3},{16,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RSystemic.q_out, systemicInertia.q_in) annotation (Line(
          points={{46,-3},{60,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightVentricle.q_in, tricuspidValve.q_out) annotation (Line(
          points={{171,-3},{152,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RRightMyo.q_in, rightVentricle.q_in) annotation (Line(
          points={{192,-3},{171,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heartRate.y, timeVaryingElastanceRight.HR) annotation (Line(
          points={{-241.75,36},{-34,36},{-34,35.6},{165.4,35.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RRightMyo.q_out, pulmonaryValve.q_in) annotation (Line(
          points={{222,-3},{230,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryValve.q_out, pulmonaryArtery.q_in) annotation (Line(
          points={{260,-3},{266,-3},{266,57},{243,57}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryArtery.q_in, RPulmonaryArtery.q_in) annotation (Line(
          points={{243,57},{243,58},{217.5,58}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RPulmonaryArtery.q_out, pulmonaryArterialInertia.q_in)
        annotation (Line(
          points={{182.5,58},{173,58}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryArterialInertia.q_out, pulmonaryArterioles.q_in)
        annotation (Line(
          points={{143,58},{124,58}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryArterioles.q_in, RPulmonaryVeins.q_in) annotation (
          Line(
          points={{124,58},{-42,58},{-42,60},{-205,60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RPulmonaryVeins.q_out, pulmonaryVeinsInertia.q_in) annotation (
          Line(
          points={{-235,60},{-263,60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryVeinsInertia.q_out, pulmonaryVeins.q_in) annotation (
          Line(
          points={{-293,60},{-296,60},{-296,-3},{-279,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryVeins.q_in, mitralValve.q_in) annotation (Line(
          points={{-279,-3},{-258,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(mitralValve.q_out, leftVentricle.q_in) annotation (Line(
          points={{-228,-3},{-209,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftVentricle.q_in, RLeftMyo.q_in) annotation (Line(
          points={{-209,-3},{-196,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(aorticValve.q_out, aorta.q_in) annotation (Line(
          points={{-128,-3},{-111,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RLeftMyo.q_out, aorticValve.q_in) annotation (Line(
          points={{-166,-3},{-158,-3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation(Diagram(coordinateSystem(extent={{-350,-100},{400,100}},      preserveAspectRatio=false,  initialScale = 0.1, grid = {2, 2}),
            graphics),                                                                                                    Icon(coordinateSystem(extent={{-350,
                -100},{400,100}},                                                                                                    preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
        Documentation(info="<html>
<p>This model is implementation of CVS model in Physiolibrary published by</p>
<ul>
<li>Fernandez de Canete, J., del Saz-Orozco, P., Moreno-Boza, D., &AMP; Duran-Venegas, E. (2013). Object-oriented modeling and simulation of the closed loop cardiovascular system by using SIMSCAPE. <i>Computers in Biology and Medicine</i>, <i>43</i>(4), 323&ndash;33. doi:10.1016/j.compbiomed.2013.01.007</li>
</ul>
</html>",     revisions="<html>
<ul>
<li><i>Jul 2014</i> by Tomas Kulhanek: <br>Created. </li>
<li><i>Oct 2014</i> by Tomas Kulhanek:<br>Modified initial values and corrected values of parameters according to original article.</li>
</ul>
</html>"));
    end Fernandez2013CVS_flat;
  end Models;

  package Parts
    extends Modelica.Icons.BasesPackage;
    model HeartPump

      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
         Placement(transformation(extent={{-142,-62},{-122,-42}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow
        annotation (Placement(transformation(extent={{-144,-66},{-124,-46}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      parameter Physiolibrary.Types.HydraulicConductance StarlingSlope;
    equation
      inflow.q + outflow.q = 0;
      inflow.q = StarlingSlope*inflow.pressure;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Polygon(
                      points={{32,-34},{24,-24},{18,-10},{18,-8},{22,22},{
                24,24},{34,40},{30,70},{26,82},{-22,100},{-26,42},{-26,40},
                {-30,-6},{-30,-10},{-6,-40},{52,-74},{32,-34}},
                      lineColor={0,0,127},
                      smooth=Smooth.Bezier,
                      fillColor={255,170,170},
                      fillPattern=FillPattern.Solid),Text(
                      extent={{-100,-60},{102,-98}},
                      lineColor={0,0,127},
                      fillColor={255,170,170},
                      fillPattern=FillPattern.Solid,
                      textString="%name")}));
    end HeartPump;

    model PulsatileHeartPump

      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
         Placement(transformation(extent={{-64,0},{-44,20}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow
        annotation (Placement(transformation(extent={{42,2},{62,22}}),
            iconTransformation(extent={{42,2},{62,22}})));
      Pulses pulses
        annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
      Physiolibrary.Hydraulic.Components.Pump pump(useSolutionFlowInput=
            true)
        annotation (Placement(transformation(extent={{-14,2},{6,22}})));
      parameter Physiolibrary.Types.HydraulicConductance StarlingSlope;
    equation
      connect(pump.q_out, outflow) annotation (Line(
          points={{6,12},{52,12}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pump.solutionFlow, pulses.volumeflowrate) annotation (Line(
          points={{-4,16},{-4,40},{-21,40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow, pump.q_in) annotation (Line(
          points={{-54,10},{-34,10},{-34,12},{-14,12}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(inflow, inflow) annotation (Line(
          points={{-54,10},{-54,10}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Polygon(
                      points={{32,-34},{24,-24},{18,-10},{18,-8},{22,22},{
                24,24},{34,40},{30,70},{26,82},{-22,100},{-26,42},{-26,40},
                {-30,-6},{-30,-10},{-6,-40},{52,-74},{32,-34}},
                      lineColor={0,0,127},
                      smooth=Smooth.Bezier,
                      fillColor={255,170,170},
                      fillPattern=FillPattern.Solid),Text(
                      extent={{-100,-60},{102,-98}},
                      lineColor={0,0,127},
                      fillColor={255,170,170},
                      fillPattern=FillPattern.Solid,
                      textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end PulsatileHeartPump;

    model TimeVaryingElastance
      parameter Physiolibrary.Types.HydraulicElastance Ed
        "elastance of diastole";
      parameter Physiolibrary.Types.HydraulicElastance Es
        "elastance of systole";
      parameter Physiolibrary.Types.Pressure Pi0 "peak isovolumic pressure";
      Physiolibrary.Types.Time tm
        "relative time from the beginning of cardiac cycle";
      discrete Physiolibrary.Types.Time HP "heart period";
      discrete Physiolibrary.Types.Time t0
        "time of beginning of the cardiac cycle";
      discrete Physiolibrary.Types.Time ts "duration of systole";
      Real a;
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput C
        annotation (Placement(transformation(extent={{-4,-102},{16,-82}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-90})));
            Physiolibrary.Types.HydraulicElastance E;
      Physiolibrary.Types.RealIO.PressureOutput Pi annotation (Placement(
            transformation(extent={{-72,-100},{-52,-80}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={70,-90})));
      Physiolibrary.Types.RealIO.FrequencyInput HR "heart rate" annotation (Placement(
            transformation(extent={{-106,56},{-66,96}}), iconTransformation(extent={
                {-106,56},{-66,96}})));
    equation
      tm = time - pre(t0);
      if (tm<pre(ts)) then
        a= (1-cos(2*Modelica.Constants.pi*tm/pre(ts)))/2;
      else
        a=0;
      end if;
      E=Ed+Es*a;
      C=1/E;
      Pi = Pi0*a;
      when {initial(), tm >= pre(HP)} then
        HP = 1/HR;
        t0= time;
        ts = 0.16+0.3*HP;
      end when;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={
            Rectangle(
              extent={{-80,80},{80,-80}},
              lineColor={0,0,255},
              fillColor={170,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-78,0},{-68,18},{-54,52},{-44,64},{-30,60},{-26,46}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{-26,46},{-26,32},{-20,10},{-8,2},{36,2},{80,2}},
              color={0,0,255},
              smooth=Smooth.None),
            Text(
              extent={{-70,98},{-22,80}},
              lineColor={0,0,255},
              textString="HR"),
            Text(
              extent={{-74,-40},{40,-80}},
              lineColor={0,0,255},
              textString="Et"),
            Text(
              extent={{42,-40},{100,-80}},
              lineColor={0,0,255},
              textString="Pi"),
            Text(
              extent={{-272,16},{276,-40}},
              lineColor={0,0,255},
              textString="%name")}));
    end TimeVaryingElastance;

    model Pulses "example pulse flow generator"
      import Physiolibrary.Types.*;
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput volumeflowrate
        annotation (Placement(transformation(extent={{80,-10},{100,10}}),
            iconTransformation(extent={{80,-10},{100,10}})));
      discrete Time T0 "begining of cardiac cycle";
      Boolean b(start=false);
      discrete Time HP "duration of cardiac cycle";
      parameter Frequency HR=1.2;
      Time tc "relative time in carciac cycle";
      parameter Time TD1=0.07 "relative time of start of systole";
      discrete Time TD2 "relative time of end of systole";
      parameter VolumeFlowRate QP=0.000424 "peak volume flowrate";
    equation
      b = time - pre(T0) >= pre(HP) "true if new cardiac cycle begins";
      when {initial(),b} then
        T0 = time "set begining of cardiac cycle";
        HP = 1/HR "update length of carciac cycle";
        TD2 = TD1 + (2/5)*HP "compute end time of systole";
      end when;
      tc = time - T0 "relative time in carciac cycle";
      volumeflowrate = if tc < TD1 then 0 else if tc < TD2 then sin((tc - TD1)/
        (TD2 - TD1)*Modelica.Constants.pi)*QP else 0
        "zero before and after systole, otherwise sin up to peak flow";
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
                  extent={{-80,80},{80,-80}},
                  lineColor={0,0,255},
                  fillColor={255,255,170},
                  fillPattern=FillPattern.Solid),Line(
                  points={{-70,0},{-50,0},{-48,2},{-42,52},{-36,60},{-28,52},{-24,
                2},{-20,0},{14,0},{18,2},{24,48},{24,54},{32,58},{40,50},{44,2},
                {50,0},{74,0}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}));
    end Pulses;
  end Parts;
  annotation (uses(
      Modelica(version="3.2.1"), Physiolibrary(version="2.3.0-beta")),
    version="1",
    conversion(noneFromVersion=""));
end CardiovascularSimple2;
